#######################################################################################################
# GLOBAL VARIABLES

EXCEL_FILE_NAME = 'new_project'



#######################################################################################################
HEADER_TUPLE = ('log_file_name'  ,'list_file_name'  ,'noise_file_name'  ,'signal_dB'  ,'noise_dB'  ,'trig_to_ASR_delay',
                'ASR_to_trig_delay'  ,'environment_board'  ,'TRIG\ASR'  ,'trigger_phrase'  ,'test_type' ,'counter0'  ,'counter1')

HEADER_DICT = {'log_file_name' : ''  ,'list_file_name' : "" ,'noise_file_name' : ""  ,'signal_dB' : ''  ,'noise_dB'  :  '','trig_to_ASR_delay' : '',
                'ASR_to_trig_delay'  :  ''  ,'environment_board'  :  ''  ,'TRIG\ASR'  :  ''  , 'test_type'  :  ''  , 'trigger_phrase'  :  ''  ,
               'test_type' : '','counter0'  :  ''  ,'counter1'  :  '' , 'app_name' : 0}
                # 'trigger_phrase',"approval_phrase_asr_recognition", "approval_phrase_trig_recognition")


#######################################################################################################
EXCEL_TRIG_TEMPLATE_TUPLE= ('log_file_name','app_name', 'list_file_name', 'trigger_phrase','trig_to_ASR_delay', 'signal_dB',  'noise_file_name',
                       'noise_dB', 'num_of_wavs', 'recognized', 'timeout', 'no_recognition','undefined_count', 'resets',
                      'avg_response_time', 'max_deviation_response_time','double_recognized')

# TRIGGER_ONLY_TEMPLATE = {'app_name' : "", 'trigger_phrase' : '', 'num_of_wavs' : 0, 'excel_sheet_template' : "",
# 						 'recognized' : 0, 'timeout' : 0, 'no_recognition' : 0, 'resets' : 'unavailable' ,'reset_values' : [],
#                          'undefined_count' : 0 ,'undefined_values' :[] , 'avg_response_time' : 0 , "max_deviation_response_time" : 0}
TRIGGER_ONLY_TEMPLATE = { 'num_of_wavs' : 0, 'excel_sheet_template' : "",
						 'recognized' : 0, 'timeout' : 0, 'no_recognition' : 0, 'resets' : 0 ,'reset_values' : [],
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
ASR_CMD_LIST = ['empty1', 'empty2', 'empty3', 'empty4', 'empty5', 'empty6']

ASR_CMD_DICT = {"empty1.wav" : "empty1",  "empty2.wav" : "empty2",  "empty3.wav" : "empty3",
				"empty4.wav" : "empty4",  "empty5.wav" : "empty5",  "empty6.wav" : "empty6"}

CMD_TEMPLATE_DICT = {"empty1" : "empty1.wav",  "empty2" : "empty2.wav",  "empty3" : "empty3.wav",
				     "empty4" : "empty4.wav",  "empty5" : "empty5.wav",  "empty6" : "empty6.wav"}

Music_ASR_CMD_LIST = ['volume_up', 'volume_down', 'next_song', 'resume', 'pause', 'what_distance_have_i_done']

Music_ASR_CMD_DICT = { "empty1.wav" : "volume_up",  "empty2.wav" : "volume_down",  "empty3.wav" : "next_song",
				         "empty4.wav" : "resume",  "empty5.wav" : "pause",  "empty6.wav" : "what_distance_have_i_done"}

Music_mTrig_CMD_LIST = [ 'volume_up', 'volume_plus_up', 'volume_down', 'volume_plus_down', 'next_song', 'stop_music']

Music_mTrig_CMD_DICT = { "empty1.wav" : "volume_up", "empty1.wav" : "volume_plus_up", "empty2.wav" : "volume_down", "empty2.wav" : "volume_plus_down",  "empty3.wav" : "next_song",
				         "empty4.wav" : "stop_music"}

Music_MTRIG_CMD_TEMPLATE_DICT = {"volume_up" : "empty1.wav",
                                 "volume_down" : "empty2.wav",
                                 "next_song" : "empty3.wav", "stop_music" : "empty4.wav"}

Music_CMD_TEMPLATE_DICT = {"volume_up" : "empty1.wav","volume_down" : "empty2.wav","next_song" : "empty3.wav",
				      "resume"  : "empty4.wav","pause" : "empty5.wav","what_distance_have_i_done" : "empty6.wav"}

Fitness_ASR_CMD_LIST = ['volume_down', 'volume_up', 'next_song', 'pause', 'resume', 'what_distance_have_i_done']

Fitness_ASR_CMD_DICT = { "empty1" : "volume_down",  "empty2" : "volume_up",  "empty3" : "next_song",
				         "empty4" : "pause",  "empty5" : "resume",  "empty6" : "what_distance_have_i_done"}

Fitness_CMD_TEMPLATE_DICT = {"volume_down" : "empty1.wav","volume_up" : "empty2.wav","next_song" : "empty3.wav",
				      "pause"  : "empty4.wav","resume" : "empty5.wav","what_distance_have_i_done" : "empty6.wav"}

Ringing_ASR_CMD_LIST = ['answer', 'ignore',]

Ringing_ASR_CMD_DICT = {"empty1.wav" : "answer",  "empty2.wav" : "ignore"}

Ringing_CMD_TEMPLATE_DICT = {"Answer" : "empty1.wav","Ignore" : "empty2.wav"}

StandbyASR_ASR_CMD_LIST = ['power_off', 'play_music',]

StanbyASR_ASR_CMD_DICT = {"empty2.wav" : "power_off",  "empty1.wav" : "play_music"}

StanbyASR_CMD_TEMPLATE_DICT = {"play_music" : "empty1.wav","power_off" : "empty2.wav" }

# medication menu
VoiceExpressMeds_ASR_CMD_LIST = ['description', 'Clinacal_Studies', 'Indication_and_uses', 'go_back', 'g', 'g']

VoiceExpressMeds_ASR_CMD_DICT = { "empty1.wav" : "description",  "empty2.wav" : "Clinacal_Studies",  "empty3.wav" : "Indication_and_uses",
				                "empty4.wav" : "go_back"}

VoiceExpressMeds_CMD_TEMPLATE_DICT= {"description" : "empty1.wav" ,"Clinacal_Studies" : "empty2.wav","Indication_and_uses" : "empty3.wav",
				                "go_back" : "empty4.wav"}

EXCEL_LJ_sTRIG_mASR_TEMPLATE_HEADER_SECTION = ["log_file_name", 'app_name', "list_file_name", 'trigger_phrase' ,
                                               "trig_to_ASR_delay", 'signal_dB' ,'noise_file_name' ,'noise_dB', 'phrase',]



EXCEL_LJ_sTRIG_mASR_TEMPLATE_ASR_SECTION = ['num_of_wavs', 'recognized', 'seperate_words_recognized','% separate words recognized','no_recognition', 'undefined_count', 'no_recognition_because_of_trig',
                                            'timeout','resets','avg_response_time', 'max_deviation_response_time']#,
                                           # str(ASR_CMD_LIST[0]),str(ASR_CMD_LIST[1]),str(ASR_CMD_LIST[2]),str(ASR_CMD_LIST[3]),
                                           # str(ASR_CMD_LIST[4]),str(ASR_CMD_LIST[5])]

                                            # 'volume_down', 'volume_up', 'next_song', 'pause', 'resume', 'what_distance_have_i_done']


EXCEL_LJ_sTRIG_mASR_TEMPLATE_TRIG_SECTION = ['num_of_wavs', 'recognized', 'no_recognition', 'reset' ,
                                            'timeout' , 'timeout_reset']






ASR_RESULTS_PER_CMD_DICT = {'num_of_wavs' : 0, 'recognized' : 0, 'seperate_words_recognized' : 0 ,'% separate words recognized' : 0, 'no_recognition': 0, 'undefined_count': 0,
                       'no_recognition_because_of_trig': 0, 'timeout': 0 ,'resets': 'unavailable',
                       'avg_response_time': 0, 'max_deviation_response_time': 0 }#,
                       # str(ASR_CMD_LIST[0]): 0,str(ASR_CMD_LIST[1]): 0,str(ASR_CMD_LIST[2]): 0,str(ASR_CMD_LIST[3]): 0,
                        #                    str(ASR_CMD_LIST[4]): 0,str(ASR_CMD_LIST[5]): 0}

TRIG_SECTION_RESULTS_DICT = {'num_of_wavs': 0, 'recognized': 0, 'no_recognition': 0, 'reset' : 'unavailable' ,
                             'timeout': 0, 'timeout_reset': 0 , 'undefined_count': 0,'undefined_values': 0}



######################################################################################################

EXCEL_LONG_TALKS_TEMPLATE_HEADER_TUPLE= ('log_file_name','app_name', 'list_file_name','trig_to_ASR_delay', 'signal_dB',
                                  'noise_file_name','noise_dB', 'wav_name', 'recognized','counter_stopped_at')
#######Needs to support multi trigger meaning how many times was each phrase recognized during long talks
# EXCEL_LONG_TALKS_TEMPLATE_FILES_TUPLE=('wav_name','volume_up','vloume_down','next_song','previous_song','what_distance', 'recognized','duration','recognition_rate','counter_stopped_at')
EXCEL_LONG_TALKS_TEMPLATE_FILES_TUPLE=('wav_name', 'recognized','duration','recognition_rate','counter_stopped_at')
EXCEL_MTRIG_MUSIC_LONG_TALKS_TEMPLATE_FILES_TUPLE=('wav_name', 'recognized','duration','recognition_rate','counter_stopped_at','Recognition%',
                                             'volume_up', 'volume_plus_up','volume_down','volume_plus_down', 'next_song', 'pause','stop_music')
EXCEL_MTRIG_STANDBY_LONG_TALKS_TEMPLATE_FILES_TUPLE=('wav_name', 'recognized','duration','recognition_rate','counter_stopped_at','Recognition%',
                                             'power_off', 'play_music')
# TRIGGER_ONLY_TEMPLATE = {'app_name' : "", 'trigger_phrase' : '', 'num_of_wavs' : 0, 'excel_sheet_template' : "",
# 						 'recognized' : 0, 'timeout' : 0, 'no_recognition' : 0, 'resets' : 'unavailable' ,'reset_values' : [],
#                          'undefined_count' : 0 ,'undefined_values' :[] , 'avg_response_time' : 0 , "max_deviation_response_time" : 0}
LONG_TALKS_TEMPLATE = { 'num_of_wavs' : 0, 'excel_sheet_template' : "",
                        'volume_up' : 0,'vloume_down' : 0,'pause': 0,'next_song' : 0,'previous_song' : 0,'what_distance' :0,
                        'power_off' : 0,'play_music' : 0,'volume_plus_up' : 0,'vloume_plus_down' : 0,
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