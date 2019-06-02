# ===============================================================================
# jukeboxAuto is a file player with phrase-recognition capabilities
# while playing, the phrase recognition is being done corresponds to the connected device
# and an analyzed log is created
# ===============================================================================
import logging
import random
import wave
import winsound
from sys import argv

from PyQt4 import QtCore, QtGui

from Devices.HWmanager import HWmanager
from GUI.qt_ui_form_deigner import _translate
from Jukebox2014 import WavPlayerUiForm, WavPlayer
from LabJack_Listener import Listening_Loop
from Utils.wav_utils import change_wav_volume
from globs import *


class AutoWavPlayer(WavPlayer):

    def __init__(self, list_of_wavs, should_play_in_loop, temp_file, LJ_logger, MP_logger, args, list_path, num_of_wavs,\
                 randomize_delay= False, txt_recognized_trigger = "", txt_recognized_ASR = "", execution_parameters =[]):

        super(AutoWavPlayer, self).__init__(None, args, should_play_in_loop, temp_file)
        num_args = len(args) # **Added variable to check if counter names are entered or need to use defualts
        self.param_dict = execution_parameters
        self.list_of_wavs = list_of_wavs
        self.LJ_loggerThread = LJ_logger
        self.MP_loggerThread = MP_logger
        self.randomize_delay = randomize_delay
        self.delay_trig = args[4]
        self.delay_asr = args[5]
        self.sig_vol = args[2]
        self.noise = args[1]
        self.noise_vol = args[3]
        self.num_of_wavs = num_of_wavs
        self.list_path = list_path
        self.dict =args[8]
        if self.dict == "Hey Jabra":
            self.dict = "Jabra"
        elif self.dict == "Hello Rubidium":
            self.dict = "Rubidium"
        # **check if counter names are entered or need to use defualts
        if num_args >= 9:
            self.counter0 = args[9]
        else:
            self.counter0 =""
        if num_args >= 10:
            self.counter1 = args[10]
        else:
            self.counter1 =""
        self.txt_recognized_trigger = txt_recognized_trigger
        self.txt_recognized_ASR = txt_recognized_ASR

    def write_log_header_new(self):
        # setting up parameters which might be empty
        print(self.param_dict)
        for param_value in self.param_dict:
            param_value.replace(" ", "_")
        if self.param_dict["noise_file"] == "":
            noise_name = ""
            noise_path = ""
        else:
            noise_path, noise_name = os.path.split(self.param_dict["noise_file"])
        if self.param_dict["wav_list"] == "":
            wav_list = self.list_of_wavs
        else:
            wav_list = self.param_dict["wav_list"]
        if not self.param_dict.has_key("logging_device"):
            self.param_dict["logging_device"] = ""
        if not self.param_dict.has_key("next_trigger_recognition_phrases"):
            self.param_dict["next_trigger_recognition_phrases"] = ""
            if not self.param_dict.has_key("next_asr_recognition_phrases"):
                self.param_dict["next_asr_recognition_phrases"] = ""
            # Section of individiual Parameters
        log_header = "\r\n===========================================\r\n"
        log_header = log_header + "Test type: " + self.param_dict["delay_mode"] + "\r\n"
        log_header = log_header + "Test description: " + noise_name + " vol: " + str(
            int(self.param_dict["noise_volume"])) + "\r\n"
        log_header = log_header + "list of wavs: " + wav_list + "\r\n"
        log_header = log_header + "signal db is:  " + str(int(self.param_dict["Signal_volume"])) + "\r\n"
        log_header = log_header + "asr delay time is: " + str(int(self.param_dict["asr_delay"])) + "s" + "\r\n"
        # log_header = log_header + "Trigger phrase\s: " + self.param_dict["trigger_phrase"] + "\r\n"
        log_header = log_header + "Counter 0 Name: " + self.param_dict["counter0_name"] + "\r\n"
        log_header = log_header + "Counter 1 Name: " + self.param_dict["counter1_name"] + "\r\n"
        log_header = log_header + "Next Trigger Recognition phrase: " + self.param_dict[
            "next_trigger_recognition_phrases"] + "\r\n"
        log_header = log_header + "Next ASR Recognition phrase: " + self.param_dict[
            "next_asr_recognition_phrases"] + "\r\n"
        # Section of the command line to run the same test again
        # Note: the list might change from computer to computer or from run to run
        log_header = log_header + "Command line: python " + sys.argv[
            0] + " "  # "Command line: python C:\AutomationEnvironment\Jukebox\Jukebox_main.py "
        log_header = log_header + LOGGER_PATH + " "
        log_header = log_header + wav_list + " "
        log_header = log_header + os.path.join(noise_path, noise_name) + " "
        log_header = log_header + str(int(self.param_dict["Signal_volume"])) + " "
        log_header = log_header + str(int(self.param_dict["noise_volume"])) + " "
        log_header = log_header + str(int(self.param_dict["trig_delay"])) + " "
        log_header = log_header + str(int(self.param_dict["asr_delay"])) + " "
        log_header = log_header + self.param_dict["logging_device"] + " "
        log_header = log_header + self.param_dict["delay_mode"] + " "
        log_header = log_header + '"' + self.param_dict["dictionary_name"] + '"' + " "
        log_header = log_header + '"' + self.param_dict["counter0_name"] + '"' + " "
        log_header = log_header + '"' + self.param_dict["counter1_name"] + '"' + " "
        # log_header = log_header + '"' + self.param_dict["trigger_phrase"] + '"' + " "
        log_header = log_header + '"' + self.param_dict["next_asr_recognition_phrases"] + '"' + " "
        log_header = log_header + '"' + self.param_dict["next_trigger_recognition_phrases"] + '"'
        log_header = log_header + "\r\n-------------------------------------------"

        self.emit(QtCore.SIGNAL('log-info'), log_header)
        # print("Exiting WavPlayer-->write_log_header")

    def delay_between_files(self,i):
        #####################################
        ##      DELAY                     ###
        #####################################
        if self.param_dict["delay_mode"] == "TRIG" or self.param_dict["delay_mode"] == "Trig/ASR-Trig_Only":
            delay = self.delay_Trig
        elif self.param_dict["delay_mode"] == "ASR":
            if i % 2 == 0:
                str_playing_file = "Playing Trig file "
                delay = self.delay_Trig
            else:
                str_playing_file = "Playing ASR file "
                delay = self.delay_asr
        if self.randomize_delay:
            actualy_delay = random.randint(2, delay)
            self.emit(QtCore.SIGNAL('log-info'), "Delay is: " + str(actualy_delay))
        else:
            actualy_delay = delay
        print('Delay is: ' +str(actualy_delay))
        self.thread_stop_event.wait(int(actualy_delay))
        # self.thread_stop_event.wait(float(file_len_in_sec + delay - playing_time_by_now))

    def run(self):
        global is_phone_connected, recognized_phrase, STOP, number_of_waves, DEVICE, f, PAUSE
        STOP = False
        recognized_phrase = False
        i = 0
        should_play = True

        f = open(self.list_path, 'r')

        self.write_log_header_new()
        self.emit(QtCore.SIGNAL('log-info'), "Starting to play wav files...")

        curr_wav = f.readline()
        curr_wav = curr_wav.strip()
        str_playing_file = "Playing trig file "
        if curr_wav != "" and re.search('.wav',curr_wav):
            time_before_processing = time.time()
            change_wav_volume(curr_wav, self.temp_file, self.signal_volume)
            processing_time = time.time() - time_before_processing
        else:
            print('cant play row ' + curr_wav + '!' )
            i += 1
            should_play = False

        playing_time = 0
        file_len_in_sec = 0
        # print (number_of_waves)
        self.delay_between_files(i)
        while i <= number_of_waves and not STOP:
            # print i
            self.wait_for_resume()  # if pause is pressed the process will remain in the wait_for_resume function until Resume is pressed
                                    # otherwise it will return imediatly and continue playing
            if curr_wav != "":
                try:
                    wav_file = wave.open(curr_wav,'rb')
                    wav_frames = wav_file.getnframes()
                    wav_freq = wav_file.getframerate()
                    file_len_in_sec = float(wav_frames) / wav_freq
                except wave.Error as e:
                    pass

                if should_play:
                    #####################################
                    ##     PLAYING SIGNAL             ###
                    #####################################
                    i += 1
                    # self.emit( QtCore.SIGNAL('log-info'), "Playing file %s" % curr_wav)        # older position
                    print("Playing: " + curr_wav)
                    winsound.PlaySound(self.temp_file, 0)
                    playing_time = time.time()
                
                    self.emit(QtCore.SIGNAL('log-info'), str_playing_file + curr_wav)
                    self._played_wav = i
                    self.emit(QtCore.SIGNAL('Played_Wavs'))
                    #####################################
                    ##      DELAY                     ###
                    #####################################
                    self.delay_between_files(i)
                    # if self.param_dict["delay_mode"] == "TRIG" or self.param_dict["delay_mode"] == "Trig/ASR-Trig_Only":
                    #     delay = self.delay_Trig
                    # elif self.param_dict["delay_mode"] == "ASR":
                    #     if i % 2 == 0:
                    #         str_playing_file = "Playing Trig file "
                    #         delay = self.delay_Trig
                    #     else:
                    #         str_playing_file = "Playing ASR file "
                    #         delay = self.delay_asr
                    # if self.randomize_delay:
                    #     actualy_delay = random.randint(2, delay)
                    #     self.emit(QtCore.SIGNAL('log-info'), "Delay is: " + str(actualy_delay))
                    # else:
                    #     actualy_delay = delay
                    # # print('Delay is: ' +str(actualy_delay))
                    # self.thread_stop_event.wait(int(actualy_delay))
                    # # self.thread_stop_event.wait(float(file_len_in_sec + delay - playing_time_by_now))
                    #####################################
                    ##   CHECK RESULTS on devices     ###
                    #####################################
                    if re.search("lj", self.param_dict["logging_device"].lower()):
                        self.LJ_loggerThread.start()
                    if re.search("mp", self.param_dict["logging_device"].lower()):
                        self.MP_loggerThread.start()

                # If should_play_in_loop, stay in the wavs list bounds
                if self.should_play_in_loop:
                    i %= len(self.list_of_wavs)

                if os.stat(curr_wav).st_size > 10 * 1024**2:
                    self.emit(QtCore.SIGNAL('log-info'), "Error - File size is bigger than maximum allowed for file %s" % curr_wav)
                    should_play = False
                    continue

            ################################
            curr_wav = f.readline()
            curr_wav = curr_wav.strip()
            ################################
            if curr_wav != "" and re.search('.wav',curr_wav):
                # Change the wav volume, and measure how much time it takes
                time_before_processing = time.time()
                change_wav_volume(curr_wav, self.temp_file, self.signal_volume)
                processing_time = time.time() - time_before_processing
                playing_time_by_now = time.time() - playing_time

                should_play = True
            else:
                print('cant play row ' + curr_wav + '!')
                i += 1
                should_play = False

            if STOP and DEVICE == 'Listener':
                Listening_Loop.stop_loop(self)
                print("app stopped")

        #Finished playing (exit playing loop)
        #Check Devices for results one last time
        self.thread_stop_event.wait(int(self.delay_Trig))
        if re.search("lj", self.param_dict["logging_device"].lower()):
            self.LJ_loggerThread.start()
        if re.search("mp", self.param_dict["logging_device"].lower()):
            self.MP_loggerThread.start()
        self.thread_stop_event.clear()
        self.emit(QtCore.SIGNAL('play-done'))
        self.emit(QtCore.SIGNAL('close'))

class AutoWavPlayerUiForm(WavPlayerUiForm):
    # decorator that checks for argv (user's arguments) existence before a function gets invoke
    # ===========================================================================
    # def args_auto_exec(func):
    #     def args_check(self):
    #         if self.args:
    #             return func(*args, **kw)
    #         
    #     return args_check   
    # ===========================================================================
            
    def __init__(self):
        WavPlayerUiForm.__init__(self)

        self.args = self.are_args(sys.argv[1:])
        self.dev = None
        if self.args:
            if os.path.isfile(argv[1]):
                try:
                    os.remove(argv[1])
                except OSError:  # , e:OSError
                    print(OSError)

    # @args_auto_exec
    def auto_close_ui(self):
        if self.chkbox_mp_logging.isChecked():
            self.MP_dev.close()
        if self.chkbox_labjack_logging.isChecked():
            self.LJ_dev.close()
        if self.args is True:
            QtGui.QApplication.closeAllWindows()

    def _set_ui_after_playing(self):
        # self._set_buttons_after_playing()
        # self.auto_close_ui()
        QtCore.QTimer.singleShot(3000, self.auto_close_ui)

    def handle_play_button(self):
        """
        When the "Play" button is clicked, iterate on the wav dirs, get all the wavs,
        and play them one by one
        """

        # =======================================================================
        # Only play if there is not another thread already playing
        # if not self.playing_thread or not self.playing_thread.isRunning():
        #     self._set_buttons_before_playing()
        #     wav_files = self.chosen_wavs
        #     self.playing_thread = WavPlayer(wav_files, self._get_delay(), self.should_play_in_loop.checkState()\
        #     , self.wavsVolSpinBox.value(), self.temp_wav_file2)
        #     
        #     self.widget.connect( self.playing_thread, QtCore.SIGNAL("log-info"), logging.info )
        #     self.widget.connect( self.playing_thread, QtCore.SIGNAL("log-debug"), logging.debug )
        #     self.widget.connect( self.playing_thread, QtCore.SIGNAL("log-error"), logging.error )
        #     
        #     self.widget.connect( self.playing_thread, QtCore.SIGNAL("Played_Wavs"), self.current_played_wavs)
        # =======================================================================

        self._set_buttons_before_playing()
        if self.chk_play_random_order.isChecked():
            self.randomize_play_list()
        # wav_files = self.chosen_wavs
        self.start()
        if not self.playing_thread.isRunning() and not self.playing_thread.isFinished():
            self.widget.connect(self.playing_thread, QtCore.SIGNAL("log-info"), logging.info)
            self.widget.connect(self.playing_thread, QtCore.SIGNAL("log-debug"), logging.debug)
            self.widget.connect(self.playing_thread, QtCore.SIGNAL("log-error"), logging.error)
            self.widget.connect(self.playing_thread, QtCore.SIGNAL("Played_Wavs"), self.current_played_wavs)
            self.widget.connect(self.playing_thread, QtCore.SIGNAL("play-done"), lambda: self._set_buttons_after_playing())

        self.widget.connect(self.playing_thread, QtCore.SIGNAL("Played_Wavs"), self.current_played_wavs)
        self.widget.connect(self.playing_thread, QtCore.SIGNAL("play-done"), self._set_ui_after_playing)
        self.widget.connect(self.playing_thread, QtCore.SIGNAL("play-done"), self.close_device_connection)

        self.playing_thread.start()
        self.Tabs.setCurrentIndex(1)


        # self.Tabs.currentWidget('Logs')

    def handle_device_changed(self):
        # print("Device has changed to " + self.Devic_List.currentText())
        global DEVICE
        DEVICE = self.Devic_List.currentText()
        if self.Devic_List.currentText() == "Evaluation Board" or self.Devic_List.currentText() == "Listener":
            self.chkbox_labjack_logging.setChecked(True)
            self.chkbox_mp_logging.setChecked(False)
        if self.Devic_List.currentText() == "Mobile Phone":
            self.chkbox_mp_logging.setChecked(True)
            self.chkbox_labjack_logging.setChecked(False)
        if self.Devic_List.currentText() == "LJ-MP":
            self.chkbox_mp_logging.setChecked(True)
            self.chkbox_labjack_logging.setChecked(True)
        if self.Devic_List.currentText() == "None":
            self.chkbox_mp_logging.setChecked(False)
            self.chkbox_labjack_logging.setChecked(False)
        self.initiate_device(DEVICE)
        self.control_listener_GUI()
        self._dump_param("logging_device", self.Devic_List.currentIndex())

    def initiate_device(self,device):
        global DEVICE
        if DEVICE == "Evaluation Board":
            DEVICE = "EB"
        elif DEVICE == "Mobile Phone":
            DEVICE = "MP"
        if DEVICE == "EB" or DEVICE == "MP":
            self.dev = HWmanager.set_device(DEVICE)
        if self.chkbox_mp_logging.isChecked():
            self.MP_dev = HWmanager.set_device('MP')
        if self.chkbox_labjack_logging.isChecked():
            self.LJ_dev = HWmanager.set_device('EB')

    def handle_choose_noise(self, noise):
        if not self.args:
            noise_wav = str(QtGui.QFileDialog.getOpenFileName(None, "Select File", self.get_recent_path("noise_file"))).replace('/', '\\')
        else:
            noise_wav = noise
        if noise_wav == '':
            return

        self.noiseList.takeItem(0)
        item = QtGui.QListWidgetItem()
        item.setText(_translate("Form", noise_wav, None))
        self.noiseList.addItem(item)
        self.btn_play_noise.setEnabled(True)
        self._dump_param("noise_file", noise_wav)

    def handle_stop_button(self):
        global STOP
        STOP = True
        self.close_device_connection()
        super(AutoWavPlayerUiForm, self). handle_stop_button()

    def _refresh_num_of_wavs(self):
        self.chosen_wavs = self._get_chosen_wavs()
        self.lbl_numOfWavs.setText("Found %d wavs" % len(self.chosen_wavs))

    def current_played_wavs(self):
        if isinstance(self.chosen_wavs, int):
            self.lbl_numOfWavs.setText("Played %d/%d wavs" % (self.playing_thread._played_wav, self.chosen_wavs))
            self.lbl_numOfWavs_2.setText("Played %d/%d wavs" % (self.playing_thread._played_wav, self.chosen_wavs))
        else:
            self.lbl_numOfWavs.setText("Played %d/%d wavs" % (self.playing_thread._played_wav, len(self.chosen_wavs)))
            self.lbl_numOfWavs_2.setText("Played %d/%d wavs" % (self.playing_thread._played_wav, len(self.chosen_wavs)))
        
    # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!                  
    def are_args(self, args):
        if len(args) >= 2:
            return True
        elif len(args) == 1:
            print("Some arguments are missing - [log file] [wav list] [noise wav] [wav vol] [noise vol]\
             [delay vol] [tested device] ")
            raise SystemExit() 
        return False

    def set_args(self, args):
        args_list = [0 for i in xrange(16)]
        j = len(args) if len(args) > 3 else 3
        for i in xrange(j-1):
            args_list[i] = args[i]
        
        # print args
        if j > 2:
            if re.search('^-?[0-9]{1,2}(?!.)',args_list[2]) is not None:
                ''' without noise '''    
                args_list[3] = args[2]          # wav vol
                args_list[2] = 0
                ''' with delay '''
                if j == 5: 
                    args_list[5] = args[3]      # delay vol
            else:
                i = 3
                for arg in args[3:]:
                    # if  i<= len(args_list):
                    args_list[i] = arg
                    i += 1
        return args_list

    def Create_Wav_List_File(self):
        global number_of_waves
        f = open(FILE_PATH, 'w+')
        for index in xrange(self.wavList.count()):
            # print(str(self.wavList.item(index).text()))
            f.write("%s\n" % str(self.wavList.item(index).text()))
        # List_of_Wavs = self._get_chosen_wavs()
        f.close()
        number_of_waves = self.wavList.count()

    def start(self):
        self.start_log()
        # **Check if counter names are given via parameters
        num_args = len(sys.argv)
        if num_args >= 11:
            Counter0Name = (sys.argv[11])
        else:
            Counter0Name =""
        if num_args > 12:
            Counter1Name = sys.argv[12]
        else:
            Counter1Name = ""
        if EXECUTION_MODE == "Auto":
            wav_list_file = sys.argv[2]
            if self.execution_parameters["delay_mode"].lower() == "trig":
                self.Mode_List.setCurrentIndex(0)
            elif self.execution_parameters["delay_mode"].lower() == "trig/asr-trig_only":
                self.Mode_List.setCurrentIndex(2)
            elif self.execution_parameters["delay_mode"].lower() == "trig/asr" \
                    or self.execution_parameters["delay_mode"].lower() == "asr":
                self.Mode_List.setCurrentIndex(1)
        else:
            # print("Manual execution")
            self.Create_Wav_List_File()
            wav_list_file = FILE_PATH
            self.execution_parameters["delay_mode"] = str(self.Mode_List.currentText())
        # check for device or playlist only
        if DEVICE == "EB" or DEVICE == "MP" or DEVICE == "LJ-MP":
            self.dev.playing_thread = self.playing_thread

            randomize = self.chk_randomize_delay.isChecked()
            args = self.get_log_header_details()
            if len(sys.argv) > 1:
                list_path = sys.argv[1]
            else:
                list_path = "List_loaded_manualy"
            txt_recognized_trigger = self.txt_recognized_trigger.text()
            self.initiate_device(DEVICE)

            if self.chkbox_mp_logging.isChecked():
                self.MP_dev.start(str(self.Dictionary_List.currentText()))
                self.MP_loggerThread = self.MP_dev.logger()
                # self.loggerThread = self.MP_loggerThread
                self.widget.connect( self.MP_loggerThread, QtCore.SIGNAL("log-info"), logging.info )
                self.widget.connect( self.MP_loggerThread, QtCore.SIGNAL("log-debug"), logging.info )
                self.widget.connect( self.MP_loggerThread, QtCore.SIGNAL("recognized"), self.recognized_MP_event)
                self.widget.connect(self.MP_loggerThread, QtCore.SIGNAL("close"), self.close_device_connection)
            else:
                self.MP_loggerThread = ""
            if self.chkbox_labjack_logging.isChecked():
                self.LJ_dev.start(str(self.Dictionary_List.currentText()))
                self.LJ_loggerThread = self.LJ_dev.logger(Counter0Name,Counter1Name) # **pass counter names to logger
                # self.loggerThread = self.LJ_loggerThread
                self.widget.connect( self.LJ_loggerThread, QtCore.SIGNAL("log-info"), logging.info )
                self.widget.connect( self.LJ_loggerThread, QtCore.SIGNAL("log-debug"), logging.info )
                self.widget.connect( self.LJ_loggerThread, QtCore.SIGNAL("recognized"), self.recognized_LJ_event)
                self.widget.connect(self.LJ_loggerThread, QtCore.SIGNAL("close"), self.close_device_connection)
            else:
                self.LJ_loggerThread = ""

            self.playing_thread = AutoWavPlayer(wav_list_file, self.should_play_in_loop.checkState(), self.temp_wav_file2,\
                                                self.LJ_loggerThread,self.MP_loggerThread, args, list_path, self.lbl_numOfWavs, randomize,\
                                                self.txt_recognized_trigger.text(),self.txt_recognized_asr.text(),self.execution_parameters)
        else:
            if DEVICE == "Listener":
                print("Activate the listener")
                check_interval = float(self.txt_LabJack_Check_Insterval.text()) / 1000
                log_labjack_counter_always = self.chk_print_counter.isChecked()
                if self.execution_parameters["listening_duration"] > 0:
                    listening_duration = int(self.execution_parameters["listening_duration"])
                else:
                    listening_duration = 345600 #4 days in seconds
                self.dev = Listening_Loop(listening_duration, check_interval,str(self.Dictionary_List.currentText()),\
                                          self.execution_parameters["counter0_name"],self.execution_parameters["counter1_name"],
                                          'From JukeBox',log_labjack_counter_always)
                if self.chkbox_mp_logging.isChecked():
                    self.MP_dev.start()
                    self.widget.connect(self.MP_dev, QtCore.SIGNAL("log-info"), logging.info)
                if self.chkbox_labjack_logging_logging.isChecked():
                    self.LJ_dev.start()
                    self.widget.connect(self.LJ_dev, QtCore.SIGNAL("log-info"), logging.info)
            super(AutoWavPlayerUiForm, self).start()    # invokes a playlist

    # def recognized_event(self):
    #     global recognized_cur_wav
    #     self.recognized_phrase = recognized_phrase
    #
    #     recognized_cur_wav = True
    #     if self.chkbox_mp_logging.isChecked():
    #         self.MP_loggerThread.emit(QtCore.SIGNAL('log-info'), "Recognized! - " + self.recognized_phrase)
    #     else:
    #         self.LJ_loggerThread.emit(QtCore.SIGNAL('log-info'), "Recognized! - " + self.recognized_phrase)

    def recognized_LJ_event(self):
        global recognized_cur_wav
        self.recognized_phrase = recognized_phrase

        recognized_cur_wav = True
        self.LJ_loggerThread.emit(QtCore.SIGNAL('log-info'), "Recognized! - " + self.recognized_phrase)

    def recognized_MP_event(self):
        global recognized_cur_wav
        self.recognized_phrase = recognized_phrase

        recognized_cur_wav = True
        self.MP_loggerThread.emit(QtCore.SIGNAL('log-info'), "MP:Recognized! - ")

    def close_device_connection(self):
        print("Close device was called")
        if DEVICE == "EB" or DEVICE == "MP" or DEVICE == "Listener":
            self.dev.close()
            if self.chkbox_labjack_logging.isChecked():
                self.LJ_dev.close()
                self.LJ_loggerThread.close()
            if self.chkbox_mp_logging.isChecked():
                self.MP_dev.close()
                self.MP_loggerThread.close()
            if not DEVICE == "Listener":
                self.loggerThread.close()

    def closeEvent(self, event):
        #print(type(event))
         super(AutoWavPlayerUiForm, self).closeEvent(event)

    def set_mode_auto(self):
        """   arguments format -
        [jukebox log file with its path] [wav list text file with its path] [noise wav file with its path] [wav volume]
        [noise volume] [wav interval delay] [tested hw device] [mode:ASR/TRIG] [dictionary name] """
        global number_of_waves
        self.execution_parameters = self._get_params()
        if sys.argv[1].lower() == 'python':
            args_to_skip = 3
        else:
            args_to_skip = 1
        arg_list = self.set_args(sys.argv[args_to_skip:])
        num_args = len(arg_list) # Get number of arguments for checking if counter names are given or not
        wav_list = arg_list[1]
        self.execution_parameters["wav_list"] = arg_list[1]
        noise = arg_list[2]
        self.execution_parameters["noise_file"] = arg_list[2]
        wavs_vol = int(arg_list[3])
        self.execution_parameters["Signal_volume"] = int(arg_list[3])
        noise_vol = int(arg_list[4])
        self.execution_parameters["noise_volume"] = int(arg_list[4])
        delay = int(arg_list[5])
        self.execution_parameters["asr_delay"] = int(arg_list[5])
        delay_ASR = int(arg_list[6])
        self.execution_parameters["trig_delay"] = int(arg_list[6])
        tested_hw = arg_list[7]
        self.execution_parameters["logging_device"] = arg_list[7]
        self.execution_parameters["delay_mode"] = arg_list[8]
        dictionary_name = arg_list[9]
        self.execution_parameters["dictionary_name"] = arg_list[9]
        # ** if counter names are given via arguments set the text fields in GUI accordingly
        if num_args >= 11:
            self.txtCounter0Name.setText(arg_list[10])
        else:
            self.txtCounter0Name.setText("")
        self.execution_parameters["counter0_name"] = str(self.txtCounter0Name.text())
        if num_args >= 12:
            self.txtCounter1Name.setText(str(arg_list[11]))
        else:
            self.txtCounter1Name.setText("")
        self.execution_parameters["counter1_name"] = str(self.txtCounter1Name.text())
        if self.execution_parameters["logging_device"].lower() == "listener":
            self.execution_parameters["listening_duration"] = int(arg_list[12])
        ###########################################################
        # UPDATE GUI according to Parameters from Arguments
        ###########################################################
        if tested_hw.lower() == "eb" or tested_hw.lower() == "lj":
            self.Devic_List.setCurrentIndex(0)
            self.chkbox_labjack_logging.setChecked(True)
        elif tested_hw.lower() == "mp":
            self.Devic_List.setCurrentIndex(1)
            self.chkbox_mp_logging.setChecked(True)
        elif tested_hw.lower() == "listener":
            self.chkbox_labjack_logging.setChecked(True)
            self.Devic_List.setCurrentIndex(2)
        elif tested_hw.lower() == "mp-lj" or tested_hw.lower() == "lj-mp":
            self.Devic_List.setCurrentIndex(4)
            self.chkbox_mp_logging.setChecked(True)
            self.chkbox_labjack_logging.setChecked(True)
        else:
            self.Devic_List.setCurrentIndex(3)

        self.clear_wav_list()

        number_of_waves = self.handle_add_wavs_from_list(wav_list)
        self.wavsVolSlider.setSliderPosition(wavs_vol)
        self.should_delay.setCheckState(QtCore.Qt.Checked)
        self.spin_delay_time.setValue(delay)
        self.spin_delay_time_ASR.setValue(delay_ASR)
        # "OK Google","Hey Jabra","Hello Rubidium","Fit Bit"
        if dictionary_name.lower() == "jabra" or dictionary_name == "hey jabra":
            self.Dictionary_List.setCurrentIndex(1)
        elif dictionary_name.lower() == "hello rubidium" or dictionary_name.lower() == "rubidium":
            self.Dictionary_List.setCurrentIndex(2)
        elif dictionary_name.lower() == "ambarella":
            self.Dictionary_List.setCurrentIndex(3)
        elif dictionary_name.lower() == "fitbit":
            self.Dictionary_List.setCurrentIndex(4)
        elif dictionary_name.lower() == "jabra_old2" or dictionary_name.lower() == "jabra_old":
            self.Dictionary_List.setCurrentIndex(5)
        elif dictionary_name.lower() == "google_old":
            self.Dictionary_List.setCurrentIndex(6)
        elif dictionary_name.lower() == "alexa":
            self.Dictionary_List.setCurrentIndex(7)
        else:
            self.Dictionary_List.setCurrentIndex(0)
        ###########################################################
        ###########################################################

        if isinstance(arg_list[2], str):
            self.noiseVolSlider.setSliderPosition(noise_vol)
            self.handle_choose_noise(noise)
            QtCore.QTimer.singleShot(1500, ui.handle_play_noise_button)

        QtCore.QTimer.singleShot(3000, ui.handle_play_button)

    def set_log(self):
        super(AutoWavPlayerUiForm, self).set_log()


if __name__ == "__main__":
    import sys

    app = QtGui.QApplication(sys.argv)
    Form = QtGui.QWidget()

    ui = AutoWavPlayerUiForm()
    ui.setupUi(Form)

    if len(sys.argv[1:]) > 0:
        ui.set_mode_auto()

    Form.show()
    sys.exit(app.exec_())