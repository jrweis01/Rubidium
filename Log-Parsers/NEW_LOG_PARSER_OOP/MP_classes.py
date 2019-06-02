import re
import sys
import os
from my_log_classes import TrigLogFile
from templates_data import *

class TrigASRMobilPhoneLog_MP(TrigLogFile):
    '''"Trigger Ignored" * "Trigger" * "Waiting for Trigger" "VOX Closed" "VOX Closed Timeout"
    "Amazon Listening" "Amazon Speaking" * "Amazon Processing"'''
    MP_results_list_for_complete_log = EXCEL_MP_CMD_TEMPLATE_PER_LOG + EXCEL_MP_CMD_TEMPLATE_PER_CMD
    MP_results_list_per_cmd = EXCEL_MP_CMD_TEMPLATE_PER_CMD
    _env = "MP"
    matching_excel_sheet = 'MP_mTRIG_sASR'

    def __init__(self , name):
        super(TrigASRMobilPhoneLog_MP, self).__init__(name)
        # TrigLogFile.__init__(self, name)
        self.trig_or_asr_cmd = 'trig'
        self.num_of_files_trig = 0
        self.num_of_files_asr = 0
        self.append_class_list_to_result_dict()


    def append_class_list_to_result_dict(self):
        for key in self.MP_results_list_for_complete_log:
            self.results_dict[key] = 0

    def make_dict_key_for_singal_trig_cmd_and_set_all_to_zero(self,this_dict,key_name,list_of_items):
        this_dict[key_name] = {}
        for item in list_of_items:
            this_dict[key_name][item] = 0


    def run_log_analysis(self,lines):
        self.cmd_trig = None
        self.cmd_asr  = None
        self.results_per_trig_file = {}
        self.make_dict_key_for_singal_trig_cmd_and_set_all_to_zero(self.results_per_trig_file,'total'
                                                                   ,self.MP_results_list_per_cmd)

        for line_num in xrange(len(lines) - 1):
            log_line = lines[line_num]


            if "playing" in log_line.lower():
                self.cmd_trig = self._is_file_played(log_line,'trig')
                #self.cmd_asr = self._is_file_played(log_line,'asr')


            if self.cmd_trig is not None:
                self.num_of_files_trig += 1
                self.results_dict['num_of_trig_wavs'] +=1

                self.make_dict_key_for_singal_trig_cmd_and_set_all_to_zero(self.results_per_trig_file, self.cmd_trig
                                                                           , self.MP_results_list_per_cmd)
                self.results_per_trig_file[self.cmd_trig]['trig_time_stamp']  = self.get_time_stamp(log_line)
                d = self._get_num_of_lines_between_trig_cmds(lines, line_num)
                for i in range(1, d + 1):
                    try:
                        tmp_line = lines[line_num + i]
                        self._get_MP_result_from_line(tmp_line)
                        self._is_LJ_trig_recognition_in_line(tmp_line)
                        self._is_asr_file_played(tmp_line)
                    except:
                        break
                self.cmd_trig=None



    def _get_MP_result_from_line(self, line):
        line = line.replace('_', ' ').lower()
        line = line.strip('\r\n')

        item = self._is_MP_type_result(line)
        if item:
            item=item.replace(' ','_')
            self.results_per_trig_file[self.cmd_trig][item] += 1
            prev_temp_time_stamp = self.results_per_trig_file[self.cmd_trig]['trig_time_stamp']
            curr_temp_time_stamp = self.get_time_stamp(line)
            tmp_time_stamp = self.timestamp_difference(prev_temp_time_stamp, curr_temp_time_stamp)
            tmp_time_stamp = self.timestamp_seconds_only_in_float(tmp_time_stamp)
            item_latency=item+'_latency'
            self.results_per_trig_file[self.cmd_trig][item_latency] = tmp_time_stamp


    def _is_asr_file_played(self,line):
        self.cmd_asr = self._is_file_played(line, 'asr')
        if self.cmd_asr is not None:
            self.results_dict['num_of_asr_wavs'] += 1


    def _is_LJ_trig_recognition_in_line(self,line):
        if ('lj- trigger' in line.lower()) and ('recognized!' in line.lower()):
            self.results_per_trig_file[self.cmd_trig]['LJ_Trigger'] += 1
            prev_temp_time_stamp = self.results_per_trig_file[self.cmd_trig]['trig_time_stamp']
            curr_temp_time_stamp = self.get_time_stamp(line)
            tmp_time_stamp = self.timestamp_difference(prev_temp_time_stamp, curr_temp_time_stamp)
            tmp_time_stamp = self.timestamp_seconds_only_in_float(tmp_time_stamp)
            self.results_per_trig_file[self.cmd_trig]['LJ_Trigger_latency'] = tmp_time_stamp

    def _get_num_of_lines_between_trig_cmds (self, lines,line_num):
        '''this funtion is similar to '_get_num_of_lines_between_cmds'  but works only on trig
        as requird in this class only as asr commands depends on the current trig file tree/section
        of results'''
        i=1
        line1 = lines[line_num + i]
        while line1 is not None:
            next_cmd_trig = self._is_file_played(line1,'trig')

            if (next_cmd_trig is not None):
                break
            else:
                i+=1
                try: line1 = lines[line_num + i]
                except: return i
        return i

    def _is_MP_type_result(self,line):
        if self._env.lower() in line:
            for item in self.MP_results_list_per_cmd:
                item = item.replace('_',' ')
                if item.lower() in line:
                    try:
                        # strin = "(?<=(mp- )){}".format(item.lower())
                        r = re.search("(?<=(mp- )){}".format(item.lower()), line).group()
                        if r is not None:
                            return item
                    except: pass

            else: return None


    def end_of_log(self):
        self.results_per_trig_file['total']['total_num_of_trig_files']=0
        for key in self.results_per_trig_file:
            if key is not 'total':
                self.results_per_trig_file['total']['total_num_of_trig_files']+=1
                for item in self.results_per_trig_file[key]:
                    if item is not 'trig_time_stamp':
                        self.results_per_trig_file['total'][item] += self.results_per_trig_file[key][item]
        '''adding time avg's:  '''
        tmp_time_avg_dict={}
        for item in self.results_per_trig_file['total']:
            if '_latency' in item:
                enumerator = self.results_per_trig_file['total'][item]
                item_orig = item.replace('_latency','')
                divisor =self.results_per_trig_file['total'][item_orig]
                if divisor == 0:
                    tmp_time_avg_dict[item + '_avg']='unavailble'
                else:
                    tmp_time_avg_dict[item+'_avg'] = round((enumerator/float(divisor)),3)

        self.results_per_trig_file['total'].update(tmp_time_avg_dict)
        self.results_per_trig_file['total']['num_of_asr_wavs']=self.results_dict['num_of_asr_wavs']
        self.results_per_trig_file['total']['num_of_trig_wavs'] = self.results_dict['num_of_trig_wavs']

        for key in self.header_dict:
            self.results_per_trig_file['total'][key] = self.header_dict[key]