import glob
import re
import sys
import os
import shutil
import distutils.dir_util
import fnmatch
import datetime
import openpyxl
import copy
from templates_data import *
from boto.rds.logfile import LogFile
# from LJ_classes import *
# import MP_classes
# import LJ_classes


import copy

class LogFile(object):
	num_of_logs = 0
	num_of_headers = 0
	def __init__(self,name):

		LogFile.num_of_logs+=1
		self.log_name = name
		self.num_of_files = 0
		self.time_diff = []
		self.header_dict = {}
		self.header_dict = copy.deepcopy(HEADER_DICT)
		# self.results_dict = {}
		# self.results_dict = copy.deepcopy(TRIGGER_ONLY_TEMPLATE)

	def get_name(self):
		return self.log_name

	def get_lines_from_text_file(self):
		f = open(self.log_name, 'rb')
		lines = f.readlines()
		f.close()
		return lines

	def get_header_param_JBX_method(self,lines):
		''' COMMAND LINE ORDER: 0.log_file_name  1.list_file_name  2.noise_file_name  3.signal_dB  4.noise_dB  5.trig_to_ASR_delay
								6.ASR_to_trig_delay  7.board_used  8.TRIG\ASR  9.dictionary  10.test type 11.counter0  12.counter1  13.trigger_phrase
								14.*approval_phrase_asr_recognition  15.*approval_phrase_trig_recognition

								*optional			'''
		self.header_params = []
		line = 0
		next_trig_flag = 0
		while 1:
			this_line=lines[line]
			if "Next Trigger Recognition phrase:" in this_line:
				this_line = this_line.replace("Next Trigger Recognition phrase:","").strip('\r\n')
				if this_line is not None:
					next_trig_flag = str(this_line)

			elif "Command line: python " in this_line:
				this_line = this_line.strip("Command line: python ")
				self.header_params = this_line.split()
				self.header_params.pop(0)
				for i in xrange(len(self.header_params)):
					# print self.header_params[i]
					if self.header_params[i].lower() == "trigger" and self.header_params[i+1].lower() == 'only':
						self.header_params[i] = 'TRIG'
						self.header_params.pop(i+1)
						break

				break
			line+=1

		self.handle_header_params(next_trig_flag)

	def handle_header_params(self,next_trig_flag):
		import itertools
		header_tuple = HEADER_TUPLE

		for param , val in itertools.izip_longest(header_tuple,self.header_params):
			try :
				val = float(val)
				self.header_dict[param] = str(int(val))

			except :
				self.header_dict[param] = val


		self.header_dict['noise_file_name'] = os.path.basename(self.header_dict['noise_file_name'])
		self.header_dict['log_file_name'] = os.path.basename(self.log_name)
		if self.header_dict['trigger_phrase']== 'Jabra_old' or self.header_dict['trigger_phrase']== '"Jabra_old"' or self.header_dict['trigger_phrase']== 'Jabra_old2':
			self.header_dict['trigger_phrase'] = 'hey jabra'



	def _is_file_played(self,line,*arg):
		line = line.replace('_', ' ').lower()
		line = line.strip('\r\n')
		if arg:
			strin = "playing {} file".format(arg[0])
			if strin in line or "playing file " in line:
				n = line.rfind('\\')
				cmd_file_name = line[n + 1:]
				return cmd_file_name
			else:
				return None

	def get_time_stamp(self,line):
		time = re.search("\d{2}:\d{2}:\d{2}\.*\d*", line)
		time = time.group()
		return time

	def timestamp_difference(self, time_PREV, time_CURR):
		from datetime import datetime, time as datetime_time, timedelta
		def handle_result(res):
			h, m, s = str(res).rsplit(':')
			s = str(round((float(s)), 2))
			if (int(h) == 0) and (int(m) == 0):
				result = "00:00:{}".format( s)
			elif (int(h) == 0) and (int(m) != 0):
				result = "00:{}:{}".format(m, s)
			else:
				result = "{}:{}:{}".format(h, m, s)
			return str(result)

		start,end=time_PREV, time_CURR

		for time_range in ['{}-{}'.format(start, end)]:
			start, end = [datetime.strptime(t, '%H:%M:%S.%f') for t in time_range.split('-')]

		if isinstance(start, datetime_time):  # convert to datetime
			assert isinstance(end, datetime_time)
			start, end = [datetime.combine(datetime.min, t) for t in [start, end]]

		if start <= end:  # e.g., 10:33:26-11:15:49
			return handle_result(end - start)
		else:  # end < start e.g., 23:55:00-00:25:00
			end += timedelta(1)  # +day
			assert end > start
			return handle_result(end - start)

	def timestamp_seconds_only_in_float(self,timestamp_str):
		ts_s=float(timestamp_str.strip('00:00:'))
		return ts_s


	def clac_average_of_list(self,list_of_strs):
		new_times_list = []
		for item in list_of_strs:
			try:
				new_times_list.append(item.strip('00:00:'))
			except : print('watch clac_average_of_list  funtion, for the times_list gives value not in a hh:mm:ss format')
		from functools import reduce
		try:
			sum = reduce(lambda x, y: float(x) + float(y), new_times_list)
		except:
			print("Couldn't calculate total amount of time")
		# try:
		# 	sum2=0
		# 	for item in new_times_list:
		# 		sum2=sum2+float(item)
		# except:
		# 	print(item)
		try:
			avg = round((sum / len(list_of_strs)), 3)
		except:
			avg = 'unavailable'
		return avg

	def update_time_stamp(self,line):
		result_time = self.get_time_stamp(line)
		time_diff = self.timestamp_difference(self.cmd_time_stamp, result_time)
		self.time_diff.append(time_diff)

	def set_mode(self,mode,app_name):
		#defines the log to parse for two counters. one for results second for resets.
		self.header_dict['app_name'] = app_name
		self.app_name = app_name
		mode = mode.lower()
		if "uart" in mode:
			self.counter_num = "uart"
		elif mode == "counter0 only":
			self.counter_num = "counter 0"
		elif "serial" in mode:
			self.counter_num = "Serial"
		elif mode == "counter1 only":
			self.counter_num = "counter 1"

		elif mode == "reset mode":
			self.counter_num = "counter 0"
			self.reset_mode = True
			try:
				self._set_reset_mode()
			except:
				print 'classidied class reset mode not defined yet'



#####################################################################################################################

class TrigLogFile(LogFile):
	matching_excel_sheet = 'TRIG_ONLY'
	_env = "required! should be passed from log's header"

	def __init__(self , name,Dict_Name='General' ):
		LogFile.__init__(self , name)
		# self.results_dict['file_name'] = self.log_name
		self.results_dict = copy.deepcopy(TRIGGER_ONLY_TEMPLATE)
		self.results_dict.update(self.header_dict)
		self.results_dict['file_name'] = self.log_name
		self.reset_mode = False
		self.current_and_previous_cmd = ["", ""]
		self.results_dict["excel_sheet_template"] = self.matching_excel_sheet

	def _set_reset_mode(self):
		self.results_dict['resets'] = 0
		self.results_dict['reset_values'] = []

	def trig_phrase(self,phrase):
		self.results_dict['trigger_phrase'] = phrase.lower()

	def _recognize_env_and_counter(self,line,env,counter_num):
		line = line.lower()
		counter_num_no_spaces = counter_num.replace(' ','')
		if  ((counter_num.lower() in line) or (counter_num_no_spaces.lower() in line)) and (env.lower() in line):
			return True
		elif (counter_num.lower() in line) or (counter_num_no_spaces.lower() in line):
			return True
		else:
			return False

	def _is_trig_recognition(self,line,phrases=['triger','volume_down', 'volume_up', 'next_song', 'pause', 'previous_song', 'what_distance_have_i_done']):

		counter_no_space=""
		counter_no_space=counter_no_space.join(self.counter_num.split())
		phrase_in_line = False
		for phrase in phrases:
			if phrase.replace('_', ' ').lower().strip('"') in line.lower() or phrase.lower().strip('"') in line.lower():
				phrase_in_line = True
				break
		else:
			phrase = self.header_dict['trigger_phrase'].replace('_', ' ').lower().strip('"')
			if phrase in line:
				phrase_in_line = True
		if ((self._env.lower() in line) or (self.counter_num.lower() in line) or (counter_no_space.lower() in line)) and ("recognized"  in line) and phrase_in_line :
			# return True
			return phrase
			'''in case u want to check asr results ..meaning, all possible results, uncomment this condition'''
		elif ((self._env.lower() in line) or (self.counter_num in line) or (counter_no_space in line)) and ("recognized"  in line)   :
			return phrase

		else:
			return False

	def _is_trig_no_recognition(self,line):
		return True if "no recognition"  in line else False

	def _is_trig_timeout(self,line):
		return True if "timeout"  in line else False

	def _is_trig_reset(self,line):
		line = line.lower()
		if "reset" in line:
			# try:
			# 	''' positive lookbehind, ensures that the required number is placed after "reset" '''
			# 	r = re.search("(?<=reset )\d+",line).group()
			# 	return int(r)
			# except:
			# 	return 0
			return 1
		else:
			return 0

	def _is_trig_undefined_value(self,line):
		# line = line.replace('_', ' ').lower()
		if "undefined value" in line:
			try:
				n = line.rfind("-")
				value = re.search("\d+", line[n:]).group()
				return int(value)
			except: return False
		else: return False

	def _get_times_avg(self):
		times_list = self.time_diff


		try:
			avg = self.clac_average_of_list(times_list)
		except: avg = 'could_not_clac'
		return avg

	def _get_times_max_deviation(self):
		avg = self.results_dict['avg_response_time']
		dev = [round(abs((float(avg) - float(item))), 2) for item in self.time_diff]
		max_dev = max(dev)
		return max_dev

	def run_log_analysis(self,lines):
		''' this function is not in use at this point. child classes overides the function '''
		for line_num in xrange(len(lines)):
			line = lines[line_num]
			cmd = self._is_file_played(line)
			if cmd:
				self.num_of_files += 1
				try:
					next_line = lines[line_num + 1]
				except: break

				if next_line:
					next_cmd = self._is_file_played(next_line)
					if next_cmd:
						self.results_dict["no_recognition"] += 1
					else:
						while 1:
							line_num += 1
							self._get_result_from_line(lines,line_num )
							next_line = lines[line_num + 1]
							if next_line:
								next_cmd = self._is_file_played(next_line)
								if next_cmd:
									break
							else: print "EOF Reached"
				else:
					print "EOF Reached"

	def _get_trig_result_from_line(self,lines,line_num):
		line = lines[line_num]
		line = line.replace('_', ' ').lower()

		if self._is_trig_recognition(line,['trigger']):
			self.results_dict['recognized'] +=1
			self.update_time_stamp(line)
			return 1

		elif self._is_trig_no_recognition(line):
			self.results_dict['no_recognition'] += 1

		elif self._is_trig_timeout(line):
			# self.results_dict['timeout'] += 1
			self.results_dict['recognized'] += 1
			self.update_time_stamp(line)

		elif self._is_trig_undefined_value(line):
			self.results_dict['undefined_count'] += 1
			val = self._is_trig_undefined_value(line)
			self.results_dict['undefined_values'].append(val)

		elif self._is_trig_reset(line):
			# self.results_dict['timeout'] += 1
			self.results_dict['resets'] += 1
			self.update_time_stamp(line)

	def _get_num_of_lines_between_cmds (self, lines,line_num):
		i=1
		line = lines[line_num + i]
		while line is not None:
			next_cmd_trig = self._is_file_played(line,'trig')
			next_cmd_asr = self._is_file_played(line, 'asr')
			if (next_cmd_trig is not None) or (next_cmd_asr is not None):
				break
			else:
				i+=1
				try: line = lines[line_num + i]
				except: return i
		return i

	def _set_result_dictionaries(self, Dict_Name):
		asr_header = EXCEL_LJ_sTRIG_mASR_TEMPLATE_HEADER_SECTION
		if Dict_Name.lower() == "ringing":
			self.asr_cmds = Ringing_ASR_CMD_LIST
			self.asr_cmds_subs = Ringing_ASR_CMD_DICT
		elif Dict_Name.lower() == "musicasr":
			self.asr_cmds = Music_ASR_CMD_LIST
			self.asr_cmds_subs = Music_ASR_CMD_DICT
		elif Dict_Name.lower() == "musicmtrig":
			self.asr_cmds = Music_mTrig_CMD_LIST
			self.asr_cmds_subs = Music_mTrig_CMD_DICT
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
			ASR_RESULTS_PER_CMD_DICT.update({asr_cmd: 0})
		self.asr_results_dict_format = copy.deepcopy(ASR_RESULTS_PER_CMD_DICT)
		self.trig_results_dict_format = copy.deepcopy(TRIG_SECTION_RESULTS_DICT)

	def end_of_log(self):
		self.results_dict['num_of_wavs'] = self.num_of_files
		if len(self.time_diff) > 0:
			self.results_dict['avg_response_time'] = self._get_times_avg()
			self.results_dict['max_deviation_response_time'] = self._get_times_max_deviation()
		else: self.results_dict['avg_response_time'], self.results_dict['max_deviation_response_time'] = 'unavailable', 'unavailable'

		test_results = self.results_dict['recognized'] + self.results_dict['timeout'] + self.results_dict['no_recognition'] + self.results_dict['undefined_count']
		if  self.results_dict['num_of_wavs'] != test_results:
			print "results don't add up, might be some results missing, counted: {},for {} commands".format(test_results,self.results_dict['num_of_wavs'])

#####################################################################################################################


class ASRLogFile(TrigLogFile):
	def __init__(self,name):
		super(ASRLogFile,self).__init__( name)
		# TrigLogFile.__init__(self, name)
		self.trig_or_asr_cmd = 'trig'


#####################################################################################################################











