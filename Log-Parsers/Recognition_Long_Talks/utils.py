from templates_data import *
import openpyxl
import os
import sys
import shutil
import datetime
import copy
class Utils(object):
	def fetch_files_from_folder(self, pathToFolder):
		_pathToFiles = []
		_fileNames = []

		for dirPath, dirNames, fileNames in os.walk(pathToFolder):
			selected_path = [os.path.join(dirPath, item) for item in fileNames]
			_pathToFiles.extend(selected_path)

			selectedFile = [item for item in fileNames]
			_fileNames.extend(selectedFile)

			# Try to remove empty entries if none of the required files are in directory
			try:
				_pathToFiles.remove('')
				_imageFiles.remove('')
			except ValueError:
				pass

			# Warn if nothing was found in the given path
			if selectedFile == []:
				print
				'No files with given parameters were found in:\n', dirPath, '\n'

		print
		len(_fileNames), 'files were found is searched folder(s)'

		return _pathToFiles, _fileNames

	def get_excel_worksheet(self):
		pass

	@staticmethod
	def insertion_sort(items):
		for i in range(1, len(items)):
			j = i
			while j > 0 and items[j] > items[j - 1]:
				items[j - 1], items[j] = items[j], items[j - 1]
				j = j - 1
		return items


	def sort_order_dict(self,order_dict):
		for key in order_dict:
			items = order_dict[key]
			items = self.insertion_sort(items)

	def sorting_headers(self,sorting_dict,order_dict):
		sorted_list = []
		for m in order_dict["noise_file_name"]:
			for i in order_dict["trig_to_ASR_delay"]:
				for j in order_dict["signal_dB"]:
					for k in order_dict["noise_dB"]:
						for key in sorting_dict:
							if (sorting_dict[key]["noise_file_name"] == str(m) and
										sorting_dict[key]["trig_to_ASR_delay"] == str(int(i)) and
										sorting_dict[key]["signal_dB"] == str(int(j)) and
										sorting_dict[key]["noise_dB"] == str(int(k))):
								sorted_list.append(key)
		return sorted_list

	def clear_dict_values(self,dict):
		for key in dict:
			dict[key].clear()

	def  get_folder_location_path(self,folder):
		program_path = os.path.dirname(sys.argv[0])
		template_path = program_path + '\\' + folder
		return template_path





class ExcelHandler(object):

	def __init__(self, workbook_name):
		self.wb_name = workbook_name
		self.wb_name_with_dt = self._creat_new_excel_from_template_with_name_and_datetime(workbook_name)
		# self.wb = openpyxl.load_workbook(filename=str(self.wb_name_with_dt), keep_vba=True)
		self.wb = openpyxl.load_workbook(filename=str(self.wb_name_with_dt), keep_vba=True)
		self.template_info = {}
		self.template_indexes = {'Counter 0': 4,'Counter 0 DR': 4,'Counter 1': 4,'Counter 1 DR': 4,'UART': 4,'UART DR': 4,
		                         'Serial': 4, 'Serial DR': 4, 'Serial DR mTRIG': 4,'MP_mTRIG_sASR': 4,'MP_mTRIG_sASR DR': 4,'Counter 1 sTRIG_mASR' : 4,
		                         'Counter 0 sTRIG_mASR': 4, 'Serial sTRIG_mASR' : 4, 'UART sTRIG_mASR' : 4,
		                         'Counter 1 DR sTRIG_mASR': 4, 'Counter 0 DR sTRIG_mASR' : 4, 'UART DR sTRIG_mASR' : 4,
		                         'Serial DR sTRIG_mASR' : 4,
		                         'LJ_sTRIG_mASR DR' : 4,'LJ_mTRIG' : 4,'LJ_mTRIG DR' : 4,'LONG_TALKS_Counter 0' : 4,
		                         'LONG_TALKS_Counter 1' : 4,'LONG_TALKS_UART' : 4,'LONG_TALKS_Serial' : 4,
		                         'LONG_TALKS_Counter 1 mTrig': 4,"LONG_TALKS_Counter 0 mTrig": 4,"LONG_TALKS_UART mTrig": 4,
		                         "LONG_TALKS_Serial mTrig": 4, "Counter 0 mTRIG": 4,"Counter 1 mTRIG": 4,"UART mTRIG": 4,
		                         "Serial mTRIG": 4}
		self.sheet_MP = None
		self.sheet_trig_only = None
		self.sheet_LJ_sTRIG_mASR = None
		self.sheet_LongTalks = None
		self.sheet_LJ_mTRIG = None


	def run_log_printing_mTRIG_and_sTrigmASR(self,log_dict,sheet_name,Dict_Name,mode = 'sTrig_mASR'):
		header_section = log_dict['header_dict']
		asr_section = log_dict['asr_results_dict']
		if mode == 'TRIG/ASR':
			xls_tab_name = sheet_name + ' sTRIG_mASR'
			trig_section = log_dict['trig_results_dict_format']
		else:
			xls_tab_name = sheet_name + ' mTRIG'
		print("results are in tab " + xls_tab_name)
		FIRST_ROW_TO_PRINT_RESULTS = self.template_indexes[xls_tab_name]
		ROW= FIRST_ROW_TO_PRINT_RESULTS
		try:
			self.results_sheet = self._open_sheet(xls_tab_name)
		except:
			print("ERROR: Can't open "+ sheet_name + " mTRIG sheet in workbook")
			return
		''' printing header section'''
		self._write_line_to_excel_sheet(self.results_sheet, ROW, 2, header_section,EXCEL_LJ_sTRIG_mASR_TEMPLATE_HEADER_SECTION)
		if mode == 'TRIG/ASR':
			''' printing trig section'''
			self._write_line_to_excel_sheet(self.results_sheet, ROW, 30, trig_section, EXCEL_LJ_sTRIG_mASR_TEMPLATE_TRIG_SECTION)

		if Dict_Name.lower() == "ringing":
			cmd_template_order = Ringing_ASR_CMD_LIST
			cmd_template_dict = Ringing_CMD_TEMPLATE_DICT
		elif Dict_Name.lower() == "musicasr":
			cmd_template_order = Music_ASR_CMD_LIST
			cmd_template_dict = Music_CMD_TEMPLATE_DICT
		elif Dict_Name.lower() == "musicmtrig":
			cmd_template_order = Music_mTrig_CMD_LIST
			cmd_template_dict = Music_MTRIG_CMD_TEMPLATE_DICT
		elif Dict_Name.lower() == "fitnessasr" or Dict_Name.lower() == "jabra_old2":
			cmd_template_order = Fitness_ASR_CMD_LIST
			cmd_template_dict = Fitness_CMD_TEMPLATE_DICT
		elif Dict_Name.lower() == "standbyasr":
			cmd_template_order = StandbyASR_ASR_CMD_LIST
			cmd_template_dict = StanbyASR_CMD_TEMPLATE_DICT
		elif Dict_Name.lower() == "voiceexpressmeds":
			cmd_template_order = VoiceExpressMeds_ASR_CMD_LIST
			cmd_template_dict = VoiceExpressMeds_CMD_TEMPLATE_DICT
		else:
			cmd_template_order = ASR_CMD_LIST
			cmd_template_dict = CMD_TEMPLATE_DICT

		EXCEL_ASR_SECTION_WITH_SUBTITUTIONS = copy.deepcopy(EXCEL_LJ_sTRIG_mASR_TEMPLATE_ASR_SECTION)
		EXCEL_ASR_SECTION_WITH_SUBTITUTIONS.extend(cmd_template_order)
		''' printing asr section'''
		Column_number = 22
		for command in cmd_template_order:
			# Writes relevant commands in substitution header of spreadsheet
			if FIRST_ROW_TO_PRINT_RESULTS == 4 and Column_number <=28: #this if condition is beacuse without it, the substitutions list is printed for every log analyzed
				self.results_sheet[self._num_to_excel_alphabeit_colms(Column_number) + str(FIRST_ROW_TO_PRINT_RESULTS - 1)] = str(command.replace('_', ' '))
				Column_number +=1
			elif Column_number > 28: # there are only 6 columns for substitutions
				print("Some subtitution headers are missing!!!")
			try:
				curr_key = cmd_template_dict[command]
				if curr_key in asr_section.keys():
					curr_cmd_dict = asr_section[curr_key]
					#writes command name before rest of results are filled in to the row of details
					self.results_sheet[self._num_to_excel_alphabeit_colms(10) + str(ROW)] = str(command.replace('_', ' '))
					#Writes the details of results for the specific commmand
					self._write_line_to_excel_sheet(self.results_sheet, ROW, 11, curr_cmd_dict, EXCEL_ASR_SECTION_WITH_SUBTITUTIONS)
				else:
					pass
				ROW += 1
			except:
				pass


		self.template_indexes[xls_tab_name]+=6
		self.results_sheet.sheet_state = 'visible'


	def run_log_printing_TRIG_ONLY(self,log_dict,xls_tab_name):
		self.sheet_trig_only = self._open_sheet(xls_tab_name)
		print("results are in tab " + xls_tab_name)
		ROW = self.template_indexes[xls_tab_name]
		self._write_line_to_excel_sheet(self.sheet_trig_only,ROW,2,log_dict,EXCEL_TRIG_TEMPLATE_TUPLE)
		self.template_indexes[xls_tab_name] += 1
		self.sheet_trig_only.sheet_state = 'visible'


	def run_log_printing_TRIG_ASR_MP(self,log_dict):
		self.sheet_MP = self._open_sheet("MP_mTRIG_sASR")
		ROW = self.template_indexes["MP_mTRIG_sASR"]
		self._write_line_to_excel_sheet(self.sheet_MP,ROW,2,log_dict,EXCEL_MP_CMD_TEMPLATE_TOTAL)
		self.template_indexes['MP_mTRIG_sASR']+=1
		self.sheet_MP.sheet_state = 'visible'


	def run_log_printing_TRIG_ASR_MP_one_log_only(self,log_dict):
		if self.sheet_MP is None:
			self.sheet_MP = self._open_sheet("MP_mTRIG_sASR")
		ROW = self.template_indexes["MP_mTRIG_sASR"]
		PRINT_LIST=['trig_file','','' , '','' ,'' , '', '' ,'','',
					'LJ_Trigger','LJ_Trigger_latency','Trigger', 'Trigger_latency',
					"Amazon_Listening", "Amazon_Listening_latency",
					'VOX_Closed', 'VOX_Closed_latency',
					'VOX_Closed_timeout', 'VOX_Closed_timeout_latency',
					"Amazon_Processing", "Amazon_Processing_latency",
					"Amazon_Speaking", 'Amazon_Speaking_latency',
					'Waiting_for_Trigger', 'Waiting_for_Trigger_latency']
		for key in log_dict:
			if key is not 'total':
				log_dict[key]['trig_file'] = key
				self._write_line_to_excel_sheet(self.sheet_MP,ROW,2,log_dict[key],PRINT_LIST)
				self.template_indexes['MP_mTRIG_sASR']+=1
				ROW+=1
		self.sheet_MP.sheet_state = 'visible'



	def run_log_printing_LONG_TALKS(self,log_dict, xls_tab_name):
		xls_tab_name = 'LONG_TALKS_' + xls_tab_name
		self.sheet_LongTalks = self._open_sheet(xls_tab_name)
		print("results are in tab " + xls_tab_name)
		FIRST_ROW_TO_PRINT_RESULTS = self.template_indexes[xls_tab_name]
		ROW= FIRST_ROW_TO_PRINT_RESULTS
		if ROW == 4:
			''' printing titales for FA of individual comands'''
			self._write_title_to_excel_sheet(self.sheet_LongTalks, ROW-1, 9, EXCEL_MTRIG_MUSIC_LONG_TALKS_TEMPLATE_FILES_TUPLE)
		''' printing header section'''
		self._write_line_to_excel_sheet(self.sheet_LongTalks, ROW, 2, log_dict['header_dict'], EXCEL_LONG_TALKS_TEMPLATE_HEADER_TUPLE)

		''' printing Results for each file run in Long Talks'''
		for key in log_dict["talks_order"]:
			curr_key = log_dict["long_talks"][key]
			if 'mTrig' in xls_tab_name:
				self._write_line_to_excel_sheet(self.sheet_LongTalks, ROW, 9, curr_key,
				                                EXCEL_MTRIG_MUSIC_LONG_TALKS_TEMPLATE_FILES_TUPLE)
			else:
				self._write_line_to_excel_sheet(self.sheet_LongTalks, ROW, 9, curr_key,
											EXCEL_LONG_TALKS_TEMPLATE_FILES_TUPLE)
			ROW+=1

		self.template_indexes[xls_tab_name] = ROW+1
		self.sheet_LongTalks.sheet_state = 'visible'

	def run_log_printing_mTrig_LONG_TALKS(self,log_dict, xls_tab_name):
		''' for  'LONG_TALKS' SHEET TEMPLATE'''
		xls_tab_name = 'LONG_TALKS_' + xls_tab_name
		# if self.sheet_LongTalks is None:
		self.sheet_LongTalks = self._open_sheet(xls_tab_name)
		print("results are in tab " + xls_tab_name)
		FIRST_ROW_TO_PRINT_RESULTS = self.template_indexes[xls_tab_name]
		''' printing header section'''
		ROW= FIRST_ROW_TO_PRINT_RESULTS
		self._write_line_to_excel_sheet(self.sheet_LongTalks, ROW, 2, log_dict['header_dict'], EXCEL_LONG_TALKS_TEMPLATE_HEADER_TUPLE)
		for key in log_dict["talks_order"]:
			curr_key = log_dict["long_talks"][key]
			self._write_line_to_excel_sheet(self.sheet_LongTalks, ROW, 9, curr_key,
			                                EXCEL_MTRIG_LONG_TALKS_TEMPLATE_FILES_TUPLE)
			ROW+=1
		self.template_indexes[xls_tab_name] = ROW+1
		self.sheet_LongTalks.sheet_state = 'visible'



	def get_new_wb_name(self):
		return self.wb_name_with_dt

	def _creat_new_excel_from_template_with_name_and_datetime(self,project_name):
		program_path = os.path.dirname(sys.argv[0])
		template_path = program_path + '\\template\exl.xlsm'
		shutil.copy2(str(template_path), str(program_path))
		date_time = datetime.datetime.strftime(datetime.datetime.now(), '_%Y-%m-%d__%H_%M_%S')
		exl_file_name = str(project_name) + str(date_time) + ".xlsm"
		os.rename("exl.xlsm", str(exl_file_name))
		return str(exl_file_name)


	def _write_title_to_excel_sheet(self,sheet,row,column,template_list):
		row = str(row)
		start_col = column
		for i, key in enumerate(template_list):
			col = self._num_to_excel_alphabeit_colms(i+start_col)
			try:
				title = key.replace("_", " ")
				sheet[col + row] = title
			except : print 'ERROR in Function: _write_title_to_excel_sheet ' + key


	def _write_line_to_excel_sheet(self,sheet,row,column,val_dict,template_list):
		row = str(row)
		start_col = column
		for i, key in enumerate(template_list):
			try:
				just_for_the_watch = str(val_dict[key])
			except: continue
			col = self._num_to_excel_alphabeit_colms(i+start_col)
			try:
				if "% separate words recognized" not in key:
					# sheet[col + row] = str(val_dict[key])
					sheet[col + row] = val_dict[key]
			except : print 'ERROR in Function: _write_line_to_excel_sheet ' + key


	def _open_sheet(self,sheet_name):
		sheet = self.wb.get_sheet_by_name(sheet_name)
		return sheet

	def _num_to_excel_alphabeit_colms(self,index_num):
		cal1 = index_num % 27
		cal2 = index_num // 26
		new = index_num - cal2 * 26
		if new == 0:
			new = 26
			cal2 -= 1
		if cal2:
			mychar = chr(cal2 + 64) + chr(new + 64)
		else:
			mychar = chr(index_num + 64)
		return mychar

	def save_workbook(self):
		self.wb.save(str(self.wb_name_with_dt))


