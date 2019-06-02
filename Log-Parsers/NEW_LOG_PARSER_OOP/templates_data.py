#######################################################################################################
# GLOBAL VARIABLES

EXCEL_FILE_NAME = 'new_project'



#######################################################################################################
HEADER_TUPLE = ('log_file_name'  ,'list_file_name'  ,'noise_file_name'  ,'signal_dB'  ,'noise_dB'  ,'trig_to_ASR_delay',
                'ASR_to_trig_delay'  ,'environment_board'  ,'TRIG\ASR'  ,'trigger_phrase'  ,'counter0'  ,'counter1')

HEADER_DICT = {'log_file_name' : ''  ,'list_file_name' : "" ,'noise_file_name' : ""  ,'signal_dB' : ''  ,'noise_dB'  :  '','trig_to_ASR_delay' : '',
                'ASR_to_trig_delay'  :  ''  ,'environment_board'  :  ''  ,'TRIG\ASR'  :  ''  ,'trigger_phrase'  :  ''  ,
               'counter0'  :  ''  ,'counter1'  :  '' , 'app_name' : 0}
                # 'trigger_phrase',"approval_phrase_asr_recognition", "approval_phrase_trig_recognition")


#######################################################################################################
EXCEL_TRIG_TEMPLATE_TUPLE= ('log_file_name','app_name', 'list_file_name', 'trigger_phrase','trig_to_ASR_delay', 'signal_dB',  'noise_file_name',
                       'noise_dB', 'num_of_wavs', 'recognized', 'timeout', 'no_recognition','undefined_count', 'resets',
                      'avg_response_time', 'max_deviation_response_time','double_recognized')

# TRIGGER_ONLY_TEMPLATE = {'app_name' : "", 'trigger_phrase' : '', 'num_of_wavs' : 0, 'excel_sheet_template' : "",
# 						 'recognized' : 0, 'timeout' : 0, 'no_recognition' : 0, 'resets' : 'unavailable' ,'reset_values' : [],
#                          'undefined_count' : 0 ,'undefined_values' :[] , 'avg_response_time' : 0 , "max_deviation_response_time" : 0}
TRIGGER_ONLY_TEMPLATE = { 'num_of_wavs' : 0, 'excel_sheet_template' : "",
						 'recognized' : 0, 'timeout' : 0, 'no_recognition' : 0, 'resets' : 'unavailable' ,'reset_values' : [],
                         'undefined_count' : 0 ,'undefined_values' :[] , 'avg_response_time' : 0 , "max_deviation_response_time" : 0,
                          'double_recognized' : 0}
#######################################################################################################
EXCEL_ASR_TEMPLATE_TUPLE= ('log_file_name','app_name', 'list_file_name', 'trigger_phrase','trig_to_ASR_delay', 'signal_dB',  'noise_file_name',
                       'noise_dB', 'num_of_wavs', 'recognized', 'timeout', 'no_recognition','undefined_count', 'resets',
                      'avg_response_time', 'max_deviation_response_time')

ASR_ONLY_TEMPLATE = {'app_name' : "", 'trigger_phrase' : '', 'num_of_wavs' : 0,
						 'recognized' : 0, 'timeout' : 0, 'no_recognition' : 0, 'resets' : 'unavailable' ,'reset_values' : [],
                         'undefined_count' : 0 ,'undefined_values' :[] , 'avg_response_time' : 0 , "max_deviation_response_time" : 0}
######################################################################################################
'''  set for sheet named : MP_mTrig_sASR  '''

EXCEL_MP_CMD_TEMPLATE_PER_CMD =['trig_time_stamp',
                                'LJ_Trigger','LJ_Trigger_latency','Trigger','Trigger_latency',
                                "Amazon_Listening","Amazon_Listening_latency",
                                'VOX_Closed','VOX_Closed_latency',
                                 'VOX_Closed_timeout','VOX_Closed_timeout_latency',
                                 "Amazon_Processing","Amazon_Processing_latency",
                                "Amazon_Speaking",'Amazon_Speaking_latency',
                                 'Waiting_for_Trigger','Waiting_for_Trigger_latency']

EXCEL_MP_CMD_TEMPLATE_PER_LOG =['num_of_trig_wavs' ,'num_of_asr_wavs','Trigger Ignored']

EXCEL_MP_CMD_TEMPLATE_HEADER=["log_file_name","list_file_name","command","trig_to_ASR_delay",'signal_dB'  ,'noise_file_name' ,'noise_dB']

EXCEL_MP_CMD_TEMPLATE_TOTAL=EXCEL_MP_CMD_TEMPLATE_HEADER + EXCEL_MP_CMD_TEMPLATE_PER_LOG + \
                            [ 'LJ_Trigger','LJ_Trigger_latency_avg','Trigger','Trigger_latency_avg',
                                "Amazon_Listening","Amazon_Listening_latency_avg",
                                'VOX_Closed','VOX_Closed_latency_avg',
                                 'VOX_Closed_timeout','VOX_Closed_timeout_latency_avg',
                                 "Amazon_Processing","Amazon_Processing_latency_avg",
                                "Amazon_Speaking",'Amazon_Speaking_latency_avg',
                                 'Waiting_for_Trigger','Waiting_for_Trigger_latency_avg']


######################################################################################################

''' sTRIG mASR Handeling'''
# ASR_CMD_LIST = ['volume_down', 'volume_up', 'next_song', 'pause', 'resume', 'what_distance_have_i_done']
#
# ASR_CMD_DICT = { "empty1.wav" : "volume_down",  "empty2.wav" : "volume_up",  "empty3.wav" : "next_song",
# 				"empty4.wav" : "pause",  "empty5.wav" : "resume",  "empty6.wav" : "what_distance_have_i_done"}

ASR_CMD_LIST = ['empty1', 'empty2', 'empty3', 'empty4', 'empty5', 'empty6']

ASR_CMD_DICT = { "empty1.wav" : "empty1",  "empty2.wav" : "empty2",  "empty3.wav" : "empty3",
				"empty4.wav" : "empty4",  "empty5.wav" : "empty5",  "empty6.wav" : "empty6"}

# medication menu
# ASR_CMD_LIST = ['description', 'Clinacal_Studies', 'Indication_and_uses', 'go_back', 'g', 'g']
#
# ASR_CMD_DICT = { "empty1.wav" : "description",  "empty2.wav" : "Clinacal_Studies",  "empty3.wav" : "Indication_and_uses",
# 				"empty4.wav" : "go_back",  "empty5.wav" : "g",  "empty6.wav" : "g"}

EXCEL_LJ_sTRIG_mASR_TEMPLATE_HEADER_SECTION = ["log_file_name", 'app_name', "list_file_name", 'trigger_phrase' ,
                                               "trig_to_ASR_delay", 'signal_dB' ,'noise_file_name' ,'noise_dB', 'phrase',]



EXCEL_LJ_sTRIG_mASR_TEMPLATE_ASR_SECTION = ['num_of_wavs', 'recognized', 'no_recognition', 'undefined_count', 'no_recognition_because_of_trig',
                                            'timeout','resets','avg_response_time', 'max_deviation_response_time',
                                            str(ASR_CMD_LIST[0]),str(ASR_CMD_LIST[1]),str(ASR_CMD_LIST[2]),str(ASR_CMD_LIST[3]),
                                            str(ASR_CMD_LIST[4]),str(ASR_CMD_LIST[5])]

                                            # 'volume_down', 'volume_up', 'next_song', 'pause', 'resume', 'what_distance_have_i_done']


EXCEL_LJ_sTRIG_mASR_TEMPLATE_TRIG_SECTION = ['num_of_wavs', 'recognized', 'no_recognition', 'reset' ,
                                            'timeout' , 'timeout_reset']






ASR_RESULTS_PER_CMD_DICT = {'num_of_wavs' : 0, 'recognized' : 0, 'no_recognition': 0, 'undefined_count': 0,
                       'no_recognition_because_of_trig': 0, 'timeout': 0 ,'resets': 'unavailable',
                       'avg_response_time': 0, 'max_deviation_response_time': 0 ,
                        str(ASR_CMD_LIST[0]): 0,str(ASR_CMD_LIST[1]): 0,str(ASR_CMD_LIST[2]): 0,str(ASR_CMD_LIST[3]): 0,
                                            str(ASR_CMD_LIST[4]): 0,str(ASR_CMD_LIST[5]): 0}

TRIG_SECTION_RESULTS_DICT = {'num_of_wavs': 0, 'recognized': 0, 'no_recognition': 0, 'reset' : 'unavailable' ,
                             'timeout': 0, 'timeout_reset': 0 , 'undefined_count': 0,'undefined_values': 0}



######################################################################################################

EXCEL_LONG_TALKS_TEMPLATE_HEADER_TUPLE= ('log_file_name','app_name', 'list_file_name','trig_to_ASR_delay', 'signal_dB',
                                  'noise_file_name','noise_dB', 'wav_name', 'recognized','counter_stopped_at')

EXCEL_LONG_TALKS_TEMPLATE_FILES_TUPLE=('wav_name', 'recognized','duration','recognition_rate','counter_stopped_at')

# TRIGGER_ONLY_TEMPLATE = {'app_name' : "", 'trigger_phrase' : '', 'num_of_wavs' : 0, 'excel_sheet_template' : "",
# 						 'recognized' : 0, 'timeout' : 0, 'no_recognition' : 0, 'resets' : 'unavailable' ,'reset_values' : [],
#                          'undefined_count' : 0 ,'undefined_values' :[] , 'avg_response_time' : 0 , "max_deviation_response_time" : 0}
LONG_TALKS_TEMPLATE = { 'num_of_wavs' : 0, 'excel_sheet_template' : "",
						 'recognized' : 0, 'timeout' : 0, 'no_recognition' : 0, 'resets' : 'unavailable' ,'reset_values' : [],
                         'undefined_count' : 0 ,'undefined_values' :[] , 'avg_response_time' : 0 , "max_deviation_response_time" : 0}
#######################################################################################################



'''
noise_dB: -20    >
app_name: "rubidium"   >
file_name: C:/PythonProjects/NEW_LOG_PARSER_OOP\Logs_directory\CSR_Fitness_Hey_Jabra_cafeteria-20.txt >
excel_sheet_template: TRIG_ONLY *************************  this one is cool
max_deviation_response_time: 0  **** move to asr
ASR_to_trig_delay: 1   >
resets: unavailable
list_file_name: C:\AutomationEnvironment\lists\ASR_TRIG_FITNNESS_Without_Resume.txt >
undefined_values: []    **** move to asr
log_file_name: CSR_Fitness_Hey_Jabra_cafeteria-20.txt  >
trigger_phrase: "Hey_Jabra"   >
no_recognition: 0   **** move to asr
environment_board: LJ   >
trig_to_ASR_delay: 4     >
num_of_wavs: 0    **** move to asr
noise_file_name: cafeteria_mono_150s.wav   >
avg_response_time: 0   **** move to asr
signal_dB: 0        >
reset_values: []    **** move to asr  /probebly not needed
undefined_count: 0   **** move to asr
None: Trigger"      delete
recognized: 0       **** move to asr
TRIG\ASR: Trig/ASR   >
timeout: 0           **** move to asr
counter0: "Rubidium" >
counter1: "None"     >      '''



















'''
"Trigger Ignored"   *
"Trigger"     *
"Waiting for Trigger"
"VOX Closed"
"VOX Closed Timeout"
"Amazon Listening"
"Amazon Speaking"   *
"Amazon Processing"

'''

'''
	def run_log_analysis(self,lines):
		for line_num in xrange(len(lines)):
			line = lines[line_num]
			cmd = self.is_file_played(line)
			if self.is_trigger_or_asr_cmd=="trig" and cmd:
				self.is_trigger_or_asr_cmd = "asr"
				self._get_trig_result_from_line(lines,line_num + self.cnt)
			elif self.is_trigger_or_asr_cmd=="asr" and cmd:
				self.is_trigger_or_asr_cmd = "trig" '''