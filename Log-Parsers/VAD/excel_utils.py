#######################################################################################################
# GLOBAL VARIABLES

EXCEL_FILE_NAME = 'VAD_results'

SCRIPT1_TEMPLATE = {'log_file_path' : "", 'speech_script' : "", 'noise_name' : "", 'noise_level' : 0,'file_length' : "",
					 'average_laitency_openning': 0, 'average_laitency_closing': 0,
					 'total_FA_time': "", 'total_FA_percent': 0, 'total_FA_count': 0,
					'listening_FA_time' : "", 'listening_FA_percent' : 0, 'listening_FA_count' : 0 ,
					'not_listening_FA_time': "", 'not_listening_FA_percent': 0, 'not_listening_FA_count': 0}

SCRIPT1_TUPPLE = ['log_file_path' , 'speech_script', 'noise_name', 'noise_level','file_length',
					 'average_open_laitency', 'average_close_laitency',
					 'total_FA_time', 'total_FA_percent', 'total_FA_count',
					'total_FA_Listening', 'listening_FA_percent', 'FA_Listening_count',
					'total_FA_not_Listening', 'not_listening_FA_percent', 'FA_Not_Listening_count']
#######################################################################################################
import openpyxl
import os
import sys
import shutil
import datetime
import my_time_utils as time
import copy



class ExcelHandler(object):

	def __init__(self, workbook_name):
		self.wb_name = workbook_name
		self.wb_name_with_dt = self._creat_new_excel_from_template_with_name_and_datetime(workbook_name)
		# self.wb = openpyxl.load_workbook(filename=str(self.wb_name_with_dt), keep_vba=True)
		self.wb = openpyxl.load_workbook(filename=str(self.wb_name_with_dt), keep_vba=True)
		self.template_info = {}
		self.template_indexes = {'TestResults': 3}


	def run_log_printing(self,log_dict,xls_tab_name='TestResults'):
		self.sheet_vad_results = self._open_sheet(xls_tab_name)
		print("results are in tab " + xls_tab_name)
		ROW =   self.template_indexes[xls_tab_name]
		self._write_line_to_excel_sheet(self.sheet_vad_results,ROW,2,log_dict,SCRIPT1_TUPPLE)
		self.template_indexes[xls_tab_name] += 1
		self.sheet_vad_results.sheet_state = 'visible'

	def run_debug_printing(self, template_map,test_results_map,time_resolution, length_of_wav, xls_tab_name='Debug'):
		index = 0
		self.sheet_debug_results = self._open_sheet(xls_tab_name)
		length_of_wav_Milliseconds = time.timestamp_to_milliseconds(length_of_wav)
		print("results are in tab " + xls_tab_name)
		ROW = 2 # self.template_indexes[xls_tab_name]
		while index * time_resolution <= length_of_wav_Milliseconds:
			if len(template_map) <= index:
				current_template_result = 0
			else:
				current_template_result = template_map[index]
			if len(test_results_map) <= index:
				current_test_result = 0
			else:
				current_test_result = test_results_map[index]
			index += 1
			curent_timestamp = time.milliseconds_to_timestamp(index * time_resolution)

			self.sheet_debug_results["A" + str(index + 2)] = current_template_result
			self.sheet_debug_results["B" + str(index + 2)] = current_test_result
			self.sheet_debug_results["C" + str(index + 2)] = str(index * time_resolution)
			self.sheet_debug_results["D" + str(index + 2)] = curent_timestamp
		self.sheet_debug_results.sheet_state = 'visible'


	def get_new_wb_name(self):
		return self.wb_name_with_dt


	def _creat_new_excel_from_template_with_name_and_datetime(self,project_name):
		program_path = os.path.dirname(sys.argv[0])
		template_path = program_path + '\\Excel_template\TestResults.xlsx'
		shutil.copy2(str(template_path), str(program_path))
		date_time = datetime.datetime.strftime(datetime.datetime.now(), '_%Y-%m-%d__%H_%M_%S')
		exl_file_name = str(project_name) + str(date_time) + ".xlsm"
		os.rename("testresults.xlsx", str(exl_file_name))
		return str(exl_file_name)


	def _write_line_to_excel_sheet(self,sheet,row,column,val_dict,template_list):
		row = str(row)
		start_col = column
		for i, key in enumerate(template_list):
			col = self._num_to_excel_alphabeit_colms(i+start_col)
			try:
				if "% separate words recognized" not in key:
					try: result = float(str(val_dict[key]))
					except: result = str(val_dict[key])
					sheet[col + row] = result
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