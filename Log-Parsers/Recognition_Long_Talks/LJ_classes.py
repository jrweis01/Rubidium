import copy
from templates_data import *
import re
import sys
import os
from my_log_classes import TrigLogFile


class TrigLabJackLog_LJ(TrigLogFile):
    _env = "LJ"
    matching_excel_sheet = 'TRIG_ONLY'
    def __init__(self , name ):
        TrigLogFile.__init__(self, name)

    def run_log_analysis(self,lines):
        for line_num in xrange(len(lines)-1):
            line = lines[line_num]
            cmd = self._is_file_played(line,'trig')


            if cmd:
                self.cmd_time_stamp = self.get_time_stamp(line)
                self.num_of_files += 1
                d = self._get_num_of_lines_between_cmds(lines,line_num)
                if d <= 1: #count of lines with results relevant to the trig played wav (above)
                    self.results_dict["no_recognition"] += 1
                # elif d>3 and ("timeout - 192" not in lines[line_num+2].lower()):
                #     '''completly ignoring files the got more then one result, taken out of statistics'''
                #     self.num_of_files -= 1
                #     pass
                else:
                    mybe_no_recognition = False
                    double_recognized_flag=0
                    for i in range(1,d+1):
                        try:
                            line = lines[line_num + i]
                        except: break # The log ended

                        if "timeout"  in line.lower():
                            pass
                        elif self._recognize_env_and_counter(line, self._env,self.counter_num):
                            if self._get_trig_result_from_line(lines, line_num + i):
                                '''checking for double recognition printing, this
                            function will return 1 only in case of regular recognition, possible room for bugs with other results.'''
                                if double_recognized_flag >=1:
                                    self.results_dict['double_recognized']+=1
                                    self.results_dict['recognized'] -= 1
                                else:
                                    double_recognized_flag+=1
                            mybe_no_recognition = True

                        elif self.reset_mode:
                            if self._recognize_env_and_counter(line, self._env,'counter 1'):
                                # self._get_trig_result_from_line(lines, line_num + i)
                                val = self._is_trig_reset(line)
                                if val:
                                    self.results_dict['resets'] += 1
                                    self.results_dict['reset_values'].append(val)

                        elif i==d and mybe_no_recognition == False:
                            self.results_dict["no_recognition"] += 1


    def end_of_log(self):
        self.results_dict['num_of_wavs'] = self.num_of_files
        self.results_dict.update(self.header_dict)
        if len(self.time_diff) > 0:
            self.results_dict['avg_response_time'] = self._get_times_avg()
            try:
                self.results_dict['max_deviation_response_time'] = self._get_times_max_deviation()
            except: self.results_dict['max_deviation_response_time'] = 'unavailable'
        else: self.results_dict['avg_response_time'], self.results_dict['max_deviation_response_time'] = 'unavailable', 'unavailable'

        test_results = self.results_dict['recognized'] + self.results_dict['timeout'] + self.results_dict['no_recognition'] + self.results_dict['undefined_count']
        if  self.results_dict['num_of_wavs'] != test_results:
            print "results don't add up, might be some results missing, counted: {},for {} commands".format(test_results,self.results_dict['num_of_wavs'])


class TrigASRLabJackLog_LJ(TrigLabJackLog_LJ):
    matching_excel_sheet = 'LJ_sTRIG_mASR'
    def __init__(self, name, Dict_Name='General'):
        TrigLabJackLog_LJ.__init__(self, name)
        self.num_of_files_trig = 0
        self.num_of_files_asr = 0
        self.asr_results_dict = {}
        self._set_result_dictionaries(Dict_Name)

    def _set_result_dictionaries(self,Dict_Name):
        asr_header = EXCEL_LJ_sTRIG_mASR_TEMPLATE_HEADER_SECTION
        if Dict_Name.lower() == "ringing":
            self.asr_cmds = Ringing_ASR_CMD_LIST
            self.asr_cmds_subs = Ringing_ASR_CMD_DICT
        elif Dict_Name.lower() == "musicasr":
            self.asr_cmds = Music_ASR_CMD_LIST
            self.asr_cmds_subs = Music_ASR_CMD_DICT
        elif Dict_Name.lower() == "fitnessasr" or Dict_Name.lower() == "jabra_old2":
            self.asr_cmds = Fitness_ASR_CMD_LIST
            self.asr_cmds_subs = Fitness_ASR_CMD_DICT
        elif Dict_Name.lower() == "standbyasr":
            self.asr_cmds = StandbyASR_ASR_CMD_LIST
            self.asr_cmds_subs = StanbyASR_ASR_CMD_DICT
        elif Dict_Name.lower() == "voiceexpressmeds":
            self.asr_cmds = VoiceExpressMeds_ASR_CMD_LIST
            self.asr_cmds_subs = VoiceExpressMeds_ASR_CMD_DICT
        else:
            self.asr_cmds = ASR_CMD_LIST
            self.asr_cmds_subs = ASR_CMD_DICT
        for asr_cmd in self.asr_cmds:
            ASR_RESULTS_PER_CMD_DICT.update({asr_cmd:0})
        self.asr_results_dict_format = copy.deepcopy(ASR_RESULTS_PER_CMD_DICT)
        self.trig_results_dict_format = copy.deepcopy(TRIG_SECTION_RESULTS_DICT)

    def _get_cmds_from_header(self,lines):
        stop_flag = False
        line = 1
        self.cmd_list = []
        while 1:
            this_line = lines[line]
            if "Trigger Recognition phrase: " in this_line:
                this_line = this_line.strip("Trigger Recognition phrase: ")
                self.cmd_list = this_line.split(', ')

                break

            elif ("playing" in this_line.lower()) and ("file" in this_line.lower()):

                self.cmd_list = None
                break
            line += 1

    def _prepare_new_cmd_run_and_end_run(self,cmd_asr_prev):
        if cmd_asr_prev is not None:
            self.end_of_curr_cmd_log()
            # try:
            #     for item in self.asr_results_dict[cmd_asr_prev]:
            #         if self.asr_results_dict_format[item] == 'unavailable':
            #             self.asr_results_dict[cmd_asr_prev][item] =  self.asr_results_dict_format[item]
            #         else: self.asr_results_dict[cmd_asr_prev][item] = self.asr_results_dict[cmd_asr_prev][item]+self.asr_results_dict_format[item]
            # except:
            #     self.asr_results_dict[cmd_asr_prev] = self.asr_results_dict_format
            self.asr_results_dict[cmd_asr_prev] = self.asr_results_dict_format


        self.asr_results_dict_format = {}
        self.asr_results_dict_format = copy.deepcopy(ASR_RESULTS_PER_CMD_DICT)

    def end_of_curr_cmd_log(self):
        '''updating time stamps: '''
        if len(self.time_diff_list_per_cmd) > 0:
            avg = self.clac_average_of_list(self.time_diff_list_per_cmd)
            max_deviation_response_time = self._get_times_max_deviation_asr(avg, self.time_diff_list_per_cmd)
            self.asr_results_dict_format['avg_response_time'] = avg
            self.asr_results_dict_format['max_deviation_response_time'] = max_deviation_response_time
            del self.time_diff_list_per_cmd[:]

        else: self.asr_results_dict_format['avg_response_time'], self.asr_results_dict_format['max_deviation_response_time'] = 'unavailable', 'unavailable'


        test_results = self.asr_results_dict_format['recognized'] + self.asr_results_dict_format['timeout'] \
                       + self.asr_results_dict_format['no_recognition'] + self.asr_results_dict_format['undefined_count']
        if  self.asr_results_dict_format['num_of_wavs'] != test_results:
            print "results don't add up, might be some results missing, counted: {},for {} commands".format(test_results,self.results_dict['num_of_wavs'])

    def run_log_analysis(self,lines):
        cmd_asr_prev = None
        # self.time_diff_list_per_trig = []
        self.time_diff_list_per_cmd = []
        self.curr_cmd_time_stamp = None
        self.d_bigger_then_2 = 0
        for line_num in xrange(len(lines) - 1):
            line = lines[line_num]

            cmd_trig, cmd_asr = None, None


            if "not playing" in line.lower():
                '''    'not playing' could only happend for an asr command, not trigger. '''
                self.asr_results_dict_format['no_recognition_because_of_trig'] +=1
            elif "playing" in line.lower():
                cmd_trig = self._is_file_played(line,'trig')
                cmd_asr = self._is_file_played(line,'asr')

            if cmd_trig is not None:
                trig_flag=1
                self.num_of_files_trig += 1
                d = self._get_num_of_lines_between_cmds(lines, line_num)
                if d<=1:
                    # self.results_dict['no_recognition'] +=1
                    self.trig_results_dict_format['no_recognition'] += 1
                    trig_flag=0
                else:
                    for i in range(1, d ):
                        try:
                            line = lines[line_num + i]                 #check if the next line exist
                        except:
                            break
                        self._get_trig_result_from_line(lines, line_num + i)  # for trigger results only

            elif (cmd_asr is not None) and (trig_flag):
                trig_flag = 0
                self.curr_cmd_time_stamp = self.get_time_stamp(line)
                self.num_of_files_asr += 1

                if cmd_asr_prev != cmd_asr:
                    self._prepare_new_cmd_run_and_end_run( cmd_asr_prev )
                    cmd_asr_prev = cmd_asr
                    self._log_analysis_per_command(lines, line_num, cmd_asr)
                else: self._log_analysis_per_command(lines,line_num ,cmd_asr)

        self._prepare_new_cmd_run_and_end_run(cmd_asr_prev)

    def _log_analysis_per_command(self,lines, line_num ,cmd_asr):
        # self.asr_results_dict_format
        d = self._get_num_of_lines_between_cmds(lines, line_num)
        '''if d>2 :
            self.d_bigger_then_2 +=1
            d=1   # so it will not enter the loop below and will not insert this file into statistics. multiple results per file
                  # are misleading.
            self.num_of_files_asr -= 1'''
        if d==1:
            self.asr_results_dict_format['no_recognition']+=1
            self.asr_results_dict_format['num_of_wavs'] +=1
        for i in range(1, d):
            try:
                line = lines[line_num + i]  # check if the next line exist
                asr_result = self._get_Lj_ASR_results_from_line(lines, line_num + i)
                if asr_result is not None:
                    self._handle_asr_results(asr_result,cmd_asr,line)
            except:
                break

    def _get_Lj_ASR_results_from_line(self,lines,line_num):
        line = lines[line_num].replace('_', ' ').lower().strip('\r\n')
        asr_line = self._recognize_env_and_counter(line, self._env,self.counter_num)
        if asr_line:
            if "recognized!" in line:
                try:
                    #regex finds the phrase that follows 'LJ- '
                    r = re.search("(?<=lj- )(.+)",line).group()
                    try:
                        n = re.search("(?<= - )(\d+)", r).group()  #in case of format like: "volume up - 16" we dont need the number in the string
                        r = r.split(' -')[0]
                    except: pass
                    if r is not None:
                        for item in self.asr_cmds:
                            if r.lower() == item.lower().replace('_', ' '):
                                return 'recognized_'+item
                            elif item.lower().replace('_', ' ') in r.lower():
                                return 'recognized_' + item

                        else:
                            print 'unknown command! found command "{}" in line num: {}  ->  {}'.format(r,line_num,lines[line_num])
                            return r

                    else: return None
                except :
                    try:
                        for item in self.asr_cmds:
                            if item.lower().replace('_', ' ') in line:
                                return 'recognized_' + item
                    except: return None

            elif "no recognition" in line:
                return 'no_recognition'

            elif "timeout" in line:
                return "timeout"

            elif "undefined value" in line:
                return "undefined_value"

    def _handle_asr_results(self,asr_result,cmd_asr,line):
        self.asr_results_dict_format['num_of_wavs'] +=1
        if "recognized_" in asr_result:
            asr_result = asr_result.replace("recognized_",'')
            is_substitution = self._is_substitution(asr_result,cmd_asr)
            if is_substitution == 'recognized':
                self.asr_results_dict_format['recognized'] +=1
                time_diff = self.update_time_stamp(line)
                self.time_diff_list_per_cmd.append(time_diff)
            elif 'substitution_' in is_substitution:
                is_substitution = is_substitution.strip('substitution_')
                self.asr_results_dict_format[is_substitution] += 1
            else: print 'unknown asr wav file!'

        elif asr_result == "no_recognition" or asr_result == "unrecognized":
            self.asr_results_dict_format['no_recognition'] += 1

        elif asr_result == "undefined_value":
            self.asr_results_dict_format['undefined_count'] +=1

    def _is_substitution(self,asr_result,cmd_asr):
        for key in self.asr_cmds_subs:
            if cmd_asr == key:
                key_val = self.asr_cmds_subs[key].lower()
                if asr_result.lower() == key_val.lower():
                    return "recognized"
                else: return 'substitution_'+ asr_result
        else:
            return 'unknown'

    def update_time_stamp(self,line):
        result_time = self.get_time_stamp(line)
        time_diff = self.timestamp_difference(self.curr_cmd_time_stamp, result_time)
        if time_diff:
            return time_diff

    def _get_times_max_deviation_asr(self,avg,time_diff_list):
        new_times_list=[]
        for item in time_diff_list:
            try:
                new_times_list.append(item.strip('00:00:'))
            except:
                print('watch clac_average_of_list  funtion, for the times_list gives value not in a hh:mm:ss format')
        if time_diff_list>1 and avg != 'unavailable':
            dev = [round(abs((float(avg) - float(item))), 2) for item in new_times_list]
            max_dev = max(dev)
            return max_dev
        else: return 0

    def _get_trig_result_from_line(self, lines, line_num):
        line = lines[line_num]
        line = line.replace('_', ' ').lower()

        if self._is_trig_recognition(line,['trigger']):
            self.trig_results_dict_format['recognized'] += 1
            # time_diff = self.update_time_stamp(line)
            # self.time_diff_list_per_trig.append(time_diff)

        elif self._is_trig_no_recognition(line):
            self.trig_results_dict_format['no_recognition'] += 1

        elif self._is_trig_undefined_value(line):
            self.trig_results_dict_format['undefined_count'] += 1
            val = self._is_trig_undefined_value(line)
            # self.trig_results_dict_format['undefined_values'].append(val)

    def end_of_log(self):
        self.trig_results_dict_format['num_of_wavs'] = self.num_of_files_trig
        self.results_dict['trig_results_dict_format'] = self.trig_results_dict_format
        self.results_dict['asr_results_dict'] = self.asr_results_dict
        self.results_dict['header_dict'] = self.header_dict


class TrigASRLabJackLog_LJ_LongTalks(TrigLogFile):
    _env = "LJ"
    matching_excel_sheet = 'LONG_TALKS'

    def __init__(self, name):
        TrigLogFile.__init__(self, name)
        self.long_talks = {}
        self.test_trig = ""
        self.long_talks_dict= {'recognized' : 0, 'duration' : 0,"start_time" : "","end_time":"" ,"last_recognition_time_stamp":"" ,
                               "is_alive": 1 , "counter_stopped_at" : "","num_of_talk" : 0}

    def run_log_analysis(self, lines):
        # self.counter_num = 'counter 0'
        curr_cmd,last_cmd=None,None
        self.talks_order=[]
        test_if_counter_is_alive = True
        self._if_counter_is_alive = True
        self._counter_stopped_at=["",""]
        for line_num in xrange(len(lines) - 1):
            line = lines[line_num].lower()
            try:
                tmp_line = lines[line_num + 2].lower()  # check if the next line exist
            except:
                try:
                    self.long_talks[curr_cmd]["end_time"] = self.get_time_stamp(line)
                    self.long_talks[curr_cmd]["duration"] = self.timestamp_difference(self.long_talks[curr_cmd]["start_time"], self.long_talks[curr_cmd]["end_time"])
                    # self.long_talks[curr_cmd]["recognition_rate"]=self.clac_recognition_rate_per_minutes(self.long_talks[curr_cmd]["duration"], self.long_talks[curr_cmd]["recognized"])
                except: pass
            cmd = self._is_file_played(line, 'trig')
            if cmd:
                if (cmd not in self.long_talks):
                    self.long_talks[cmd] = copy.deepcopy(self.long_talks_dict)
                    self.talks_order.append(cmd)

                else:
                    self.test_trig=cmd
                    # del self.long_talks[cmd]
                    try:
                        self.talks_order.remove(cmd)
                    except:
                        pass


                if curr_cmd != cmd :
                    if (curr_cmd != None) and (curr_cmd!=self.test_trig ):
                        self.long_talks[curr_cmd]["end_time"] = self.get_time_stamp(line)
                        self.long_talks[curr_cmd]["duration"] =self.timestamp_difference(self.long_talks[curr_cmd]["start_time"],self.long_talks[curr_cmd]["end_time"])
                        self.long_talks[curr_cmd]["recognition_rate"] = self.clac_recognition_rate_per_minutes(self.long_talks[curr_cmd]["duration"], self.long_talks[curr_cmd]["recognized"])

                    last_cmd = curr_cmd
                    curr_cmd = cmd



                if curr_cmd != self.test_trig:
                    self.long_talks[cmd]["start_time"]=self.get_time_stamp(line)
                else:
                    if test_if_counter_is_alive:
                        tmp_line = line
                        d = self._get_num_of_lines_between_cmds(lines, line_num)
                        if d <= 1:
                            self._if_counter_is_alive = False
                            test_if_counter_is_alive=False
                        else:
                            for i in range(1, d):
                                try:
                                    tmp_line = lines[line_num + i].lower()  # check if the next line exist
                                except:
                                    break
                                if ((self.counter_num in tmp_line) or (self.counter_num.replace(" ", "") in tmp_line)) :
                                    if (self._is_trig_recognition(tmp_line)):
                                        break
                            else:
                                self._counter_stopped_at[1] = self.get_time_stamp(line)
                                self._counter_stopped_at[0]=last_cmd
                                self._if_counter_is_alive = False
                                test_if_counter_is_alive = False

            if ((self.counter_num in line) or (self.counter_num.replace(" ","") in line)) and (curr_cmd != None) and (curr_cmd !=self.test_trig):

                if self._is_trig_recognition(line,['trigger']):
                    if curr_cmd != self.test_trig:
                        self.long_talks[curr_cmd]["recognized"]+=1
                        self.long_talks[curr_cmd]["last_recognition_time_stamp"] = self.get_time_stamp(line)
                        self._if_counter_is_alive = True
                        test_if_counter_is_alive = True
                else:
                    if curr_cmd == self.test_trig:
                        self.long_talks[last_cmd]["is_alive"]=0

    def clac_recognition_rate_per_minutes(self,duration,recognized):
        if recognized > 0:
            h, m, s = duration.split(':')
            h, m, s = int(h), int(m), round(float(s))
            time_in_hours = h + (m / float(60))
            if time_in_hours!=0:
                rate = round(recognized / time_in_hours, 1)
                return rate
        else:
            return 0

    def end_of_log(self):

        if not self._if_counter_is_alive:
            last_cmd = self._counter_stopped_at[0]
            last_time = self._counter_stopped_at[1]
            try:
                self.long_talks[last_cmd]["counter_stopped_at"] = self.timestamp_difference(self.long_talks[last_cmd]["start_time"], last_time)
            except:
                pass
        self.results_dict['long_talks'] = self.long_talks
        for key in self.results_dict['long_talks']:
            self.results_dict['long_talks'][key]['wav_name'] = key
        self.results_dict['header_dict'] = self.header_dict
        self.results_dict['talks_order'] = self.talks_order


class multi_Trig_ASR_only_LabJackLog_LJ(TrigLabJackLog_LJ):
    matching_excel_sheet = 'LJ_mTRIG_ASR_cmds'
    def __init__(self, name, Dict_Name='General'):
        TrigLabJackLog_LJ.__init__(self, name)
        self.num_of_files_trig = 0
        self.num_of_files_asr = 0
        self.asr_results_dict = {}
        self._set_result_dictionaries(Dict_Name)


    def _set_result_dictionaries(self,Dict_Name):
        asr_header = EXCEL_LJ_sTRIG_mASR_TEMPLATE_HEADER_SECTION
        if Dict_Name.lower() == "ringing":
            self.asr_cmds = Ringing_ASR_CMD_LIST
            self.asr_cmds_subs = Ringing_ASR_CMD_DICT
        elif Dict_Name.lower() == "musicasr":
            self.asr_cmds = Music_ASR_CMD_LIST
            self.asr_cmds_subs = Music_ASR_CMD_DICT
        elif Dict_Name.lower() == "fitnessasr" or Dict_Name.lower() == "hey jabra":
            self.asr_cmds = Fitness_ASR_CMD_LIST
            self.asr_cmds_subs = Fitness_ASR_CMD_DICT
        elif Dict_Name.lower() == "standbyasr":
            self.asr_cmds = StandbyASR_ASR_CMD_LIST
            self.asr_cmds_subs = StanbyASR_ASR_CMD_DICT
        elif Dict_Name.lower() == "voiceexpressmeds":
            self.asr_cmds = VoiceExpressMeds_ASR_CMD_LIST
            self.asr_cmds_subs = VoiceExpressMeds_ASR_CMD_DICT
        else:
            self.asr_cmds = ASR_CMD_LIST
            self.asr_cmds_subs = ASR_CMD_DICT
        for asr_cmd in self.asr_cmds:
            ASR_RESULTS_PER_CMD_DICT.update({asr_cmd:0})
        self.asr_results_dict_format = copy.deepcopy(ASR_RESULTS_PER_CMD_DICT)
        self.trig_results_dict_format = copy.deepcopy(TRIG_SECTION_RESULTS_DICT)

    def _get_cmds_from_header(self,lines):
        stop_flag = False
        line = 1
        self.cmd_list = []
        while 1:
            this_line = lines[line]
            if "Trigger Recognition phrase: " in this_line:
                this_line = this_line.strip("Trigger Recognition phrase: ")
                self.cmd_list = this_line.split(', ')

                break

            elif ("playing" in this_line.lower()) and ("file" in this_line.lower()):

                self.cmd_list = None
                break
            line += 1

    def _prepare_new_cmd_run_and_end_run(self,cmd_asr_prev):
        if cmd_asr_prev is not None:
            self.end_of_curr_cmd_log()
            # try:
            #     for item in self.asr_results_dict[cmd_asr_prev]:
            #         if self.asr_results_dict_format[item] == 'unavailable':
            #             self.asr_results_dict[cmd_asr_prev][item] =  self.asr_results_dict_format[item]
            #         else: self.asr_results_dict[cmd_asr_prev][item] = self.asr_results_dict[cmd_asr_prev][item]+self.asr_results_dict_format[item]
            # except:
            #     self.asr_results_dict[cmd_asr_prev] = self.asr_results_dict_format
            self.asr_results_dict[cmd_asr_prev] = self.asr_results_dict_format


        self.asr_results_dict_format = {}
        self.asr_results_dict_format = copy.deepcopy(ASR_RESULTS_PER_CMD_DICT)

    # def _is_trig_recognition(self, line):
    #     phrase = self.header_dict['trigger_phrase'].replace('_', ' ').lower().strip('"')
    #     counter_no_space = ""
    #     counter_no_space = counter_no_space.join(self.counter_num.split())
    #
    #     if ((self._env.lower() in line) or (self.counter_num in line) or (counter_no_space in line)) and (
    #             "recognized" in line) :#and ((phrase in line) or ("trigger" in line)):
    #         line=line.split("ecognized")[1]
    #         r = re.search("\d", line).group()
    #         tmp
    #         return True
    #         '''in case u want to check asr results ..meaning, all possible results, uncomment this condition'''
    #     # elif ((self._env.lower() in line) or (self.counter_num in line) or (counter_no_space in line)) and ("recognized"  in line)   :
    #     # 	return True
    #
    #     else:
    #         return False

    def end_of_curr_cmd_log(self):
        '''updating time stamps: '''
        if len(self.time_diff_list_per_cmd) > 0:
            avg = self.clac_average_of_list(self.time_diff_list_per_cmd)
            max_deviation_response_time = self._get_times_max_deviation_asr(avg, self.time_diff_list_per_cmd)
            self.asr_results_dict_format['avg_response_time'] = avg
            self.asr_results_dict_format['max_deviation_response_time'] = max_deviation_response_time
            del self.time_diff_list_per_cmd[:]

        else: self.asr_results_dict_format['avg_response_time'], self.asr_results_dict_format['max_deviation_response_time'] = 'unavailable', 'unavailable'

        # test_results_substitutions = self.asr_results_dict_format['empty1'] + self.asr_results_dict_format['empty2'] \
        #                              + self.asr_results_dict_format['empty3'] + self.asr_results_dict_format['empty4'] \
        #                              + self.asr_results_dict_format['empty5'] + self.asr_results_dict_format['empty6']
        test_results = self.asr_results_dict_format['recognized'] + self.asr_results_dict_format['timeout'] \
                       + self.asr_results_dict_format['no_recognition'] + self.asr_results_dict_format['undefined_count']
        if  self.asr_results_dict_format['num_of_wavs'] != test_results: #+ test_results_substitutions:
            print "results don't add up, might be some results missing, counted: {},for {} commands".format(test_results,self.asr_results_dict_format['num_of_wavs'])


    def run_log_analysis(self,lines):
        cmd_asr_prev = None
        # self.time_diff_list_per_trig = []
        self.time_diff_list_per_cmd = []
        self.curr_cmd_time_stamp = None
        self.d_bigger_then_2 = 0
        for line_num in xrange(len(lines) - 1):
            line = lines[line_num]
            cmd_trig, cmd_asr = None, None
            if "playing" in line.lower():
                # cmd_trig = self._is_file_played(line,'trig')
                cmd_asr = self._is_file_played(line,'trig')
                # just a temp bug that was found .. you can delete these lines once the bug is fixed:
                if cmd_asr== "1715 1 empty5.wav":
                    cmd_asr ="empty5.wav"

            if cmd_trig is not None:
                self.num_of_files_trig += 1
                d = self._get_num_of_lines_between_cmds(lines, line_num)
                if d<=1:
                    self.results_dict['no_recognition'] +=1
                else:
                    for i in range(1, d ):
                        try:
                            line = lines[line_num + i]                 #check if the next line exist
                        except:
                            break
                        self._get_trig_result_from_line(lines, line_num + i)  # for trigger results only

            elif cmd_asr is not None:
                self.curr_cmd_time_stamp = self.get_time_stamp(line)
                self.num_of_files_asr += 1
                if cmd_asr_prev != cmd_asr:
                    self._prepare_new_cmd_run_and_end_run( cmd_asr_prev )
                    cmd_asr_prev = cmd_asr
                    self._log_analysis_per_command(lines, line_num, cmd_asr)
                else: self._log_analysis_per_command(lines,line_num ,cmd_asr)

        self._prepare_new_cmd_run_and_end_run(cmd_asr_prev)



    def _log_analysis_per_command(self,lines, line_num ,cmd_asr):
        # self.asr_results_dict_format
        d = self._get_num_of_lines_between_cmds(lines, line_num)
        '''if d>2 :
            self.d_bigger_then_2 +=1
            d=1   # so it will not enter the loop below and will not insert this file into statistics. multiple results per file
                  # are misleading.
            self.num_of_files_asr -= 1'''
        if d==1:
            asr_result = "no_recognition"
            line = lines[line_num]
            self._handle_asr_results(asr_result, cmd_asr, line)
        for i in range(1, d):
            try:
                line = lines[line_num + i]  # check if the next line exist
                asr_result = self._get_Lj_ASR_results_from_line(lines, line_num + i)
                if asr_result is not None:
                    self._handle_asr_results(asr_result,cmd_asr,line)
            except:
                break


    def _get_Lj_ASR_results_from_line(self,lines,line_num):
        line = lines[line_num].replace('_', ' ').lower().strip('\r\n')
        asr_line = self._recognize_env_and_counter(line, self._env,self.counter_num)
        if asr_line:
            if "recognized!" in line:
                try:
                    #regex finds the phrase that follows 'LJ- '
                    r = re.search("(?<=lj- )(.+)",line).group()
                    try:
                        n = re.search("(?<= - )(\d+)", r).group()  #in case of format like: "volume up - 16" we dont need the number in the string
                        r = r.split(' -')[0]
                    except: pass
                    if r is not None:
                        for item in self.asr_cmds:
                            if r.lower() == item.lower().replace('_', ' '):
                                return 'recognized_'+item
                            elif item.lower().replace('_', ' ') in r.lower():
                                return 'recognized_' + item

                        else:
                            print 'unknown command! found command "{}" in line num: {}  ->  {}'.format(r,line_num,lines[line_num])
                            return r

                    else: return None
                except :
                    try:
                        for item in self.asr_cmds:
                            if item.lower().replace('_', ' ') in line:
                                return 'recognized_' + item
                    except: return None

            elif "no recognition" in line:
                return 'no_recognition'

            elif "timeout" in line:
                return "timeout"

            elif "undefined value" in line:
                return "undefined_value"


    def _handle_asr_results(self,asr_result,cmd_asr,line):
        self.asr_results_dict_format['num_of_wavs'] +=1
        if "recognized_" in asr_result:
            asr_result = asr_result.replace("recognized_",'')
            is_substitution = self._is_substitution(asr_result,cmd_asr)
            if is_substitution == 'recognized':
                self.asr_results_dict_format['recognized'] +=1
                time_diff = self.update_time_stamp(line)
                self.time_diff_list_per_cmd.append(time_diff)
            elif 'substitution_' in is_substitution:
                is_substitution = is_substitution.strip('substitution_')
                # tmp_cmds=['volume_down', 'volume_up', 'next_song', 'pause', 'resume', 'what_distance_have_i_done']
                # if is_substitution.lower().replace(" ","_") in tmp_cmds:
                tmp_cmd_rev_dict = {"volume_down" : "empty1.wav","volume_up" : "empty2.wav","next_song" : "empty3.wav",
                  "pause"  : "empty4.wav","previous_song" : "empty5.wav","what_distance_have_i_done" : "empty6.wav"}
                for key in tmp_cmd_rev_dict:
                    if is_substitution.lower().replace(" ","_") in key:
                        is_substitution = tmp_cmd_rev_dict[key].strip(".wav")

                try:

                    self.asr_results_dict_format[is_substitution] += 1
                except:
                    self.asr_results_dict_format[is_substitution] = 1
            else: print 'unknown asr wav file!'

        elif asr_result == "no_recognition" or asr_result == "unrecognized":
            self.asr_results_dict_format['no_recognition'] += 1

        elif asr_result == "undefined_value":
            self.asr_results_dict_format['undefined_count'] +=1
        self.asr_results_dict_format = self.asr_results_dict_format

    def _is_substitution(self,asr_result,cmd_asr):
        for key in self.asr_cmds_subs:
            if cmd_asr == key:
                key_val = self.asr_cmds_subs[key].lower()
                if asr_result.lower() == key_val.lower():
                    return "recognized"
                else: return 'substitution_'+ asr_result
        else:
            return 'unknown'


    def update_time_stamp(self,line):
        result_time = self.get_time_stamp(line)
        time_diff = self.timestamp_difference(self.curr_cmd_time_stamp, result_time)
        if time_diff:
            return time_diff



    def _get_times_max_deviation_asr(self,avg,time_diff_list):
        new_times_list=[]
        for item in time_diff_list:
            try:
                new_times_list.append(item.strip('00:00:'))
            except:
                print('watch clac_average_of_list  funtion, for the times_list gives value not in a hh:mm:ss format')
        if time_diff_list>1 and avg != 'unavailable':
            dev = [round(abs((float(avg) - float(item))), 2) for item in new_times_list]
            max_dev = max(dev)
            return max_dev
        else: return 0


    def _get_trig_result_from_line(self, lines, line_num):
        line = lines[line_num]
        line = line.replace('_', ' ').lower()

        phrase = self._is_trig_recognition(line,['volume_down', 'volume_up', 'next_song', 'what_distance_have_i_done'])
        if phrase:
            try:
                self.trig_results_dict_format['recognized'] += 1
            except:
                self.trig_results_dict_format['recognized'] = 1
            try:
                self.trig_results_dict_format[phrase] += 1
            except:
                self.trig_results_dict_format[phrase] = 1
            # time_diff = self.update_time_stamp(line)
            # self.time_diff_list_per_trig.append(time_diff)

        elif self._is_trig_no_recognition(line):
            self.trig_results_dict_format['no_recognition'] += 1

        elif self._is_trig_undefined_value(line):
            self.trig_results_dict_format['undefined_count'] += 1
            val = self._is_trig_undefined_value(line)
            # self.trig_results_dict_format['undefined_values'].append(val)

    def end_of_log(self):
        self.trig_results_dict_format['num_of_wavs'] = self.num_of_files_trig
        self.results_dict['trig_results_dict_format'] = self.trig_results_dict_format
        self.results_dict['asr_results_dict'] = self.asr_results_dict
        self.results_dict['header_dict'] = self.header_dict
