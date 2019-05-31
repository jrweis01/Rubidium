'''
@author: shoham peller, barak rosen
 Rewritten by Josh Weiss
'''
import pickle
import tempfile
import threading
import wave
import pyaudio
import numpy
try:
	from Devices.LabJack import *
	LJ_LOAD_ERROR = False
except ImportError:
	LJ_LOAD_ERROR = True
	print("LJ MODULE COULDN'T LOAD")
from Devices.phone import *
from Devices.uart import *
from Devices.RS232 import *
from Devices.QCC_USB import *

from GUI.qt_ui_form_deigner import *
from GUI.qt_ui_form_deigner import _translate
from Utils.get_files_from_directories import fetchFiles, browse_for_file, multiply_lines
from Utils.wav_utils import change_wav_volume, create_empty_wave, wav_to_wav, add_quiet_to_wav

# import threading
FOUND_PHRASE = {}

PARAMS_PATH = os.path.join(os.path.dirname(__file__), "jukebox_params.dat")
DEBUG_PRINTING = False

def get_temp_file_name():
    fd, temp_file = tempfile.mkstemp()
    os.close(fd)
    os.unlink(temp_file)
    return temp_file

def get_timestamp():
	now = datetime.datetime.now()
	timestamp = now.strftime(LOGGER_DATE_FORMAT) + ('.%03d' % (now.microsecond / 10000))
	return time
logging_level = logging.INFO
if DEBUG:
	logging_level = logging.DEBUG


class TextRedirect(object):
	"""
	This class implements a file-descriptor, but writing it's content to a text box
	"""
	def __init__(self, text_box):
		# print("initiating TextRedirect CLASS")
		self.text_box = text_box

	def write(self, text):
		if DEBUG_PRINTING == True:  print("Entering TextRedirect-->write")
		self.text_box.setText(str(self.text_box.toPlainText()) + text)
		scroll_bar = self.text_box.verticalScrollBar()
		scroll_bar.setValue(scroll_bar.maximum())
		if DEBUG_PRINTING == True:  print("Exiting TextRedirect-->write")


class WavPlayer(QtCore.QThread):
	def __init__(self, number_of_wavs_to_play, path_to_list_of_wavs, param_dict, should_play_in_loop, temp_file, auto_close = False):

		# print("initiating WavPlayer CLASS")
		QtCore.QThread.__init__(self)
		self.param_dict = {}
		self.param_dict = param_dict #This takes all the parameters saved to Header_dict in the Wave player GUI class so the parameters can be used in the player class.
		# print(param_dict)
		self.number_of_wavs_to_play = number_of_wavs_to_play
		self.path_to_list_of_wavs = path_to_list_of_wavs
		self.commands_played = self.param_dict["delay_mode"]
		self.delay_before_trigger = int(self.param_dict["trig_delay"])
		self.delay_between_trigger_and_asr = int(self.param_dict["asr_delay"])
		self.should_play_in_loop = should_play_in_loop
		self.new_volume = int(self.param_dict["Signal_volume"])
		self.temp_file = temp_file
		self.thread_stop_event = threading.Event()
		self.auto_close = auto_close # determines if the JukeBox should be closed automatically after playing the list of files it has to play.  this is needed when running the Juke Box via batch file so that the next Juke Box can be oppened
		self._played_wav = 0
		self.next_trigger = False
		self.next_asr = False

	def write_log_header(self):
		# Writes the header of the Log so that all paramters needed to rerun the test and to parse the relevant log are recorded
		if DEBUG_PRINTING == True:  print("Entered WavPlayer-->write_log_header")

		# setting up parameters which might be empty
		for param_value in self.param_dict:
			param_value.replace(" ", "_")
		if self.param_dict["Noise_file_path"] == "":
			noise_name = ""
			noise_path = ""
		else:
			noise_path, noise_name = os.path.split(self.param_dict["Noise_file_path"])
		if self.param_dict["wav_list_path"] == "":
			wav_list = "<wave_List>"
		else:
			wav_list = self.param_dict["wav_list_path"]
		if not self.param_dict.has_key("logging_device"):
			self.param_dict["logging_device"] = ""

		# Section of individiual Parameters
		log_header = "\r\n===========================================\r\n"
		log_header = log_header + "Test_type: " + self.param_dict["delay_mode"] + "\r\n"
		log_header = log_header + "Test description: " + noise_name + " vol: " + str(
			int(self.param_dict["noise_volume"])) + "\r\n"
		log_header = log_header + "list of wavs: " + wav_list + "\r\n"
		log_header = log_header + "signal db is:  " + str(int(self.param_dict["Signal_volume"])) + "\r\n"
		log_header = log_header + "asr delay time is: " + str(int(self.param_dict["asr_delay"])) + "s" + "\r\n"
		log_header = log_header + "Counter 0 Name: " + self.param_dict["counter0_name"] + "\r\n"
		log_header = log_header + "Counter 1 Name: " + self.param_dict["counter1_name"] + "\r\n"
		log_header = log_header + "Trigger Recognition phrase: " + self.param_dict[
			"trigger_recognition_phrases"] + "\r\n"
		log_header = log_header + "ASR Recognition phrase(s): " + self.param_dict[
			"asr_recognition_phrases"] + "\r\n"
		# Section of the command line to run the same test again
		# Note: the list might change from computer to computer or from run to run
		log_header = log_header + "Command line: python " + self.param_dict["JukeBox_path"] + " "  # "Command line: python C:\AutomationEnvironment\Jukebox\Jukebox_main.py "
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
		log_header = log_header + '"' + self.param_dict["test_type"] + '"' + " "
		log_header = log_header + '"' + self.param_dict["counter0_name"] + '"' + " "
		log_header = log_header + '"' + self.param_dict["counter1_name"] + '"' + " "
		log_header = log_header + '"' + self.param_dict["trigger_recognition_phrases"] + '"' + " "
		log_header = log_header + '"' + self.param_dict["asr_recognition_phrases"] + '"'
		log_header = log_header + "\r\n-------------------------------------------"

		self.emit(QtCore.SIGNAL('log-info'), log_header)
		if DEBUG_PRINTING == True:  print("Exiting WavPlayer-->write_log_header")

	def wait_for_resume(self):
        # When pressing Pause during play of wavs this function is called from the playeyer
        # the function will stay in a loop untill the global parameter PAUSE is change to false
        # pressing the button Resume sets PAUSE to false
		global PAUSE
		while PAUSE:
			time.sleep(1)

	def delay_before_playing(self,i,should_play):
		# Sleep until timeout has passed or until relevant command is recognized in the log or until user pressed stop
		# self.thread_stop_event.wait(max(0, self.delay_between_wavs - procssing_time + 1))
		# print(self.commands_played)
		delay_mode = self.commands_played.lower()
		startdelay = time.time()
		check_interval = 0.2
		should_play
		
		# print("Counter0= " + self.param_dict["counter0_name"])
		if self.param_dict["counter0_name"] !="" and str(self.param_dict["counter0_name"]).lower() != "none":
			Counter0 = True
		else:
			Counter0 = False
		# print("Counter1= "+self.param_dict["counter1_name"])
		if self.param_dict["counter1_name"] != "" and str(self.param_dict["counter1_name"]).lower() != "none":
			Counter1 = True
		else:
			Counter1 = False
		if Counter0 and Counter1:
			Dont_check_keywords = True
		else:
			Dont_check_keywords = False
		#  print("Delay Mode is: " + delay_mode)
		if delay_mode == "trig/asr-trig_only" or delay_mode == "trigger_only" or delay_mode == "trig" or delay_mode == "m-trig" or \
				((delay_mode == "trig/asr" or delay_mode == "asr") and i % 2 == 0):
			str_playing_file = "Playing trig file"
			# print("delay before trigger")
			# print(self.param_dict["trigger_recognition_phrases"])
			if ((delay_mode == "trig/asr" or delay_mode == "asr") and self.param_dict["asr_recognition_phrases"] == ""):
				Dont_check_keywords = True
			elif self.param_dict["trigger_recognition_phrases"] == "":
				Dont_check_keywords = True
			else:
				Dont_check_keywords = False

			if i == 0 or Dont_check_keywords:

				# print("Delay Before Trigger is according to preset delay time")
				actual_delay = self.delay_before_trigger
			else:
				# recognition_phrases = str(self.param_dict["trigger_recognition_phrases"])
				# print("play is delayed until " + recognition_phrases.lower() + " is found in the log")
				j = 0
				# print("Max iterations: " + str(self.delay_before_trigger / check_interval))

				# while FOUND_PHRASE["Next_TRIGGER"] == False and j <= self.delay_before_trigger / check_interval:
				while self.next_trigger == False and j <= self.delay_before_trigger / check_interval:
					#  print("Checked -Next_TRIGGER=" + self.next_trigger)
					self.thread_stop_event.wait(check_interval)
					j += 1
				# if j >= self.delay_before_trigger / check_interval:
				# 	#should_play = False
				# 	if self.is_bt_connected() == False:
				# 		# self.close()
				# 		return False, "Lost BT Connection"

				# print("# iterations: " + str(j))
				if self.next_trigger == False:
					actual_delay = 0
				else:
					actual_delay = 2
				# actual_delay = 0
				self.next_trigger = False
		elif delay_mode == "trig/asr" or delay_mode == "asr":  # comands being played are trigger and ASR
			# print("delay before ARS")
			str_playing_file = "Playing ASR file"
			if self.param_dict["trigger_recognition_phrases"] == "" or i == 0 or Dont_check_keywords:
			#if self.param_dict["asr_recognition_phrases"] == "" or i == 0:
				actual_delay = self.delay_between_trigger_and_asr
				should_play = True
				# print("Dont check keyword is: "+ str(Dont_check_keywords) +";  Recognition phrases are: "+self.param_dict["trigger_recognition_phrases"])
			else:
				j = 0
				while FOUND_PHRASE["Next_ASR"] == False and j <= self.delay_between_trigger_and_asr / check_interval:# 120
					# print("Next ASR is: "+ str(FOUND_PHRASE["Next_ASR"]))
					self.thread_stop_event.wait(check_interval)
					# sleep(0.1)
					j += 1
				if j >= self.delay_between_trigger_and_asr / check_interval:
					#should_play = False
					FOUND_PHRASE["Next_TRIGGER"] = True
					# print("FOUND_PHRASE-Next_TRIGGER set to True because of ASR timeout")
					if self.is_bt_connected() == False:
						self.close()
						#should_play = Flase
				else:
					should_play = True
				actual_delay = 0
		else:
			str_playing_file = "Playing file"
			# print("NO delay")
			actual_delay = 0
		# print("Pre-set delay is: " + str(actual_delay))
		self.thread_stop_event.wait(actual_delay)
		# print("delay time was " + str(time.time() - startdelay)[:3])
		return should_play,str_playing_file

	def play_wav(self, wav_file_path, signal_dB):
		if DEBUG_PRINTING == True:  print("Playing wav " + wav_file_path + " with Gain" + str(signal_dB) + " dB")
		CHUNK = 1024

		wf = wave.open(wav_file_path, 'rb')

		p = pyaudio.PyAudio()

		maxShort = pow(2, 15) - 1
		minShort = -pow(2, 15)
		gain_dB = float(signal_dB)
		gainFactor = pow(10, gain_dB / 20.0)

		stream = p.open(format=p.get_format_from_width(wf.getsampwidth()),
						channels=wf.getnchannels(),
						rate=wf.getframerate(),
						output=True)

		data = wf.readframes(CHUNK)

		while data != '':
			decodeddata = numpy.fromstring(data, numpy.int16)
			newdata = (decodeddata * gainFactor).clip(minShort, maxShort).astype(numpy.int16)
			stream.write(newdata.tostring())
			data = wf.readframes(CHUNK)

		stream.stop_stream()
		stream.close()

		p.terminate()

	def run(self):
		if DEBUG_PRINTING == True:  print("Entered WavPlayer-->run")
		global recognized_cur_wav
		global FOUND_PHRASE

		if self.number_of_wavs_to_play == 0:
			self.emit( QtCore.SIGNAL('log-error'), "No waves selected. Can't play")
			self.emit( QtCore.SIGNAL('play-done'))
			return

		self.emit( QtCore.SIGNAL('log-info'), "Starting to play wav files...")

		should_play = True
		i = 0
		################################
		f = open(self.path_to_list_of_wavs, 'r')
		curr_wav = f.readline()
		curr_wav = curr_wav.strip()
		################################


		self.write_log_header()
        # Loop of playing the Wav Files
		while i != self.number_of_wavs_to_play:
			# print("Playing Wav # " + str(i))
			self.wait_for_resume()  # if pause is pressed the process will remain in the wait_for_resume function until Resume is pressed
			# otherwise it will return imediatly and continue playing

			should_play, str_playing_file = self.delay_before_playing(i,should_play)
			now = datetime.datetime.now()
			timestamp = now.strftime(LOGGER_DATE_FORMAT)+ ('.%03d' % (now.microsecond / 10000))
			if should_play:
				# print(str_playing_file + " " + curr_wav)
				self.emit( QtCore.SIGNAL('log-info'), timestamp + " - " + str_playing_file + " " + curr_wav)
				FOUND_PHRASE["Next_TRIGGER"] = False
				# print("FOUND_PHRASE-Next_TRIGGER = False")
				FOUND_PHRASE["Next_ASR"] = False
				# print("FOUND_PHRASE-Next_ASR = False")
				self.play_wav(curr_wav, self.new_volume)
				# print("Finished Playing wav")
				self._played_wav = i
				self.emit(QtCore.SIGNAL('Played_Wavs'))
			elif str_playing_file == "Lost BT Connection":
				i = self.number_of_wavs_to_play
			else: #Skip playing next wav since previous command was not recognized by the target
				# print("Not " + str_playing_file + " " + curr_wav)
				self.emit(QtCore.SIGNAL('log-info'), timestamp + " - " + "Not " +  str_playing_file + " " + curr_wav)
			should_play = False

			i += 1
			# If should_play_in_loop, stay in the wavs list bounds
			if self.should_play_in_loop:
				i %= self.number_of_wavs_to_play

			if i >= self.number_of_wavs_to_play:
				self.close()
				continue

			curr_wav = f.readline()
			curr_wav = curr_wav.strip()

			should_play = True

			# If recievied exit signal, break
			# print("checking if break was recieved")
			if self.thread_stop_event.is_set():
				if recognized_cur_wav:
					recognized_cur_wav = False
					self.thread_stop_event.clear()
					self.thread_stop_event.wait(5)
					if self.thread_stop_event.is_set():
						self.emit( QtCore.SIGNAL('log-info'), "Stopped!")
						break
				else:
					self.emit( QtCore.SIGNAL('log-info'), "Stopped!")
					break
		if DEBUG_PRINTING == True:  print("Exiting WavPlayer-->run")

	def is_bt_connected(self):
        #when unexpected results are seen this function can be used to determine if the entire test should be stopped or not.
		if DEBUG_PRINTING == True:  print("Checking if BT is still connected")
		#Reading the log from end to begining to see if BT is reported as connected or disconnected
		for line in reversed(open(LOGGER_PATH).readlines()):
			if "BT Is Connected" in line:
				#found line connected before line disconnected
				return True
			elif "BT Disconnected" in line:
				# found line disconnected without line of connected
				return False
		#Finished reading the file without connected or disconnected
		#Assuming BT is still connected
		return True

	def close(self):
		if DEBUG_PRINTING == True:  print("should close application")
		# whait 6 seconds to make sure that the last results have been captured.
		self.thread_stop_event.wait(6)
		self.thread_stop_event.clear()
		self.thread_stop_event.set()
        #causes logging threads to be closed and automatic close if relevent.
		self.emit(QtCore.SIGNAL('play-done'))

		# if self.auto_close:
		#  	QtCore.QCoreApplication.instance().quit()
		#  	sys.exit(0)

	def found_trigger_recognition_phrase(self):
		# print("entered wav_player-->found_trigger_recognition_phrase")
		self.next_trigger = True

	def found_asr_recognition_phrase(self):
		# print("entered wav_player-->found_asr_recognition_phrase")
		self.next_asr = True


class WavPlayerUiForm(Ui_RubiJukeBox):
	def __init__(self):

		global recognized_cur_wav
		self.header_dict = {}
		self.delay_between_wavs = 0

		self.chosen_wavs = []
		self.buttons = []
		recognized_cur_wav = False
		
		self.playing_thread = None
		self.thread_stop_event = threading.Event()
		self.noise_process = None
		self.temp_wav_file1 = get_temp_file_name()
		self.temp_wav_file2 = get_temp_file_name()

		self.PhoneloggerThread = MP_LoggerThread(None)

		#logging.basicConfig(filename=LOGGER_PATH, level=logging_level, format=LOGGER_FORMAT, datefmt=LOGGER_DATE_FORMAT)
	def _create_wave_files_list(self,wav_list):
		if DEBUG_PRINTING == True:  print("Creating list of wavs file")
		file_path = os.path.abspath(__file__)
		temp = file_path.replace('/','\\')
		split_path = temp.split("\\")
		self.path_to_list_of_wavs = '\\'.join(split_path[:(len(split_path)-2)])+ "\\lists\\JukeBox_List_of_wavs.txt"
		# print("path to list of wavs is: " + self.path_to_list_of_wavs)

		f = open(self.path_to_list_of_wavs, 'w')
		f.write("\n".join(wav_list))
		f.close()

		return self.path_to_list_of_wavs


	def _dump_param(self, param_name, value):
		if param_name == "wav_list":
			# print("Wav list being updated")
			param_name = param_name
		if not os.path.isfile(PARAMS_PATH):
			open(PARAMS_PATH, 'wb')
		try:
			params = pickle.loads(open(PARAMS_PATH, 'rb').read())
		except EOFError:
			params = {}
		params[param_name] = value
		# print(str(param_name))
		params_file = open(PARAMS_PATH, 'wb')
		# print(params)
		pickle.dump(params, params_file)
		params_file.close()

		
	def _get_param(self, param_name):
		if not os.path.isfile(PARAMS_PATH) or os.stat(PARAMS_PATH).st_size == 0:
			return None
		params = pickle.loads(open(PARAMS_PATH, 'rb').read())
		if not params.has_key(param_name):
			return None
		else:
			return params[param_name]
		
	def _get_params(self):
		if not os.path.isfile(PARAMS_PATH):
			return None
		params = pickle.loads(open(PARAMS_PATH, 'rb').read())
		return params
	
	def closeEvent(self, event):
		if self.noise_process:
			self.noise_process.kill()
		if os.path.exists(self.temp_wav_file1):
			os.unlink(self.temp_wav_file1)
		if os.path.exists(self.temp_wav_file2):
			os.unlink(self.temp_wav_file2)

	def _get_delay_mode(self):
		self.header_dict["delay_mode"] = str(self.Delay_Mode.currentText())
		return self.Delay_Mode.currentText()

	def _get_trig_delay(self):
		if not self.should_delay.checkState():
			trig_delay = 0
		else:
			trig_delay = self.spin_delay_time.value()
		self.header_dict["trig_delay"] = trig_delay
		return trig_delay

	def _get_asr_delay(self):
		if not self.should_delay_ASR.checkState():
			self.header_dict["asr_delay"] = 0
			return 0
		else:
			self.header_dict["asr_delay"] = self.spin_delay_time_ASR.value()
			return self.spin_delay_time_ASR.value()

	def _get_chosen_wavs(self):
		"""
		Iterate on the chosen folders, and get all the wavs that are in them.
		Returns a list of paths to wav files
		"""
		wav_list = []

		# Get the wav dirs from the list
		for index in xrange(self.lst_wavList.count()):
			wav_list.append(self.lst_wavList.item(index))
		wav_list = [str(i.text()) for i in wav_list]

		# self._dump_param("wav_list", wav_list)

		wav_dirs = [item for item in wav_list if os.path.isdir(item)]
		#wav_files = [item for item in wav_list if (os.path.isfile(item) or os.path.islink(item))]
		wav_files =[]
		for item in wav_list:
			filepath, filename = os.path.split(item)
			if filename != "":
				item.replace('\\',"//")
				wav_files.append(item)
		# Iterate on the dirs, walk through each one, and get all the wavs from it
		for wav_dir in wav_dirs:
			for root, dirs, files in os.walk(wav_dir):
				for fname in files:
					if os.path.splitext(fname)[1].lower() == '.wav':
						fpath = os.path.abspath(os.path.join(root, fname))
						wav_files.append(fpath)

		return wav_files
	
	def _refresh_num_of_wavs(self):
		self.chosen_wavs = self._get_chosen_wavs()
		self.lbl_numOfWavs.setText("Found %d wavs" % len(self.chosen_wavs))

	def current_played_wavs(self):
		self.chosen_wavs = self._get_chosen_wavs()
		self.lbl_numOfWavs.setText("Played %d/%d wavs" %  (self.playing_thread._played_wav+1, len(self.chosen_wavs)))
		self.lbl_numOfWavs_2.setText("Played %d/%d wavs" % (self.playing_thread._played_wav+1, len(self.chosen_wavs)))

	def browse_for_Log_path(self):
		file_path = browse_for_file(self.get_recent_path("add_file"))
		self.txtLogPath.setText(file_path)

	def handle_add_folder_button(self):
		"""
		When the "Add" button is clicked, display a "Choose Directory" dialog,
		and add the chosen one to the list
		"""
		wav_directory = QtGui.QFileDialog.getExistingDirectory(None, "Select Folder", self.get_recent_path("add_folder"))
		#wav_directory = QtGui.QFileDialog.getExistingDirectory()
		if wav_directory != "":
			item = QtGui.QListWidgetItem()
			item.setText(_translate("Form", wav_directory, None))
			wav_folders_and_files = fetchFiles(str(wav_directory), 'ENDS_WITH', '.wav')
			wav_files=[]
			for files in wav_folders_and_files[0]:
				wav_files.append(files)
			self.add_wavs_to_wav_list(wav_files)
			self._dump_param("wav_list", wav_files)
		self._refresh_num_of_wavs()

	def handle_add_list_button(self):
		# wav_list_path = QtGui.QFileDialog.getOpenFileNames(None, "Select txt File - with a list of wavs", self.get_recent_path())
		wav_list_path = browse_for_file(self.get_recent_path("add_file"))
		# print(wav_list_path)
		self.load_wavs_from_List(wav_list_path)

	def load_wavs_from_List(self,wav_list_path):
		try:
			str_wav_list_path = str(wav_list_path)
			if str_wav_list_path != '':
				f = open(str_wav_list_path, 'rb')
				wav_files = f.readlines()
				self.handle_clear_wav_list_button()
				self.add_wavs_to_wav_list(wav_files)
			else:
				print("empty file")
		except OSError:
			print("No File Found")
		self.header_dict["wav_list_path"] = wav_list_path

	def handle_add_file_button(self):
		wav_files_selected = QtGui.QFileDialog.getOpenFileNames(None, "Select File", self.get_recent_path("add_file"))
		self.add_wavs_to_wav_list(wav_files_selected)
		self._dump_param("wav_list", self.chosen_wavs)

	def add_wavs_to_wav_list(self, wav_files):
		# f = open(list_path, 'rb')
		# wav_files = f.readlines()
		for wav in wav_files:
			wav = wav.replace("\r\n","")
			item = QtGui.QListWidgetItem()
			item.setText(_translate("Form", wav.replace('/', '\\'), None))
			item.setText(_translate("Form", wav.replace('\r\n', ''), None))

			# self.lst_wavList.addItem(item)
			if os.path.exists(wav):
				item = QtGui.QListWidgetItem()
				item.setText(_translate("Form", wav.replace('/', '\\'), None))
				item.setText(_translate("Form", wav.replace('\r\n', ''), None))

				self.lst_wavList.addItem(item)
			elif wav.lstrip()[:1] =="#":
				# print("Skipping commented-out row")
				wav=wav
			elif wav =="":
				print("Skipping empty row in file list")
			else:
				print("File not found: " + wav)
		self._refresh_num_of_wavs()
		# self._dump_param("wav_list", self.chosen_wavs) #Moved to functions that call this to optimize perfromance

	def handle_remove_selected_wavs_button(self):
		"""
		When the "Remove" button is clicked, get the currently chosen entry in the wav dir list,
		and remove it from the list
		"""
		if not self.lst_wavList.selectedItems():
			return
		for selected_item in self.lst_wavList.selectedItems():
			selected_item_index = self.lst_wavList.row(selected_item)
			self.lst_wavList.takeItem(selected_item_index)
		self._dump_param("wav_list", self._get_chosen_wavs())
		self._refresh_num_of_wavs()
		
	def _set_buttons_before_playing(self):
		for button in self.buttons:
			button.setEnabled(button.is_enabled_during_play)
			
	def _set_buttons_after_playing(self):
		for button in self.buttons:
			button.setEnabled(button.is_enabled_during_play == False)

	def handle_start_logging_button(self, auto_close = False):
		self.auto_close = auto_close
		self.start_logging()

	def handle_stop_logging_button(self):
		self.stop_logging()

	def handle_pause_button(self):
		global PAUSE
		PAUSE = True
		self.btn_play.setVisible(False)
		self.btn_Resume.setEnabled(True)
		self.btn_puase.setEnabled(False)

	def handle_resume_button(self):
		global PAUSE
		PAUSE = False
		self.btn_play.setVisible(True)
		self.btn_Resume.setEnabled(False)
		self.btn_puase.setEnabled(True)

	def handle_Bttn_multiply_list_rows(self):
		multiply_lines(self.txtCounter0Name_2.text(),int(self.spin_multiply_lines.text()))

	def handle_play_button(self, auto_close = False):
		self.start_logging()
		self.auto_close = auto_close
		"""
		When the "Play" button is clicked, iterate on the wav dirs, get all the wavs,
		and paly them one by one
		"""
		# Only play if there is not another thread already playing
		if not self.playing_thread or not self.playing_thread.isRunning():
			self._set_buttons_before_playing()
			wav_files = self.chosen_wavs
			#self.playing_thread = WavPlayer(wav_files, self.header_dict, self.ChkBx_play_in_loop.checkState(), self.temp_wav_file2,auto_close)
			path_towave_files_list = self._create_wave_files_list(wav_files)
			self.playing_thread = WavPlayer(len(wav_files), path_towave_files_list, self.header_dict, self.ChkBx_play_in_loop.checkState(),
											self.temp_wav_file2, auto_close)
			self.widget.connect( self.playing_thread, QtCore.SIGNAL("log-info"), logging.info )
			self.widget.connect( self.playing_thread, QtCore.SIGNAL("log-debug"), logging.debug )
			self.widget.connect( self.playing_thread, QtCore.SIGNAL("log-error"), logging.error )
			self.widget.connect( self.playing_thread, QtCore.SIGNAL("Played_Wavs"), self.current_played_wavs)
			self.widget.connect( self.playing_thread, QtCore.SIGNAL("play-done"), lambda: self._set_buttons_after_playing())
			self.widget.connect( self.playing_thread, QtCore.SIGNAL("play-done"),
								lambda: self.stop_logging())
			self.widget.connect(self.playing_thread, QtCore.SIGNAL("play-done"),
								lambda: self.shut_down_automaticaly())

			self.playing_thread.start()
			self.Tabs.setCurrentIndex(1)

	def shut_down_automaticaly(self):
		if self.auto_close:
			print("Shutting down automatically")
			#Stop playing noise and kill thread
			self.handle_stop_noise_button()
			# kill playing signal thread
			if self.playing_thread.isRunning:
			 	self.playing_thread.thread_stop_event.set
			self.stop_logging()
			QtCore.QCoreApplication.instance().quit()

	def shut_down_Listener_automaticaly(self):
		if self.auto_close:
			print("Shutting down listeners automatically")
			#Stop playing noise and kill thread
			self.handle_stop_noise_button()
			if self.chkBx_Log_MP.isChecked():
				phone = phoneConnectionManager()
				adb = phone._get_adb_path()
				self.PhoneloggerThread.stop(adb)
			QtCore.QCoreApplication.instance().quit()

	def handle_play_noise_button(self):
		# Only play if there is not another thread already playing
		if not self.noise_process or (self.noise_process.poll() != None):
			noise_wav = str(self.lst_noiseList.item(0).text())
			if noise_wav != 'None':
				change_wav_volume(noise_wav, self.temp_wav_file1, self.noiseVolSpinBox.value())
				self.btn_play_noise.setEnabled(False)
				self.btn_choose_noise.setEnabled(False)
				self.btn_stop_noise.setEnabled(True)
				self.noiseVolSlider.setEnabled(False)
				self.noiseVolSpinBox.setEnabled(False)

				noise_script_path = os.path.join(os.path.dirname(__file__), "Utils\play_wav_in_loop.py")

				self.noise_process = sp.Popen(["python", noise_script_path, self.temp_wav_file1])
			
	def handle_stop_noise_button(self):
		if self.noise_process:
			self.noise_process.kill()
			self.btn_play_noise.setEnabled(True)
			self.btn_stop_noise.setEnabled(False)
			self.btn_choose_noise.setEnabled(True)
			self.noiseVolSlider.setEnabled(True)
			self.noiseVolSpinBox.setEnabled(True)
			self.noise_process = None
			
	def handle_stop_button(self):
		self.playing_thread.thread_stop_event.set()
		self._set_buttons_after_playing()

	def handle_enable_delay(self, state):
		"""
		When the "enable delay" checkbox's state is changed, enable/disable the delay time spin dialog
		"""
		if state == QtCore.Qt.Checked:
			self.spin_delay_time.setEnabled(True)
		else:
			self.spin_delay_time.setEnabled(False)
		self._dump_param("enable_delay", state == QtCore.Qt.Checked)

	def handle_enable_asr_delay(self, state):
		"""
		When the "enable delay" checkbox's state is changed, enable/disable the delay time spin dialog
		"""
		if state == QtCore.Qt.Checked:
			self.spin_delay_time_ASR.setEnabled(True)
		else:
			self.spin_delay_time_ASR.setEnabled(False)
		self._dump_param("enable_delay_asr", state == QtCore.Qt.Checked)

	def handle_spin_delay_time_changed(self):
		self._dump_param("delay_time", self.spin_delay_time.value())
		self.header_dict["trig_delay"] = self.spin_delay_time.value()

	def handle_spin_delay_time_asr_changed(self):
		self._dump_param("delay_time_asr", self.spin_delay_time_ASR.value())
		self.header_dict["asr_delay"] = self.spin_delay_time_ASR.value()

	def handle_choose_noise(self):
		noise_wav = str(QtGui.QFileDialog.getOpenFileName()).replace('/', '\\')
		if noise_wav == '':
			return
		self.set_noise_wav(noise_wav)

	def set_noise_wav(self,noise_wav):
		self.lst_noiseList.takeItem(0)

		item = QtGui.QListWidgetItem()
		item.setText(_translate("Form", noise_wav, None))
		self.lst_noiseList.addItem(item)

		self.btn_play_noise.setEnabled(True)

		self._dump_param("noise_file", noise_wav)
		
	def handle_wav_volume_changed(self):
		self.wavsVolSlider.setSliderPosition(self.wavsVolSpinBox.value())
		self._dump_param("wavs_volume", self.wavsVolSpinBox.value())
		self.header_dict["Signal_volume"]= self.wavsVolSpinBox.value()

	def handle_noise_volume_changed(self):
		self.noiseVolSlider.setSliderPosition(self.noiseVolSpinBox.value())
		self._dump_param("noise_volume", self.noiseVolSpinBox.value())
		self.header_dict["noise_volume"] = self.noiseVolSpinBox.value()

	def handle_open_log_file_in_notepad(self):
		log_path = str(self.txtLogPath.text())
		if os.path.isfile(log_path):
			programName = "C:\\Program Files (x86)\\Notepad++\\notepad++.exe"
			sp.Popen([programName, log_path])
		else:
			print("Log_file doesn't exist")


	def load_params_from_file(self):
		if DEBUG_PRINTING == True: print("Entered Load params from file")
		params = self._get_params()
		if params == None:
			return
		if params.has_key("DelayMode"):
			delay_mode_index = params["DelayMode"]
			if delay_mode_index == None:
				delay_mode_index = 0
			self.Delay_Mode.setCurrentIndex(delay_mode_index)
			self.header_dict["delay_mode"]=str(self.Delay_Mode.currentText())
		if params.has_key("DictionaryIndex"):
			dictionary_index = params["DictionaryIndex"]
			if dictionary_index == None:
				dictionary_index = 0
			self.Dictionary_List.setCurrentIndex(dictionary_index)
		if params.has_key("Counter0Name"):
			self.txtCounter0Name.setText(params["Counter0Name"])
		if params.has_key("Counter1Name"):
			self.txtCounter1Name.setText(params["Counter1Name"])
		# if params.has_key("TriggerPhrase"):
		# 	self.txtTriggerPhrase.setText(params["TriggerPhrase"])
		# else:
		# 	self.txtTriggerPhrase.setText("")
		if params.has_key("TriggerRecognitionPhrases"):
			self.txtTriggerRecognitionrPhrases.setText(params["TriggerRecognitionPhrases"])
		else:
			self.txtTriggerRecognitionrPhrases.setText("")
		if params.has_key("AsrRecognitionPhrases"):
			self.txtAsrRecognitionrPhrases.setText(params["AsrRecognitionPhrases"])
		else:
			self.txtAsrRecognitionrPhrases.setText("")
		if params.has_key("UART_Logging"):
			self.chkBx_Log_UART.setChecked(params["UART_Logging"])
		if params.has_key("SERIAL_Logging"):
			self.chkBx_Log_SERIAL.setChecked(params["SERIAL_Logging"])
		if params.has_key("MP_Logging"):
			self.chkBx_Log_MP.setChecked(params["MP_Logging"])
		if params.has_key("QCC_Logging"):
			self.chkBx_Log_QCCUSB.setChecked(params["QCC_Logging"])
		if params.has_key("LabJack_Logging"):
			self.chkBx_Log_LabJack.setChecked(params["LabJack_Logging"])
		if params.has_key("delay_time"):
			self.spin_delay_time.setValue(params["delay_time"])
			self.header_dict["trig_delay"] = params["delay_time"]
		if params.has_key("delay_time_asr"):
			self.spin_delay_time_ASR.setValue(params["delay_time_asr"])
		if params.has_key("enable_delay"):
			self.should_delay.setChecked(params["enable_delay"])
		if params.has_key("wavs_volume"):
			self.wavsVolSpinBox.setValue(params["wavs_volume"])
		if params.has_key("noise_volume"):
			self.noiseVolSpinBox.setValue(params["noise_volume"])
		if params.has_key("noise_file") and os.path.isfile(params["noise_file"]):
			item = QtGui.QListWidgetItem()
			item.setText(_translate("Form", params["noise_file"], None))
			self.header_dict["Noise_file_path"] = params["noise_file"]
			self.lst_noiseList.addItem(item)
			self.btn_play_noise.setEnabled(True)
		if params.has_key("wav_list"):
			for wav_path in params["wav_list"]:
				wav_path = wav_path.replace("\r\n","")
				if os.path.exists(wav_path):
					item = QtGui.QListWidgetItem()
					item.setText(_translate("Form", wav_path, None))
					self.lst_wavList.addItem(item)
				else:
					print("File not found: " + wav_path)
			self._refresh_num_of_wavs()

			if DEBUG_PRINTING == True: print("Entered Load params from file")

	def run_automatically_with_cmd_arguments(self,Args):
		if DEBUG_PRINTING == True: print("Entered run_automatically_with_cmd_arguments")
		global LOGGER_PATH

		if Args[1].lower() == "python":
			Args = Args[2:]
		num_args = len(Args)
		if num_args < 10:
			print("Missing Rrequired Arguments")
			return
		# print(Args)
		self.header_dict["log_path"]= Args[1]
		self.header_dict["wav_list_path"] = Args[2]
		self.header_dict["Noise_file_path"] = Args[3]
		self.header_dict["Signal_volume"] = Args[4]
		self.header_dict["noise_volume"] = Args[5]
		self.header_dict["trig_delay"] = Args[6]
		self.header_dict["asr_delay"] = Args[7]
		self.header_dict["logging_device"] = Args[8]
		self.header_dict["delay_mode"] = Args[9]
		if num_args >= 11:
			if Args[10] != "":
				self.header_dict["dictionary_name"] = Args[10]
			else:
				self.header_dict["dictionary_name"] = "Google"
		else:
			self.header_dict["dictionary_name"] = "Google"
		if num_args>= 12:
			self.header_dict["test_type"] = Args[11]
		else:
			self.header_dict["test_type"] = "SNR"
		if num_args >= 13:
			if self.header_dict["logging_device"].lower().find("uart")!=-1 or self.header_dict["logging_device"].lower().find("serial")!=-1:
				self.header_dict["com_port"] = Args[12]
				self.header_dict["counter0_name"] = Args[12]
			else:
				self.header_dict["counter0_name"] = Args[12]
		else:
			self.header_dict["counter0_name"] = "Rubidium"
		if num_args >= 14:
			self.header_dict["counter1_name"] = Args[13]
		else:
			self.header_dict["counter1_name"] = "Rubidium"
		if num_args >= 15:
			if Args[14] != "":
				self.header_dict["trigger_recognition_phrases"] = Args[14]
			else:
				self.header_dict["trigger_recognition_phrases"] = ""
		else:
			self.header_dict["trigger_recognition_phrases"] = ""
		if num_args >= 16:
			if Args[15] != "":
				self.header_dict["asr_recognition_phrases"] = Args[15]
			else:
				self.header_dict["asr_recognition_phrases"] = ""
		else:
			self.header_dict["asr_recognition_phrases"] = ""
		if num_args >= 18:
			if Args[17] != "":
				self.header_dict["Mode"] = Args[17]
			else:
				self.header_dict["Mode"] = "Play"
		else:
			self.header_dict["Mode"] = "Play"
		if num_args >= 19:
			if Args[18] != "": # and self.header_dict["Mode"].lower() != "play":
				self.header_dict["Listening_time"] = Args[18]
			else:
				self.header_dict["Listening_time"] = 0
		else:
			self.header_dict["Listening_time"] = 0
		LOGGER_PATH =self.header_dict["log_path"]
		self.txtLogPath.setText(LOGGER_PATH)
		self.load_wavs_from_List(self.header_dict["wav_list_path"])
		self.set_noise_wav(self.header_dict["Noise_file_path"])
		if self.header_dict["Signal_volume"] != "":
			self.wavsVolSpinBox.setValue(int(self.header_dict["Signal_volume"]))
		else:
			self.wavsVolSpinBox.setValue(0)
		if self.header_dict["noise_volume"] != "":
			self.noiseVolSpinBox.setValue(int(self.header_dict["noise_volume"]))
		else:
			self.noiseVolSpinBox.setValue(0)
		if self.header_dict["delay_mode"].lower() == "trigger_only" or  self.header_dict["delay_mode"].lower() == "trig":
			self.Delay_Mode.setCurrentIndex(0)
			self.should_delay_ASR.setEnabled(False)
		elif self.header_dict["delay_mode"].lower() == "trig/asr-trig_only":
			self.Delay_Mode.setCurrentIndex(2)
			self.should_delay_ASR.setEnabled(False)
		elif self.header_dict["delay_mode"].lower() == "m-trig":
			self.Delay_Mode.setCurrentIndex(3)
			self.should_delay_ASR.setEnabled(False)
		else:
			self.Delay_Mode.setCurrentIndex(1)
			self.should_delay_ASR.setEnabled(True)
			self.spin_delay_time_ASR.setValue(int(self.header_dict["asr_delay"]))
		self.should_delay.setEnabled(True)
		if self.header_dict["trig_delay"] != "":
			self.spin_delay_time.setValue(int(self.header_dict["trig_delay"]))
		else:
			self.spin_delay_time.setValue(0)
		logging_device = self.header_dict["logging_device"].lower()
		if logging_device.find("uart")!=-1:
			self.chkBx_Log_UART.setChecked(True)
		else:
			self.chkBx_Log_UART.setChecked(False)
		if logging_device.find("qcc") != -1:
			self.chkBx_Log_QCCUSB.setChecked(True)

		else:
			self.chkBx_Log_QCCUSB.setChecked(False)
		if logging_device.find("serial")!=-1:
			self.chkBx_Log_SERIAL.setChecked(True)
		else:
			self.chkBx_Log_SERIAL.setChecked(False)
		if logging_device.find("lj")!=-1 or logging_device.find("eb")!=-1 or logging_device.find("listener")!=-1:
			self.chkBx_Log_LabJack.setChecked(True)
		else:
			self.chkBx_Log_LabJack.setChecked(False)
		if logging_device.find("mp")!=-1:
			self.chkBx_Log_MP.setChecked(True)
		else:
			self.chkBx_Log_MP.setChecked(False)

		# "OK_Google",  "Alexa", "Hey_Jabra", "MyMano","Ringing", "MusicASR","StandbyASR","FitnessASR","Ambarella","FitBit", "Jabra_old2", "Google_old","Hello_Rubidium", "Generic"
		print("Dictionary name is: " + self.header_dict["dictionary_name"])
		if self.header_dict["dictionary_name"].lower() == "jabra" or self.header_dict["dictionary_name"].lower() == "hey_jabra":
			self.Dictionary_List.setCurrentIndex(2)
		elif self.header_dict["dictionary_name"].lower() == "ringing":
			self.Dictionary_List.setCurrentIndex(4)
		elif self.header_dict["dictionary_name"].lower() == "musicasr":
			self.Dictionary_List.setCurrentIndex(5)
		elif self.header_dict["dictionary_name"].lower() == "standbyasr":
			self.Dictionary_List.setCurrentIndex(6)
		elif self.header_dict["dictionary_name"].lower() == "fitnessasr":
			self.Dictionary_List.setCurrentIndex(7)
		elif self.header_dict["dictionary_name"].lower() == "hello_rubidium" or self.header_dict["dictionary_name"].lower() == "rubidium":
			self.Dictionary_List.setCurrentIndex(12)
		elif self.header_dict["dictionary_name"].lower() == "ambarella":
			self.Dictionary_List.setCurrentIndex(8)
		elif self.header_dict["dictionary_name"].lower() == "fitbit":
			self.Dictionary_List.setCurrentIndex(9)
		elif self.header_dict["dictionary_name"].lower() == "jabra_old2" or self.header_dict["dictionary_name"].lower() == "jabra_old":
			self.Dictionary_List.setCurrentIndex(10)
		elif self.header_dict["dictionary_name"].lower() == "google_old":
			self.Dictionary_List.setCurrentIndex(11)
		elif self.header_dict["dictionary_name"].lower() == "alexa":
			self.Dictionary_List.setCurrentIndex(1)
		elif self.header_dict["dictionary_name"].lower() == "ok_google":
			self.Dictionary_List.setCurrentIndex(0)
		elif self.header_dict["dictionary_name"].lower() == "mymano" or self.header_dict["dictionary_name"].lower() == "gabbie":
			self.Dictionary_List.setCurrentIndex(3)
		elif self.header_dict["dictionary_name"].lower() == "musicmtrig":
			self.Dictionary_List.setCurrentIndex(13)
		else:
			self.Dictionary_List.setCurrentIndex(14)
		if DEBUG_PRINTING == True: print("test type is: " + self.header_dict["test_type"])
		#"SNR","Long Talks","2 Words", "Dynamic Range", "VAD"
		if self.header_dict["test_type"].lower() == "long_talks":
			self.TestType_List.setCurrentIndex(1)
		elif self.header_dict["test_type"].lower() == "2_words":
			self.TestType_List.setCurrentIndex(2)
		elif self.header_dict["test_type"].lower() == "dynamic_range" or self.header_dict["test_type"].lower() == "dr":
			self.TestType_List.setCurrentIndex(3)
		elif self.header_dict["test_type"].lower() == "multi_trigger" or self.header_dict["test_type"].lower() == "m-trig":
			self.TestType_List.setCurrentIndex(4)
		elif self.header_dict["test_type"].lower() == "vad":
			self.TestType_List.setCurrentIndex(5)
		else:
			self.TestType_List.setCurrentIndex(0)
		self.txtCounter0Name.setText(self.header_dict["counter0_name"])
		self.txtCounter1Name.setText(self.header_dict["counter1_name"])
		# self.txtTriggerPhrase.setText(self.header_dict["trigger_phrase"])
		self.txtAsrRecognitionrPhrases.setText(self.header_dict["asr_recognition_phrases"])
		self.txtTriggerRecognitionrPhrases.setText(self.header_dict["trigger_recognition_phrases"])
		if self.lst_noiseList.count() > 0:
			self.handle_play_noise_button()

		if self.header_dict["Mode"].lower() == "play":
			self.handle_play_button(True)
		else:
			self.handle_start_logging_button(True)
			self.Tabs.setCurrentIndex(1)
		if DEBUG_PRINTING == True: print("Exited run_automatically_with_cmd_arguments")

	def handle_make_wav(self):
		# wav_files = self.chosen_wavs
		# delay = self.delay_between_wavs
		temp_file = str(QtGui.QFileDialog.getSaveFileNameAndFilter(filter="*.wav")[0]).replace('/', '\\')
		wav = create_empty_wave(temp_file, self.chosen_wavs[0])

		counter = 0
		for wav_file in self.chosen_wavs:
			counter += 1
			change_wav_volume(wav_file, self.temp_wav_file2, self.wavsVolSpinBox.value())
			wav_to_wav(self.temp_wav_file2, wav)
			add_quiet_to_wav(wav, self._get_trig_delay())
		wav.close()

	def start_new_log(self):
		LOGGER_PATH = os.path.join(os.path.dirname(__file__),
								   "logs\jukebox_log_%s.txt" % time.strftime("%y-%m-%d_%H-%M-%S"))
		self.txtLogPath.setText(LOGGER_PATH)
		self.textBrowser.clear()

	def retranslateUi(self, Form):
		if DEBUG_PRINTING == True: print("Entered WavPlayerUiForm-->retranslateUi")
		Ui_RubiJukeBox.retranslateUi(self, Form)

		Form.closeEvent = self.closeEvent

		self.buttons = []

		self.btn_addWavDir.clicked.connect(self.handle_add_folder_button)
		self.btn_addWavDir.is_enabled_during_play = False
		self.buttons.append(self.btn_addWavDir)

		self.btn_addWavFile.clicked.connect(self.handle_add_file_button)
		self.btn_addWavFile.is_enabled_during_play = False
		self.buttons.append(self.btn_addWavFile)

		self.bttn_addWavList.clicked.connect(self.handle_add_list_button)
		self.bttn_addWavList.is_enabled_during_play = False
		self.buttons.append(self.bttn_addWavList)

		self.bttn_Browse_LogPath.clicked.connect(self.browse_for_Log_path)
		self.bttn_Browse_LogPath.is_enabled_during_play = False
		self.buttons.append(self.bttn_Browse_LogPath)

		self.Bttn_open_log.clicked.connect(self.handle_open_log_file_in_notepad)

		self.btn_clear_log.clicked.connect(self.start_new_log)
		self.btn_clear_log.is_enabled_during_play = False
		self.buttons.append(self.btn_clear_log)

		self.should_delay.stateChanged.connect(self.handle_enable_delay)
		self.should_delay.is_enabled_during_play = False
		self.buttons.append(self.should_delay)

		self.should_delay_ASR.stateChanged.connect(self.handle_enable_asr_delay)
		self.should_delay_ASR.is_enabled_during_play = False
		self.buttons.append(self.should_delay_ASR)

		self.Delay_Mode.currentIndexChanged.connect(self.handle_delay_mode_changed)
		self.Delay_Mode.is_enabled_during_play = False
		self.buttons.append(self.Delay_Mode)

		self.Dictionary_List.currentIndexChanged.connect(self.handle_dictionary_changed)
		self.Dictionary_List.is_enabled_during_play = False
		self.buttons.append(self.Dictionary_List)

		self.chkBx_Log_LabJack.stateChanged.connect(self.handle_logging_device_change)
		self.chkBx_Log_LabJack.is_enabled_during_play = False
		self.buttons.append(self.chkBx_Log_LabJack)

		self.chkBx_Log_MP.stateChanged.connect(self.handle_logging_device_change)
		self.chkBx_Log_MP.is_enabled_during_play = False
		self.buttons.append(self.chkBx_Log_MP)

		self.chkBx_Log_UART.stateChanged.connect(self.handle_logging_device_change)
		self.chkBx_Log_UART.is_enabled_during_play = False
		self.buttons.append(self.chkBx_Log_UART)

		self.chkBx_Log_QCCUSB.stateChanged.connect(self.handle_logging_device_change)
		# self.chkBx_Log_QCCUSB.stateChanged.connect(self.handle_QCC_Logging_changed())
		self.chkBx_Log_QCCUSB.is_enabled_during_play = False
		self.buttons.append(self.chkBx_Log_QCCUSB)

		self.chkBx_Log_SERIAL.stateChanged.connect(self.handle_logging_device_change)
		# self.chkBx_Log_SERIAL.stateChanged.connect(self.handle_SERIAL_Logging_changed(self.chkBx_Log_SERIAL.isChecked()))
		self.chkBx_Log_SERIAL.is_enabled_during_play = False
		self.buttons.append(self.chkBx_Log_SERIAL)

		self.btn_removeAll.clicked.connect(self.handle_clear_wav_list_button)
		self.btn_removeAll.is_enabled_during_play = False
		self.buttons.append(self.btn_removeAll)

		self.btn_removeWavDir.clicked.connect(self.handle_remove_selected_wavs_button)
		self.btn_removeWavDir.is_enabled_during_play = False
		self.buttons.append(self.btn_removeWavDir)

		# self.btn_Resume.clicked.connect(self.handle_resume_button)
		# self.btn_Resume.is_enabled_during_play = False
		# self.buttons.append(self.btn_Resume)

		self.btn_start_log.clicked.connect(self.handle_start_logging_button)
		self.btn_start_log.is_enabled_during_play = False
		self.buttons.append(self.btn_start_log)

		self.btn_stop_log.clicked.connect(self.handle_stop_logging_button)
		self.btn_stop_log.is_enabled_during_play = False
		self.buttons.append(self.btn_stop_log)

		self.btn_stop.clicked.connect(self.handle_stop_button)
		self.btn_stop.is_enabled_during_play = True
		self.buttons.append(self.btn_stop)

		self.btn_stop_noise.clicked.connect(self.handle_stop_noise_button)
		self.btn_play_noise.clicked.connect(self.handle_play_noise_button)
		self.btn_choose_noise.clicked.connect(self.handle_choose_noise)

		self.TestType_List.currentIndexChanged.connect(self.handle_dictionary_changed)
		self.TestType_List.is_enabled_during_play = False
		self.buttons.append(self.TestType_List)

		self.Bttn_multiply_list_rows.clicked.connect(self.handle_Bttn_multiply_list_rows)
		self.Bttn_multiply_list_rows.is_enabled_during_play = False
		self.buttons.append(self.Bttn_multiply_list_rows)

		self.btn_play.clicked.connect(self.handle_play_button)
		self.btn_play.is_enabled_during_play = False
		self.buttons.append(self.btn_play)

		self.ChkBx_play_in_loop.is_enabled_during_play = False
		self.buttons.append(self.ChkBx_play_in_loop)

		self.btn_puase.clicked.connect(self.handle_pause_button)
		self.btn_puase.is_enabled_during_play = True
		self.buttons.append(self.btn_puase)

		self.wavsVolSlider.setSliderPosition(0)
		self.wavsVolSlider.valueChanged.connect(lambda: self.wavsVolSpinBox.setValue(self.wavsVolSlider.value()))
		self.wavsVolSlider.is_enabled_during_play = False
		self.buttons.append(self.wavsVolSlider)

		self.noiseVolSlider.setSliderPosition(0)
		self.noiseVolSlider.valueChanged.connect(lambda: self.noiseVolSpinBox.setValue(self.noiseVolSlider.value()))

		self.noiseVolSpinBox.valueChanged.connect(self.handle_noise_volume_changed)
		
		self.wavsVolSpinBox.valueChanged.connect(self.handle_wav_volume_changed)
		self.wavsVolSpinBox.is_enabled_during_play = False
		self.buttons.append(self.wavsVolSpinBox)

		self.btn_make_wav.clicked.connect(self.handle_make_wav)
		self.btn_make_wav.is_enabled_during_play = False
		self.buttons.append(self.btn_make_wav)

		self.spin_delay_time.valueChanged.connect(self.handle_spin_delay_time_changed)
		self.spin_delay_time.is_enabled_during_play = False
		self.buttons.append(self.spin_delay_time)

		self.spin_delay_time_ASR.valueChanged.connect(self.handle_spin_delay_time_asr_changed)
		self.spin_delay_time_ASR.is_enabled_during_play = False
		self.buttons.append(self.spin_delay_time_ASR)

		self.txtCounter0Name.editingFinished.connect(self.handle_counter0_name_change)

		self.txtCounter1Name.editingFinished.connect(self.handle_counter1_name_change)

		self.txtLogPath.editingFinished.connect(self.handle_change_log_path)

		# self.txtTriggerPhrase.editingFinished.connect(self.handle_Trigger_Phrase_Changed)

		self.txtTriggerRecognitionrPhrases.editingFinished.connect(self.handle_Trigger_Recognitionr_Phrases_Changed)

		self.txtAsrRecognitionrPhrases.editingFinished.connect(self.handle_Asr_Recognitionr_Phrases_Changed)
		if DEBUG_PRINTING == True: print("Exited WavPlayerUiForm-->retranslateUi")

	def start_clicked(self):
		if self.PhoneloggerThread.isRunning():
			self.PhoneloggerThread.terminate()
			logging.info("Pause pressed. Stopped logging events.")
		else:
			self.start()

	def setupUi(self, widget, Args):
		if DEBUG_PRINTING == True: print("Entered WavPlayerUiForm-->setupUi")
		Ui_RubiJukeBox.setupUi(self, widget)
		self.widget = widget

		dictionary_index = self._get_param("DictionaryIndex")
		self.Dictionary_List.addItems(["OK_Google",  "Alexa", "Hey_Jabra", "MyMano","Ringing", "MusicASR","StandbyASR","FitnessASR","Ambarella","FitBit", "Jabra_old2",
									   "Google_old","Hello_Rubidium", "MusicMtrig","Generic"])
		self._dump_param("DictionaryIndex", dictionary_index)
		self.TestType_List.addItems(["SNR","Long_Talks","2_Words", "Dynamic_Range","VAD"])

		delay_mode_index = self._get_param("DelayMode")
		self.Delay_Mode.addItems(["Trigger_Only", "Trig/ASR", "Trig/ASR-Trig_only", "M-Trig"])
		self._dump_param("DelayMode", delay_mode_index)

		self.txtLogPath.setText(LOGGER_PATH)
		self.btn_puase.setEnabled(False)
		# self.txt_LabJack_Check_Interval.setText("200")
		# self.Log_text_to_GUI()
		self.Tabs.setCurrentIndex(0)

		self.header_dict["JukeBox_path"] = Args[0]
		if len(Args) < 2:
			self.load_params_from_file()
			self.header_dict["wav_list_path"] = ""
			self.header_dict["Noise_file_path"] = ""
			self.header_dict["Listening_time"] = 0
		else:
			self.run_automatically_with_cmd_arguments(Args)

		self.header_dict["log_path"] = LOGGER_PATH
		self.header_dict["delay_mode"] = str(self.Delay_Mode.currentText())
		self.header_dict["dictionary_name"] = str(self.Dictionary_List.currentText())
		self.header_dict["test_type"] = str(self.TestType_List.currentText())
		self.header_dict["asr_delay"] = self.spin_delay_time_ASR.value()
		self.header_dict["trig_delay"] = self.spin_delay_time.value()
		self.header_dict["noise_volume"] = self.noiseVolSpinBox.value()
		self.header_dict["Signal_volume"] = self.wavsVolSpinBox.value()
		self.header_dict["counter0_name"] = self.txtCounter0Name.text()
		self.header_dict["counter1_name"] = self.txtCounter1Name.text()
		# self.header_dict["trigger_phrase"] = self.txtTriggerPhrase.text()
		self.header_dict["trigger_recognition_phrases"] = self.txtTriggerRecognitionrPhrases.text()
		self.header_dict["asr_recognition_phrases"] = self.txtAsrRecognitionrPhrases.text()
		if DEBUG_PRINTING == True: print("Exited WavPlayerUiForm-->setupUi")

	def handle_logging_device_change(self):
		if DEBUG_PRINTING == True: print("Entered handle logging devide change")

		lj = self.chkBx_Log_LabJack.isChecked()
		mp = self.chkBx_Log_MP.isChecked()
		uart = self.chkBx_Log_UART.isChecked()
		QCC = self.chkBx_Log_QCCUSB.isChecked()
		serial = self.chkBx_Log_SERIAL.isChecked()
		delay_mode = ""
		if lj:
			delay_mode = "lj"
			self._dump_param("LabJack_Logging", QtCore.Qt.Checked)
		else:
			self._dump_param("LabJack_Logging", QtCore.Qt.Unchecked)

		if QCC:
			if delay_mode == "":
				delay_mode = "qcc"
			else:
				delay_mode = delay_mode + "-qcc"
			self._dump_param("QCC_Logging", QtCore.Qt.Checked)
		else:
			self._dump_param("QCC_Logging", QtCore.Qt.Unchecked)
		if uart:
			if delay_mode == "":
				delay_mode = "uart"
			else:
				delay_mode = delay_mode + "-uart"
			self._dump_param("UART_Logging", QtCore.Qt.Checked)
		else:
			self._dump_param("UART_Logging", QtCore.Qt.Unchecked)
		if serial:
			if delay_mode == '':
				delay_mode = "serial"
			else:
				delay_mode = delay_mode + "-serial"
			self._dump_param("SERIAL_Logging", QtCore.Qt.Checked)
		else:
			self._dump_param("SERIAL_Logging", QtCore.Qt.Unchecked)
		if mp:
			if delay_mode == '':
				delay_mode = "mp"
			else:
				delay_mode = delay_mode + "-mp"
			self._dump_param("MP_Logging", QtCore.Qt.Checked)
		else:
			self._dump_param("MP_Logging", QtCore.Qt.Unchecked)
		if delay_mode == '':
			delay_mode = "None"
		self.header_dict["logging_device"] = delay_mode
		if DEBUG_PRINTING == True: print("Exit handle logging devide change")

	def handle_counter0_name_change(self):
		self._dump_param("Counter0Name", self.txtCounter0Name.text())
		self.header_dict["counter0_name"] = self.txtCounter0Name.text()

	def handle_counter1_name_change(self):
		self._dump_param("Counter1Name", self.txtCounter1Name.text())
		self.header_dict["counter1_name"] = self.txtCounter1Name.text()

	def handle_Trigger_Phrase_Changed(self):
		self._dump_param("TriggerPhrase", self.txtTriggerPhrase.text())
		self.header_dict["trigger_phrase"] = self.txtTriggerPhrase.text()

	def handle_Trigger_Recognitionr_Phrases_Changed(self):
		self._dump_param("trigger_recognition_phrases", self.txtTriggerRecognitionrPhrases.text())
		self.header_dict["trigger_recognition_phrases"] = self.txtTriggerRecognitionrPhrases.text()

	def handle_Asr_Recognitionr_Phrases_Changed(self):
		self._dump_param("AsrRecognitionPhrases", self.txtAsrRecognitionrPhrases.text())
		self.header_dict["asr_recognition_phrases"] = self.txtAsrRecognitionrPhrases.text()

	def handle_delay_mode_changed(self):
		if DEBUG_PRINTING == True: print("Delay Mode has been changed to:  " + self.Delay_Mode.currentText())
		self._dump_param("DelayMode", self.Delay_Mode.currentIndex())
		self.header_dict["delay_mode"]=str(self.Delay_Mode.currentText())
		if self.Delay_Mode.currentIndex() == 0:
			self.should_delay.setEnabled(True)
			self.should_delay.setChecked(True)
			self.should_delay_ASR.setEnabled(False)
			self.should_delay_ASR.setChecked(False)
		else:
			self.should_delay.setEnabled(True)
			self.should_delay.setChecked(True)
			self.should_delay_ASR.setEnabled(True)
			self.should_delay_ASR.setChecked(True)

	def handle_dictionary_changed(self):
		if DEBUG_PRINTING == True: print("Dictionary has been changed to: " + self.Dictionary_List.currentText())
		self._dump_param("DictionaryIndex", self.Dictionary_List.currentIndex())

	def handle_TestType_changed(self):
		if DEBUG_PRINTING == True:  print("Dictionary has been changed to: " + self.TestType_List.currentText())
		self._dump_param("TestTypeIndex", self.TestType_List.currentIndex())

	def handle_change_log_path(self):
		global LOGGER_PATH
		LOGGER_PATH = self.txtLogPath.text()
		print(LOGGER_PATH)

	def handle_clear_wav_list_button(self):
		if DEBUG_PRINTING == True:  print("Entered WavPlayerUiForm-->handle_clear_wav_list_button")
		self.lst_wavList.clear()
		self._dump_param("wav_list", "")
		self._refresh_num_of_wavs()
		print("Exited WavPlayerUiForm-->handle_clear_wav_list_button")

	def get_recent_path(self, type=None):
		if DEBUG_PRINTING == True: print("Entered WavPlayerUiForm-->get_recent_path")
		params = self._get_params()
		if not params:
			return ""
		recent_path = ""
		if params.has_key("wav_list") and len(params["wav_list"]) > 0:
			p = params["wav_list"][len(params["wav_list"])-1]
			if os.path.exists(p):
				file = p.split('.')
				recent_path = p
				if len(p.split('.')) >=2:
					if type == "add_folder":
						recent_path = os.path.dirname(recent_path)
					recent_path = os.path.dirname(recent_path)
				elif type == "add_folder":
					recent_path = os.path.dirname(recent_path)
		return recent_path
		if DEBUG_PRINTING == True: print("Exited WavPlayerUiForm-->get_recent_path")

	def set_log(self):
		if DEBUG_PRINTING == True: print("Entered WavPlayerUiForm-->set_log")
		#=======================================================================
		LOGGER_PATH = self.txtLogPath.text()
		logging.basicConfig(filename=LOGGER_PATH,filemode='w', level=logging_level, format=LOGGER_FORMAT, datefmt=LOGGER_DATE_FORMAT)
		#=======================================================================

		console = logging.StreamHandler(TextRedirect(self.textBrowser))
		console.setLevel(logging_level)
		formatter = logging.Formatter(LOGGER_FORMAT, LOGGER_DATE_FORMAT)
		console.setFormatter(formatter)
		logging.getLogger('').addHandler(console)
		if DEBUG_PRINTING == True: print("Exited WavPlayerUiForm-->set_log")

	def start_logging(self):
		if DEBUG_PRINTING == True: print("Entered WavPlayerUiForm-->start_logging")
		log = logging.getLogger()  # root logger
		for hdlr in log.handlers[:]:  # remove all old handlers
			print("removing log with handler: " + str(hdlr))
			log.removeHandler(hdlr)
		self.set_log()

		# self.Log_text_to_GUI()
		self.Logging_Phone = False
		self.Logging_LabJack = False
		self.Logging_QCC = False
		if self.header_dict["Listening_time"] == 0:
			if self.header_dict["delay_mode"] == "Trig/ASR":
				self.header_dict["Listening_time"] = (len(self.chosen_wavs)/2)*int((int(self.header_dict["trig_delay"])+5)+(len(self.chosen_wavs)/2)*(int(self.header_dict["asr_delay"])+5))
			else:
				self.header_dict["Listening_time"] = len(self.chosen_wavs) * (int(self.header_dict["trig_delay"]) + 5)
		if self.chkBx_Log_MP.checkState():
			phone = phoneConnectionManager()
			adb = phone._get_adb_path()

			is_phone_connected = phone.check_phone_connected(adb)
			if is_phone_connected:
				logging.info("Cleaning the device's log...")
				sp.Popen([adb, "logcat", "-c"]).wait()

				self.PhoneloggerThread = MP_LoggerThread(adb,self.header_dict["Listening_time"])
				self.widget.connect( self.PhoneloggerThread, QtCore.SIGNAL("log-info"), logging.info )
				self.widget.connect( self.PhoneloggerThread, QtCore.SIGNAL("log-debug"), logging.info )
				self.widget.connect( self.PhoneloggerThread, QtCore.SIGNAL("recognized_MP"), self.recognized_MP_event )
				self.widget.connect(self.PhoneloggerThread, QtCore.SIGNAL("play-done"), self.stop_logging)
				self.widget.connect(self.PhoneloggerThread, QtCore.SIGNAL("Listening-done"),
									lambda: self.shut_down_Listener_automaticaly())
				self.PhoneloggerThread.start()
				self.Logging_Phone = True
		if self.chkBx_Log_LabJack.checkState():
			is_LabJack_Connected = check_labjack_connection(self.txtCounter0Name.text(),self.txtCounter1Name.text())
			if is_LabJack_Connected:
				logging.info("connecting to LabJack for results")
				counter0_name = self.txtCounter0Name.text()
				counter1_name = self.txtCounter1Name.text()
				dictionary_name = str(self.Dictionary_List.currentText())
				self.LabJackloggerThread = Listening_Loop(dictionary_name,counter0_name,counter1_name,False,0.5,self.header_dict["Listening_time"])
				# self.LabJackloggerThread = Listening_Loop("500", "Google", False, 0.5)
				self.widget.connect(self.LabJackloggerThread, QtCore.SIGNAL("log-info"), logging.info)
				self.widget.connect(self.LabJackloggerThread, QtCore.SIGNAL("log-debug"), logging.info)
				self.widget.connect(self.LabJackloggerThread, QtCore.SIGNAL("recognized_LJ0"), self.recognized_LJ0_event)
				self.widget.connect(self.LabJackloggerThread, QtCore.SIGNAL("recognized_LJ1"), self.recognized_LJ1_event)
				self.widget.connect(self.LabJackloggerThread, QtCore.SIGNAL("Listening-done"), lambda: self.shut_down_Listener_automaticaly())
				self.widget.connect(self.PhoneloggerThread, QtCore.SIGNAL("play-done"), self.stop_logging)
				self.LabJackloggerThread.start()
				self.Logging_LabJack = True

		if self.chkBx_Log_UART.checkState():
			logging.info("Connecting to UART for results")
			self.UARTLoggerThread = UART_LoggerThread(self.header_dict["com_port"], self.header_dict["Listening_time"])
			self.widget.connect(self.UARTLoggerThread, QtCore.SIGNAL("log-info"), logging.info)
			self.widget.connect(self.UARTLoggerThread, QtCore.SIGNAL("log-debug"), logging.info)
			self.widget.connect(self.UARTLoggerThread, QtCore.SIGNAL("recognized_UART"), self.recognized_UART_event)
			self.widget.connect(self.UARTLoggerThread, QtCore.SIGNAL("play-done"), self.stop_logging)
			self.widget.connect(self.UARTLoggerThread, QtCore.SIGNAL("Listening-done"),
								lambda: self.shut_down_Listener_automaticaly())
			self.UARTLoggerThread.start()
			self.Logging_UART = True
		if self.chkBx_Log_SERIAL.checkState():
			logging.info("Connecting to SERIAL for results")
			self.SERIALLoggerThread = SERIAL_LoggerThread(self.header_dict["com_port"], self.header_dict["Listening_time"])
			self.widget.connect(self.SERIALLoggerThread, QtCore.SIGNAL("log-info"), logging.info)
			self.widget.connect(self.SERIALLoggerThread, QtCore.SIGNAL("log-debug"), logging.info)
			self.widget.connect(self.SERIALLoggerThread, QtCore.SIGNAL("recognized_SERIAL"), self.recognized_SERIAL_event)
			self.widget.connect(self.SERIALLoggerThread, QtCore.SIGNAL("play-done"), self.stop_logging)
			self.widget.connect(self.SERIALLoggerThread, QtCore.SIGNAL("Listening-done"),
								lambda: self.shut_down_Listener_automaticaly())
			self.SERIALLoggerThread.start()
			self.Logging_SERIAL = True
		if self.chkBx_Log_QCCUSB.checkState():
			logging.info("Connecting to QCC USB for results")
			self.QCCLoggerThread = QCC_LoggerThread()
			self.widget.connect(self.QCCLoggerThread, QtCore.SIGNAL("log-info"), logging.info)
			self.widget.connect(self.QCCLoggerThread, QtCore.SIGNAL("log-debug"), logging.info)
			self.widget.connect(self.QCCLoggerThread, QtCore.SIGNAL("recognized_QCC"),
								self.recognized_QCC_event)
			self.widget.connect(self.QCCLoggerThread, QtCore.SIGNAL("Info_QCC"),
								self.info_QCC_event)
			self.widget.connect(self.QCCLoggerThread, QtCore.SIGNAL("Energy_QCC"),
								self.energy_QCC_event)
			self.widget.connect(self.QCCLoggerThread, QtCore.SIGNAL("play-done"), self.stop_logging)
			self.widget.connect(self.QCCLoggerThread, QtCore.SIGNAL("Listening-done"),
								lambda: self.shut_down_Listener_automaticaly())
			self.Logging_QCC = True
			self.QCCLoggerThread.start()
		if DEBUG_PRINTING == True: print("Exited WavPlayerUiForm-->start_logging")

	def stop_logging(self):
		if DEBUG_PRINTING == True: print("Entered WavPlayerUiForm-->stop_logging")
		phone = phoneConnectionManager()
		self.adb = phone._get_adb_path()
		if self.Logging_Phone:
			# print("Need to stop adb logger and Kill adb connection")
			phone.close_phone_connection()
			self.PhoneloggerThread.stop(self.adb)
			#phoneConnectionManager.close_phone_connection(adb)
		if self.Logging_LabJack:
			# print("Need to stop LabJack Logging and Close LabJack connection")
			self.LabJackloggerThread.stop_loop()
			self.LabJackloggerThread.close()
		if self.Logging_QCC:
			self.QCCLoggerThread.stop()
		log = logging.getLogger()  # root logger
		for hdlr in log.handlers[:]:  # remove all old handlers
			print("removing log with handler: " + str(hdlr))
			log.removeHandler(hdlr)
			if DEBUG_PRINTING == True: print("Exited WavPlayerUiForm-->stop_logging")

	def recognized_MP_event(self):
		if DEBUG_PRINTING == True: print("Entered WavPlayerUiForm-->recognized_MP_event")
		global recognized_cur_wav

		phone_log_thread = MP_LoggerThread(None)
		#LabJack_log_thread = self.LabJackloggerThread
		recognized_phrase = phone_log_thread.get_recognized_phrase_MP()

		recognized_cur_wav = True
		# print("Recognized! - " + recognized_phrase)
		self.PhoneloggerThread.emit(QtCore.SIGNAL('log-info'), "Recognized! - " + recognized_phrase)
		self.check_if_found_recognized_phrase(recognized_phrase)

	def recognized_UART_event(self):
		if DEBUG_PRINTING == True: print("Entered WavPlayerUiForm-->recognized_UART_event")
		global recognized_cur_wav

		uart_log_thread = UART_LoggerThread(None)
		#LabJack_log_thread = self.LabJackloggerThread
		recognized_phrase = uart_log_thread.get_recognized_phrase_UART()

		recognized_cur_wav = True
		# print("Recognized! - " + recognized_phrase)

		now = datetime.datetime.now()
		timestamp = now.strftime(LOGGER_DATE_FORMAT)+ ('.%03d' % (now.microsecond / 10000))
		self.UARTLoggerThread.emit(QtCore.SIGNAL('log-info'), timestamp +" - Recognized! " + recognized_phrase)
		# self.check_if_found_recognized_phrase(recognized_phrase)
		if DEBUG_PRINTING == True: print("Exited WavPlayerUiForm-->recognized_UART_event")
	def recognized_QCC_event(self):
		if DEBUG_PRINTING == True: print("Entered WavPlayerUiForm-->recognized_QCC_event")
		global recognized_cur_wav

		recognized_phrase = self.QCCLoggerThread.get_recognized_QCC_phrase()
		recognized_cur_wav = True
		# print("Recognized! - " + recognized_phrase)

		now = datetime.datetime.now()
		timestamp = now.strftime(LOGGER_DATE_FORMAT) + ('.%03d' % (now.microsecond / 10000))
		self.QCCLoggerThread.emit(QtCore.SIGNAL('log-info'), timestamp + " - QCC Recognized! - " + recognized_phrase)
		self.check_if_found_recognized_phrase(recognized_phrase)

	def energy_QCC_event(self):
		if DEBUG_PRINTING == True: print("Entered WavPlayerUiForm-->energy_QCC_event")
		# global recognized_cur_wav

		recognized_phrase = self.QCCLoggerThread.get_energy_QCC_phrase()
		# recognized_cur_wav = True
		# print("Recognized! - " + recognized_phrase)
		now = datetime.datetime.now()
		timestamp = now.strftime(LOGGER_DATE_FORMAT) + ('.%03d' % (now.microsecond / 10000))
		self.QCCLoggerThread.emit(QtCore.SIGNAL('log-info'),
								  timestamp + " - QCC Info! - " + recognized_phrase)


	def info_QCC_event(self):
		if DEBUG_PRINTING == True: print("Entered WavPlayerUiForm-->info_QCC_event")
		global recognized_cur_wav

		recognized_phrase = self.QCCLoggerThread.get_info_QCC_phrase()
		recognized_cur_wav = True
		# print("Recognized! - " + recognized_phrase)
		now = datetime.datetime.now()
		timestamp = now.strftime(LOGGER_DATE_FORMAT) + ('.%03d' % (now.microsecond / 10000))
		self.QCCLoggerThread.emit(QtCore.SIGNAL('log-info'),
								  timestamp + " - QCC Info! - " + recognized_phrase)

		self.check_if_found_recognized_phrase(recognized_phrase)


	def recognized_SERIAL_event(self):
		if DEBUG_PRINTING == True: print("Entered WavPlayerUiForm-->recognized_SERIAL_event")
		global recognized_cur_wav

		serial_log_thread = SERIAL_LoggerThread(None)
		recognized_phrase = serial_log_thread.get_recognized_phrase_SERIAL()

		recognized_cur_wav = True
		# print("Recognized! - " + recognized_phrase)

		now = datetime.datetime.now()
		timestamp = now.strftime(LOGGER_DATE_FORMAT)+ ('.%03d' % (now.microsecond / 10000))
		self.SERIALLoggerThread.emit(QtCore.SIGNAL('log-info'), timestamp +" SERIAL Recognized! - " + recognized_phrase)


	def recognized_LJ0_event(self):
		# print("Entered WavPlayerUiForm-->recognized_lj0_event")
		global recognized_cur_wav

		LabJack_log_thread = self.LabJackloggerThread
		recognized_phrase = LabJack_log_thread.get_recognized_phrase_LJ()

		recognized_cur_wav = True

		self.check_if_found_recognized_phrase(recognized_phrase,"counter0")
		self.LabJackloggerThread.emit(QtCore.SIGNAL('log-info'), "counter 0, " + recognized_phrase)
		if DEBUG_PRINTING == True: print("Exited WavPlayerUiForm-->recognized_lj0_event")

	def recognized_LJ1_event(self):
		# print("Entered WavPlayerUiForm-->recognized_lj1_event")
		global recognized_cur_wav

		LabJack_log_thread = self.LabJackloggerThread
		recognized_phrase = LabJack_log_thread.get_recognized_phrase_LJ()

		recognized_cur_wav = True

		self.check_if_found_recognized_phrase(recognized_phrase,"counter1")
		self.LabJackloggerThread.emit(QtCore.SIGNAL('log-info'), "counter 1, " + recognized_phrase)
		if DEBUG_PRINTING == True: print("Exited WavPlayerUiForm-->recognized_lj1_event")

	def check_if_found_recognized_phrase(self, recognized_phrase,counter_name=""):
		# print("Entered WavPlayerUiForm-->check_if_found_recognized_phrase")
		global FOUND_PHRASE
		if self.header_dict["trigger_recognition_phrases"] != "":
			trigger_recognition_phrases = self.header_dict["trigger_recognition_phrases"].split(",")
			# print("Looking in phrase " + str(recognized_phrase).lower())
			#FOUND_PHRASE["Next_ASR"] = False
			for trig_phrase in trigger_recognition_phrases:
				# print("comparing to Trigger phrase: " + str(trig_phrase).lower())
				if (str(trig_phrase).strip() !="") and str(trig_phrase).lower() in str(recognized_phrase).lower():
					# print("FOUND, " + '"' + trig_phrase + '"' + " ,in "+counter_name +" phrase: " + '"' + recognized_phrase + '"')
					# print("FOUND_PHRASE-Recognized Trigger = True")
					if(self.header_dict["delay_mode"]=="Trig/ASR"):
						self.playing_thread.found_asr_recognition_phrase()
						# print("FOUND_PHRASE-Next_ASR = True")
					else:
						self.playing_thread.found_trigger_recognition_phrase()
						# print("FOUND_PHRASE-Next_TRIG = True")
					break
		# else:
			# print("Not checking for Trigger phrase since Trigger_Phrase is empty")
		if self.header_dict["asr_recognition_phrases"] !="" and (FOUND_PHRASE["Next_ASR"] == False) and (FOUND_PHRASE["Next_TRIGGER"] == False):
			asr_recognition_phrases = self.header_dict["asr_recognition_phrases"].split(",")
			for asr_phrase in asr_recognition_phrases:
				# print("comparing to ASR phrase: " + str(asr_phrase).lower())
				if (str(asr_phrase).strip() !="") and str(asr_phrase).lower() in str(recognized_phrase).lower():
				# 	print("FOUND, "+ '"' + asr_phrase + '"' + " ,in phrase: " + '"' + recognized_phrase + '"')
					# FOUND_PHRASE["Next_ASR"] = True
				# 	print("FOUND_PHRASE-Next_ASR = True")
					self.playing_thread.found_asr_recognition_phrase()
				# 	print("FOUND_PHRASE-Next_TRIG = True")
					break
	# 	print(FOUND_PHRASE)
	#	print("Exited WavPlayerUiForm-->check_if_found_recognized_phrase")


if __name__ == "__main__":
	import sys
	app = QtGui.QApplication(sys.argv)
	Form = QtGui.QWidget()
	ui = WavPlayerUiForm()
	ui.setupUi(Form,sys.argv)
	Form.show()

	sys.exit(app.exec_())
	sys.exit(1)