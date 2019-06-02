from utils import Utils, ExcelHandler
from my_log_classes import LogFile
from MP_classes import TrigASRMobilPhoneLog_MP
from Parsing_classes import * # For LJ, UART & Serial

def main():
	utils = Utils()
	LOG_DIRECTORY_PATH = utils.get_folder_location_path('Logs_directory')

	############################# sorting #######################################
	txt_file_path_list, txt_file_name_list = utils.fetch_files_from_folder(LOG_DIRECTORY_PATH)
	all_logs_dict = {}
	order_dict = {"noise_dB": [], "noise_file_name": [], "signal_dB": [], "trig_to_ASR_delay": []}

	for txt_file_path in txt_file_path_list:
		print("running header on file {}".format(txt_file_path))
		curr_header = LogFile(txt_file_path)
		lines = curr_header.get_lines_from_text_file()
		if not 'CMD Error Log' in lines[0]:
			curr_header.get_header_param_JBX_method(lines)
			# curr_header.handle_header_params()
			all_logs_dict[txt_file_path] = curr_header.header_dict

			for key in order_dict:
				val = curr_header.header_dict[key]
				if key != 'noise_file_name':
					try: val = int(val)
					except :
						val = float(val)
						val= int(val)
						curr_header.header_dict[key] = int(float(curr_header.header_dict[key]))
				if val not in order_dict[key]:
					order_dict[key].append(val)
		else:
			print("SKIPPING file {}".format(txt_file_path))


	utils.sort_order_dict(order_dict)
	LogFile.num_of_headers, LogFile.num_of_logs = LogFile.num_of_logs, 0

	sorted_list = utils.sorting_headers(all_logs_dict, order_dict)
	utils.clear_dict_values(all_logs_dict)


	############################# running analysis #######################################

	excel_class = ExcelHandler(EXCEL_FILE_NAME)



	for txt_file_path in sorted_list:
		print("log file {} is running".format(txt_file_path))
		curr_log = LogFile(txt_file_path)
		lines = curr_log.get_lines_from_text_file()
		curr_log.get_header_param_JBX_method(lines)
		# curr_log.handle_header_params()
		# if curr_log.header_dict['test_type'].upper().strip('"') == 'SNR': # or curr_log.header_dict['test_type'].upper().strip('"') == 'DYNAMIC_RANGE':
		delay_type = curr_log.header_dict['TRIG\ASR'].upper().strip('"')
		#else:
		test_type = curr_log.header_dict['test_type'].upper().strip('"')
		environment_board = curr_log.header_dict['environment_board'].upper()
		if environment_board == 'EB' or environment_board == 'LISTENER':
			environment_board = 'LJ'
		app_name0, app_name1 = curr_log.header_dict['counter0'].lower().strip('"'), curr_log.header_dict['counter1'].lower().strip('"')
		# app_name0, app_name1 = app_name0.replace('"',''), app_name1.replace('"','')
		# if ('long_talks' in app_name0.lower()) or ('long_talks' in app_name1.lower()):
		# test_type = 'LONG_TALKS'
		# if (('long' in app_name0.lower()) and ('talks' in app_name0.lower())) or (('long' in app_name1.lower()) and ('talks' in app_name1.lower())):
		# 	test_type = 'LONG_TALKS'
		if 'MP' in environment_board:
			print('mp~!!!!!!!!')
			Trig_MP_sub_log = TrigASRMobilPhoneLog_MP(txt_file_path)
			lines = Trig_MP_sub_log.get_lines_from_text_file()
			Trig_MP_sub_log.get_header_param_JBX_method(lines)
			Trig_MP_sub_log.run_log_analysis(lines)
			Trig_MP_sub_log.end_of_log()
			if len(sorted_list)==1:
				excel_class.run_log_printing_TRIG_ASR_MP(Trig_MP_sub_log.results_per_trig_file['total'])
				excel_class.run_log_printing_TRIG_ASR_MP_one_log_only(Trig_MP_sub_log.results_per_trig_file)
			else:
				excel_class.run_log_printing_TRIG_ASR_MP(Trig_MP_sub_log.results_per_trig_file['total'])
		Dict_Name = curr_log.header_params[9].strip('"')
		if  test_type=='SNR' or test_type == 'DYNAMIC_RANGE':
			if delay_type == 'TRIGGER_ONLY' or delay_type == 'TRIG':
				if 'LJ' in environment_board:
					if (app_name0 == app_name1) and (app_name0 != 'none'):
						sheet_name = get_SheetName(app_name0, environment_board, test_type, 'Counter 0')
						Trig_LJ_sub_log_reset_mode = TrigLog(txt_file_path, 'LJ')
						lines = Trig_LJ_sub_log_reset_mode.get_lines_from_text_file()
						Trig_LJ_sub_log_reset_mode.get_header_param_JBX_method(lines)
						Trig_LJ_sub_log_reset_mode.set_mode("reset mode", app_name0)
						Trig_LJ_sub_log_reset_mode.run_log_analysis(lines)
						Trig_LJ_sub_log_reset_mode.end_of_log()
						excel_class.run_log_printing_TRIG_ONLY(Trig_LJ_sub_log_reset_mode.results_dict, sheet_name)
					else:
						if app_name0 != 'none':
							if 'lj' in environment_board.lower() and ('uart' in environment_board.lower() or 'serial' in environment_board.lower()):
								Counter_Name = 'Counter 0'
							else:
								Counter_Name = app_name0
							sheet_name = get_SheetName(Counter_Name, environment_board, test_type, 'Counter 0')
							Trig_LJ_sub_log_counter0 = TrigLog(txt_file_path, 'LJ')
							lines = Trig_LJ_sub_log_counter0.get_lines_from_text_file()
							Trig_LJ_sub_log_counter0.get_header_param_JBX_method(lines)
							Trig_LJ_sub_log_counter0.set_mode("counter0 only", app_name0)
							if Trig_LJ_sub_log_counter0.header_dict['trigger_phrase'] == 'Jabra_old2':
								Trig_LJ_sub_log_counter0.header_dict['trigger_phrase'] = 'hey jabra'
							elif Trig_LJ_sub_log_counter0.header_dict['trigger_phrase'].lower() == 'google_old':
								Trig_LJ_sub_log_counter0.header_dict['trigger_phrase'] = 'ok google'
							Trig_LJ_sub_log_counter0.run_log_analysis(lines)
							Trig_LJ_sub_log_counter0.end_of_log()
							excel_class.run_log_printing_TRIG_ONLY(Trig_LJ_sub_log_counter0.results_dict, sheet_name)
						if app_name1 != 'none':
							sheet_name = get_SheetName(app_name1, environment_board, test_type,'Counter 1')
							Trig_LJ_sub_log_counter1 = TrigLog(txt_file_path, 'LJ')
							lines = Trig_LJ_sub_log_counter1.get_lines_from_text_file()
							Trig_LJ_sub_log_counter1.get_header_param_JBX_method(lines)
							Trig_LJ_sub_log_counter1.set_mode("counter1 only", app_name1)
							Trig_LJ_sub_log_counter1.run_log_analysis(lines)
							Trig_LJ_sub_log_counter1.end_of_log()
							excel_class.run_log_printing_TRIG_ONLY(Trig_LJ_sub_log_counter1.results_dict, sheet_name)
				if 'UART' in environment_board or 'serial' in environment_board.lower():
					sheet_name = get_SheetName(app_name0, environment_board, test_type, 'None')
					Trig_UART_sub_log = TrigLog(txt_file_path,sheet_name)
					lines = Trig_UART_sub_log.get_lines_from_text_file()
					Trig_UART_sub_log.get_header_param_JBX_method(lines)
					Trig_UART_sub_log.set_mode(sheet_name, app_name0)
					if Trig_UART_sub_log.header_dict['trigger_phrase'] == 'Jabra_old2':
						Trig_UART_sub_log.header_dict['trigger_phrase'] = 'hey jabra'
					elif Trig_UART_sub_log.header_dict['trigger_phrase'].lower() == 'google_old':
						Trig_UART_sub_log.header_dict['trigger_phrase'] = 'ok google'
					Trig_UART_sub_log.run_log_analysis(lines)
					Trig_UART_sub_log.end_of_log()
					excel_class.run_log_printing_TRIG_ONLY(Trig_UART_sub_log.results_dict, sheet_name)
			elif  delay_type == 'TRIG/ASR' :
				if 'LJ' in environment_board:
					if (app_name0 == app_name1) and (app_name0 != 'none'):
						sheet_name = get_SheetName(app_name0, environment_board, test_type, 'Counter 0')
						Trig_ASR_Lj_sub_log_reset_mode = TrigASRLog(txt_file_path,Dict_Name)
						lines = Trig_ASR_Lj_sub_log_reset_mode.get_lines_from_text_file()
						Trig_ASR_Lj_sub_log_reset_mode.get_header_param_JBX_method(lines)
						Trig_ASR_Lj_sub_log_reset_mode.set_mode("reset mode", app_name0)
						Trig_ASR_Lj_sub_log_reset_mode.run_log_analysis(lines)
						Trig_ASR_Lj_sub_log_reset_mode.end_of_log()
						excel_class.run_log_printing_LJ_sTRIG_mASR(Trig_ASR_Lj_sub_log_reset_mode.results_dict, sheet_name,Dict_Name)
					else:
						if app_name0.lower() != 'none':
							if 'lj' in environment_board.lower() and ('uart' in environment_board.lower() or 'serial' in environment_board.lower()):
								Counter_Name = 'Counter 0'
							else:
								Counter_Name = app_name0
							sheet_name = get_SheetName(Counter_Name, environment_board, test_type, 'Counter 0')
							Trig_ASR_Lj_sub_log_counter0 = TrigASRLog(txt_file_path,Dict_Name)
							lines = Trig_ASR_Lj_sub_log_counter0.get_lines_from_text_file()
							Trig_ASR_Lj_sub_log_counter0.get_header_param_JBX_method(lines)
							Trig_ASR_Lj_sub_log_counter0.set_mode("counter0 only", app_name0)
							Trig_ASR_Lj_sub_log_counter0.run_log_analysis(lines)
							Trig_ASR_Lj_sub_log_counter0.end_of_log()
							excel_class.run_log_printing_mTRIG_and_sTrigmASR(Trig_ASR_Lj_sub_log_counter0.results_dict,sheet_name,Dict_Name,delay_type)
						if app_name1.lower() != 'none':
							sheet_name = get_SheetName(app_name1, environment_board, test_type, 'Counter 1')
							Trig_ASR_Lj_sub_log_counter1 = TrigASRLog(txt_file_path,Dict_Name)
							lines = Trig_ASR_Lj_sub_log_counter1.get_lines_from_text_file()
							Trig_ASR_Lj_sub_log_counter1.get_header_param_JBX_method(lines)
							Trig_ASR_Lj_sub_log_counter1.set_mode("counter1 only", app_name1)
							Trig_ASR_Lj_sub_log_counter1.run_log_analysis(lines)
							Trig_ASR_Lj_sub_log_counter1.end_of_log()
							excel_class.run_log_printing_mTRIG_and_sTrigmASR(Trig_ASR_Lj_sub_log_counter1.results_dict, sheet_name,Dict_Name,delay_type)
				if 'uart' in environment_board.lower() or 'serial' in environment_board.lower():
					sheet_name = get_SheetName(app_name0, environment_board, test_type, 'None')
					Trig_ASR_UART_Serial_sub_log = TrigASRLog(txt_file_path,Dict_Name)
					lines = Trig_ASR_UART_Serial_sub_log.get_lines_from_text_file()
					Trig_ASR_UART_Serial_sub_log.get_header_param_JBX_method(lines)
					Trig_ASR_UART_Serial_sub_log.set_mode(sheet_name, app_name0)
					Trig_ASR_UART_Serial_sub_log.run_log_analysis(lines)
					Trig_ASR_UART_Serial_sub_log.end_of_log()
					excel_class.run_log_printing_mTRIG_and_sTrigmASR(Trig_ASR_UART_Serial_sub_log.results_dict, sheet_name,Dict_Name,delay_type)
			elif  delay_type.lower() == "multi_trig" or delay_type.lower() == "m-trig" or delay_type.lower() == "multi-trig" or delay_type.lower() == "m_trig":
				delay_type = 'mTrig'
				if 'LJ' in environment_board:
					if (app_name0 == app_name1) and (app_name0.lower() != 'none'):
						# reset mode
						sheet_name = get_SheetName(app_name0, environment_board, test_type, 'Counter 0')
						M_Trig_ASR_only_Lj_sub_log_reset_mode = multi_Trig_ASR_only(txt_file_path,environment_board, Dict_Name)
						lines = M_Trig_ASR_only_Lj_sub_log_reset_mode.get_lines_from_text_file()
						M_Trig_ASR_only_Lj_sub_log_reset_mode.get_header_param_JBX_method(lines)
						M_Trig_ASR_only_Lj_sub_log_reset_mode.set_mode("reset mode", app_name0)
						M_Trig_ASR_only_Lj_sub_log_reset_mode.run_log_analysis(lines)
						M_Trig_ASR_only_Lj_sub_log_reset_mode.end_of_log()#(True)
						excel_class.run_log_printing_mTRIG_and_sTrigmASR(M_Trig_ASR_only_Lj_sub_log_reset_mode.results_dict,sheet_name,delay_type)
					else:
						if app_name0 != 'none':
							if 'lj' in environment_board.lower() and ('uart' in environment_board.lower() or 'serial' in environment_board.lower()):
								Counter_Name = 'Counter 0'
							else:
								Counter_Name = app_name0
							sheet_name = get_SheetName(Counter_Name, environment_board, test_type, 'Counter 0')
							M_Trig_ASR_only_Lj_sub_log_counter0 = multi_Trig_ASR_only(txt_file_path,environment_board, Dict_Name)
							lines = M_Trig_ASR_only_Lj_sub_log_counter0.get_lines_from_text_file()
							M_Trig_ASR_only_Lj_sub_log_counter0.get_header_param_JBX_method(lines)
							M_Trig_ASR_only_Lj_sub_log_counter0.set_mode("counter0 only", app_name0)
							# for key in Trig_ASR_Lj_sub_log_counter0.results_dict:
							# 	print '{}: {}'.format(key,Trig_ASR_Lj_sub_log_counter0.results_dict[key])

							M_Trig_ASR_only_Lj_sub_log_counter0.run_log_analysis(lines)
							M_Trig_ASR_only_Lj_sub_log_counter0.end_of_log()
							excel_class.run_log_printing_mTRIG_and_sTrigmASR(M_Trig_ASR_only_Lj_sub_log_counter0.results_dict,sheet_name,Dict_Name,delay_type)

						if app_name1 != 'none':
							sheet_name = get_SheetName(app_name1, environment_board, test_type, 'Counter 1')
							M_Trig_ASR_only_Lj_sub_log_counter1 = multi_Trig_ASR_only(txt_file_path,environment_board, Dict_Name)
							lines = M_Trig_ASR_only_Lj_sub_log_counter1.get_lines_from_text_file()
							M_Trig_ASR_only_Lj_sub_log_counter1.get_header_param_JBX_method(lines)
							M_Trig_ASR_only_Lj_sub_log_counter1.set_mode("counter1 only", app_name1)
							M_Trig_ASR_only_Lj_sub_log_counter1.run_log_analysis(lines)
							M_Trig_ASR_only_Lj_sub_log_counter1.end_of_log()
							excel_class.run_log_printing_mTRIG_and_sTrigmASR(M_Trig_ASR_only_Lj_sub_log_counter1.results_dict,sheet_name,Dict_Name,delay_type)
				if 'uart' in environment_board.lower() or 'serial' in environment_board.lower():
					sheet_name = get_SheetName(app_name0, environment_board, test_type, 'None')
					M_Trig_ASR_only_Lj_sub_log_reset_mode = multi_Trig_ASR_only(txt_file_path,environment_board, Dict_Name)
					lines = M_Trig_ASR_only_Lj_sub_log_reset_mode.get_lines_from_text_file()
					M_Trig_ASR_only_Lj_sub_log_reset_mode.get_header_param_JBX_method(lines)
					M_Trig_ASR_only_Lj_sub_log_reset_mode.set_mode(sheet_name, app_name0)
					M_Trig_ASR_only_Lj_sub_log_reset_mode.run_log_analysis(lines)
					M_Trig_ASR_only_Lj_sub_log_reset_mode.end_of_log()#(True)
					excel_class.run_log_printing_mTRIG_and_sTrigmASR(M_Trig_ASR_only_Lj_sub_log_reset_mode.results_dict,sheet_name,Dict_Name, delay_type)
		elif test_type == 'LONG_TALKS':
			if delay_type.lower() == "multi_trig" or delay_type.lower() == "m-trig" or delay_type.lower() == "multi-trig" or delay_type.lower() == "m_trig":
				mTrig = True
			else:
				mTrig = False

			if 'LJ' in environment_board:
				if (app_name0 == app_name1) and (app_name0 != 'none'):
					# reset mode
					sheet_name = get_SheetName(app_name0, environment_board, test_type, 'Counter 0',mTrig)
					Trig_LJ_Long_Talks_sub_log_reset_mode = multi_Trig_LongTalks(txt_file_path)
					lines = Trig_LJ_Long_Talks_sub_log_reset_mode.get_lines_from_text_file()
					Trig_LJ_Long_Talks_sub_log_reset_mode.get_header_param_JBX_method(lines)
					Trig_LJ_Long_Talks_sub_log_reset_mode.set_mode("reset mode", app_name0)
					Trig_LJ_Long_Talks_sub_log_reset_mode.run_log_analysis(lines)
					Trig_LJ_Long_Talks_sub_log_reset_mode.end_of_log()
					excel_class.run_log_printing_LONG_TALKS(Trig_LJ_Long_Talks_sub_log_reset_mode.results_dict, sheet_name)


				else:
					if app_name0 != 'none':
						if 'lj' in environment_board.lower() and ('uart' in environment_board.lower() or 'serial' in environment_board.lower()):
							Counter_Name = 'Counter 0'
						else:
							Counter_Name = app_name0
						sheet_name = get_SheetName(Counter_Name, environment_board, test_type, 'Counter 0',mTrig)
						Trig_LJ_Long_Talks_sub_log_counter0 = multi_Trig_LongTalks(txt_file_path)
						lines = Trig_LJ_Long_Talks_sub_log_counter0.get_lines_from_text_file()
						Trig_LJ_Long_Talks_sub_log_counter0.get_header_param_JBX_method(lines)
						Trig_LJ_Long_Talks_sub_log_counter0.set_mode("counter0 only", app_name0)

						Trig_LJ_Long_Talks_sub_log_counter0.run_log_analysis(lines, Dict_Name)
						Trig_LJ_Long_Talks_sub_log_counter0.end_of_log()
						excel_class.run_log_printing_LONG_TALKS(Trig_LJ_Long_Talks_sub_log_counter0.results_dict, sheet_name)

					if app_name1 != 'none':
						sheet_name = get_SheetName(app_name1, environment_board, test_type, 'Counter 1',mTrig)
						Trig_LJ_Long_Talks_sub_log_counter1 = multi_Trig_LongTalks(txt_file_path)
						lines = Trig_LJ_Long_Talks_sub_log_counter1.get_lines_from_text_file()
						Trig_LJ_Long_Talks_sub_log_counter1.get_header_param_JBX_method(lines)
						Trig_LJ_Long_Talks_sub_log_counter1.set_mode("counter1 only", app_name1)

						Trig_LJ_Long_Talks_sub_log_counter1.run_log_analysis(lines, Dict_Name)
						Trig_LJ_Long_Talks_sub_log_counter1.end_of_log()
						excel_class.run_log_printing_LONG_TALKS(Trig_LJ_Long_Talks_sub_log_counter1.results_dict, sheet_name)
			if 'UART' in environment_board or 'serial' in environment_board.lower():
				sheet_name = get_SheetName(app_name0, environment_board, test_type, 'None',mTrig)
				if not mTrig:
					Trig_UART_Long_Talks_sub_log =TrigASRLog_LongTalks(txt_file_path)
				else:
					Trig_UART_Long_Talks_sub_log = multi_Trig_LongTalks(txt_file_path)
				lines = Trig_UART_Long_Talks_sub_log.get_lines_from_text_file()
				Trig_UART_Long_Talks_sub_log.get_header_param_JBX_method(lines)
				Trig_UART_Long_Talks_sub_log.set_mode(sheet_name, app_name0)
				Trig_UART_Long_Talks_sub_log.run_log_analysis(lines,Dict_Name)
				Trig_UART_Long_Talks_sub_log.end_of_log()
				excel_class.run_log_printing_LONG_TALKS(Trig_UART_Long_Talks_sub_log.results_dict, sheet_name)
		elif test_type == "VAD":
			print("test type to be parssed is VAD")
			if 'UART' in environment_board or 'serial' in environment_board.lower():
				if app_name0 != 'none':
					Counter_Name = 'Counter 0'
					sheet_name = get_SheetName(Counter_Name, environment_board, test_type, 'Counter 0')
					VAD_UART0_sub_log = TrigLog(txt_file_path, sheet_name)
				if app_name1 != 'none':
					Counter_Name = 'Counter 1'
					sheet_name = get_SheetName(Counter_Name, environment_board, test_type, 'Counter 1')
					VAD_UART1_sub_log = TrigLog(txt_file_path, sheet_name)

	excel_class.save_workbook()

	print("\n\n\nthe file:  {}  has been created!".format(excel_class.get_new_wb_name()))
	print("{} log text files were processed ".format(LogFile.num_of_headers))
	print("{} logs run successfully".format(LogFile.num_of_logs))


def get_SheetName(app_name,environment_board,test_type,counter_name, mTrig=False):

		if 'com' in app_name.lower():
			if 'UART' in environment_board:
				sheet_name = "UART"
			elif 'serial' in environment_board.lower():
				sheet_name = "Serial"
		elif counter_name != 'None':
			sheet_name = counter_name
		else:
			sheet_name = 'ERROR: Unknown Sheet name for ' +app_name + ', ' + environment_board + ', ' + test_type
		if test_type == 'DYNAMIC_RANGE':
			sheet_name = sheet_name + ' DR'
		if mTrig:
			sheet_name = sheet_name + ' mTrig'
		return sheet_name

if __name__ == "__main__":
	main()
