# import  my_log_classes
from utils import Utils, ExcelHandler
from my_log_classes import LogFile
from templates_data import *
from LJ_classes import TrigLabJackLog_LJ, TrigASRLabJackLog_LJ,TrigASRLabJackLog_LJ_LongTalks
from MP_classes import TrigASRMobilPhoneLog_MP

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
		test_type = curr_log.header_dict['TRIG\ASR'].upper()
		environment_board = curr_log.header_dict['environment_board'].upper()
		if environment_board == 'EB' or environment_board.lower() == 'listener':
			environment_board = 'LJ'
		app_name0, app_name1 = curr_log.header_dict['counter0'].lower(), curr_log.header_dict['counter1'].lower()
		app_name0, app_name1 = app_name0.replace('"',''), app_name1.replace('"','')
		# if ('long_talks' in app_name0.lower()) or ('long_talks' in app_name1.lower()):
		# test_type = 'LONG_TALKS'
		if ('long_talks' in app_name0.lower()) or ('long_talks' in app_name1.lower()):
			test_type = 'LONG_TALKS'
		if 'MP' in environment_board:
			print('mp~!!!!!!!!')
			Trig_MP_sub_log = TrigASRMobilPhoneLog_MP(txt_file_path)
			lines = Trig_MP_sub_log.get_lines_from_text_file()
			Trig_MP_sub_log.get_header_param_JBX_method(lines)
			Trig_MP_sub_log.run_log_analysis(lines)
			Trig_MP_sub_log.end_of_log()
			print("yey")
			if len(sorted_list)==1:
				excel_class.run_log_printing_TRIG_ASR_MP(Trig_MP_sub_log.results_per_trig_file['total'])
				excel_class.run_log_printing_TRIG_ASR_MP_one_log_only(Trig_MP_sub_log.results_per_trig_file)
			else:
				excel_class.run_log_printing_TRIG_ASR_MP(Trig_MP_sub_log.results_per_trig_file['total'])

		if  test_type=='TRIG'  or test_type == 'TRIGGER_ONLY' :

			if 'LJ' in environment_board:

				if (app_name0 == app_name1) and (app_name0 != 'none'):
					#reset mode
					Trig_LJ_sub_log_reset_mode = TrigLabJackLog_LJ(txt_file_path)
					lines = Trig_LJ_sub_log_reset_mode.get_lines_from_text_file()
					Trig_LJ_sub_log_reset_mode.get_header_param_JBX_method(lines)
					Trig_LJ_sub_log_reset_mode.set_mode("reset mode", app_name0)
					Trig_LJ_sub_log_reset_mode.run_log_analysis(lines)
					Trig_LJ_sub_log_reset_mode.end_of_log()
					excel_class.run_log_printing_TRIG_ONLY(Trig_LJ_sub_log_reset_mode.results_dict)


				else:
					if app_name0 != 'none':
						Trig_LJ_sub_log_counter0 = TrigLabJackLog_LJ(txt_file_path)
						lines = Trig_LJ_sub_log_counter0.get_lines_from_text_file()
						Trig_LJ_sub_log_counter0.get_header_param_JBX_method(lines)
						Trig_LJ_sub_log_counter0.set_mode("counter0 only", app_name0)
						if Trig_LJ_sub_log_counter0.header_dict['trigger_phrase'] == 'Jabra_old2':
							Trig_LJ_sub_log_counter0.header_dict['trigger_phrase'] = 'hey jabra'
						elif Trig_LJ_sub_log_counter0.header_dict['trigger_phrase'].lower() == 'google_old':
							Trig_LJ_sub_log_counter0.header_dict['trigger_phrase'] = 'ok google'
						Trig_LJ_sub_log_counter0.run_log_analysis(lines)
						Trig_LJ_sub_log_counter0.end_of_log()
						excel_class.run_log_printing_TRIG_ONLY(Trig_LJ_sub_log_counter0.results_dict)


					if app_name1 != 'none':
						Trig_LJ_sub_log_counter1 = TrigLabJackLog_LJ(txt_file_path)
						lines = Trig_LJ_sub_log_counter1.get_lines_from_text_file()
						Trig_LJ_sub_log_counter1.get_header_param_JBX_method(lines)
						Trig_LJ_sub_log_counter1.set_mode("counter1 only", app_name1)
						Trig_LJ_sub_log_counter1.run_log_analysis(lines)
						Trig_LJ_sub_log_counter1.end_of_log()
						excel_class.run_log_printing_TRIG_ONLY(Trig_LJ_sub_log_counter1.results_dict)

		elif  test_type == 'TRIG/ASR' :
			if 'LJ' in environment_board:

				if (app_name0 == app_name1) and (app_name0 != 'none'):
					# reset mode
					Trig_ASR_Lj_sub_log_reset_mode = TrigASRLabJackLog_LJ(txt_file_path)
					lines = Trig_ASR_Lj_sub_log_reset_mode.get_lines_from_text_file()
					Trig_ASR_Lj_sub_log_reset_mode.get_header_param_JBX_method(lines)
					Trig_ASR_Lj_sub_log_reset_mode.set_mode("reset mode", app_name0)
					Trig_ASR_Lj_sub_log_reset_mode.run_log_analysis(lines)
					Trig_ASR_Lj_sub_log_reset_mode.end_of_log()
					excel_class.run_log_printing_TRIG_ONLY(Trig_ASR_Lj_sub_log_reset_mode.results_dict)


				else:
					if app_name0 != 'none':
						Trig_ASR_Lj_sub_log_counter0 = TrigASRLabJackLog_LJ(txt_file_path)
						lines = Trig_ASR_Lj_sub_log_counter0.get_lines_from_text_file()
						Trig_ASR_Lj_sub_log_counter0.get_header_param_JBX_method(lines)
						Trig_ASR_Lj_sub_log_counter0.set_mode("counter0 only", app_name0)
						# for key in Trig_ASR_Lj_sub_log_counter0.results_dict:
						# 	print '{}: {}'.format(key,Trig_ASR_Lj_sub_log_counter0.results_dict[key])


						Trig_ASR_Lj_sub_log_counter0.run_log_analysis(lines)
						Trig_ASR_Lj_sub_log_counter0.end_of_log()
						excel_class.run_log_printing_LJ_sTRIG_mASR(Trig_ASR_Lj_sub_log_counter0.results_dict)

					if app_name1 != 'none':
						Trig_ASR_Lj_sub_log_counter1 = TrigASRLabJackLog_LJ(txt_file_path)
						lines = Trig_ASR_Lj_sub_log_counter1.get_lines_from_text_file()
						Trig_ASR_Lj_sub_log_counter1.get_header_param_JBX_method(lines)
						Trig_ASR_Lj_sub_log_counter1.set_mode("counter1 only", app_name1)
						Trig_ASR_Lj_sub_log_counter1.run_log_analysis(lines)
						Trig_ASR_Lj_sub_log_counter1.end_of_log()
						excel_class.run_log_printing_TRIG_ONLY(Trig_ASR_Lj_sub_log_counter1.results_dict)

		elif test_type == 'LONG_TALKS':
			if (app_name0 == app_name1) and (app_name0 != 'none'):
				# reset mode
				Trig_LJ_Long_Talks_sub_log_reset_mode = TrigASRLabJackLog_LJ_LongTalks(txt_file_path)
				lines = Trig_LJ_Long_Talks_sub_log_reset_mode.get_lines_from_text_file()
				Trig_LJ_Long_Talks_sub_log_reset_mode.get_header_param_JBX_method(lines)
				Trig_LJ_Long_Talks_sub_log_reset_mode.set_mode("reset mode", app_name0)
				Trig_LJ_Long_Talks_sub_log_reset_mode.run_log_analysis(lines)
				Trig_LJ_Long_Talks_sub_log_reset_mode.end_of_log()
				excel_class.run_log_printing_LONG_TALKS(Trig_LJ_Long_Talks_sub_log_reset_mode.results_dict)


			else:
				if app_name0 != 'none':
					Trig_LJ_Long_Talks_sub_log_counter0 = TrigASRLabJackLog_LJ_LongTalks(txt_file_path)
					lines = Trig_LJ_Long_Talks_sub_log_counter0.get_lines_from_text_file()
					Trig_LJ_Long_Talks_sub_log_counter0.get_header_param_JBX_method(lines)
					Trig_LJ_Long_Talks_sub_log_counter0.set_mode("counter0 only", app_name0)

					Trig_LJ_Long_Talks_sub_log_counter0.run_log_analysis(lines)
					Trig_LJ_Long_Talks_sub_log_counter0.end_of_log()
					excel_class.run_log_printing_LONG_TALKS(Trig_LJ_Long_Talks_sub_log_counter0.results_dict)

				if app_name1 != 'none':
					Trig_LJ_Long_Talks_sub_log_counter1 = TrigASRLabJackLog_LJ_LongTalks(txt_file_path)
					lines = Trig_LJ_Long_Talks_sub_log_counter1.get_lines_from_text_file()
					Trig_LJ_Long_Talks_sub_log_counter1.get_header_param_JBX_method(lines)
					Trig_LJ_Long_Talks_sub_log_counter1.set_mode("counter1 only", app_name1)

					Trig_LJ_Long_Talks_sub_log_counter1.run_log_analysis(lines)
					Trig_LJ_Long_Talks_sub_log_counter1.end_of_log()
					excel_class.run_log_printing_LONG_TALKS(Trig_LJ_Long_Talks_sub_log_counter1.results_dict)


	excel_class.save_workbook()

	print("\n\n\nthe file:  {}  has been created!".format(excel_class.get_new_wb_name()))
	print("{} log text files were processed ".format(LogFile.num_of_headers))
	print("{} logs run successfully".format(LogFile.num_of_logs))


if __name__ == "__main__":
	main()
