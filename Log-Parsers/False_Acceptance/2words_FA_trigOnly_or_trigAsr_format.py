import glob
import re
import openpyxl
import os
import shutil
import sys
import distutils.dir_util
import fnmatch
from os.path import basename
#in_folder = "C:\PythonProjects\ok_google_2words_FA\Logs_directory"
import datetime
import copy

#fname = 'OK_Google_Fixed1Sept_FA_2Words.txt'

def num_to_excel_alphabeit_colms(index_num):
	cal1 = index_num % 27
	cal2 = index_num // 26
	new = index_num - cal2*26
	if new==0:
		new=26
		cal2-=1
	if cal2:
		mychar = chr(cal2 + 64) + chr(new + 64)
	else: mychar = chr(index_num+64)
	return mychar

def creat_new_excel_from_template_with_name_and_datetime():
	program_path = os.path.dirname(sys.argv[0])
	template_path = program_path + '\\template\exl.xlsx'
	project_name = "exl_FA_"
	shutil.copy2(str(template_path), str(program_path))
	date_time = datetime.datetime.strftime(datetime.datetime.now(), '_%Y-%m-%d__%H_%M_%S')
	exl_file_name = str(project_name) + str(date_time) + ".xlsx"
	os.rename("exl.xlsx", str(exl_file_name))
	return str(exl_file_name)

def Read_header(lines,results_dict_ST_header_arg):
	noise_dict = {"Babble-20kHz-2min": "Babble", "cafeteria_mono_150s": "cafeteria", "Crossroads": "Crossroads",
				  "Headset_Car80_Noise": "h1_car80", "Headset_Office_Noise": "h1_Office",
				  "Speakerphone_Car80_Noise": "SPH_car80",
				  "Speakerphone_Office_noise": "SPH_Office", "street": "street", "Wind_1ms": "Wind_1ms",
				  "Wind_2ms": "Wind_2ms",
				  "Wind_3ms": "Wind_3ms", "Wind_4ms": "Wind_4ms", "Wind_5ms": "Wind_5ms"}

	results_dict_ST_header = dict(results_dict_ST_header_arg)
	Test_description_flag = files_in_test_flag = list_of_wavs_flag = 0


	for line in range(len(lines)):
		if "Test type: " in lines[line]:
			false_type = lines[line].split("Test type: ")
			results_dict_ST_header["Test_type"] = false_type[1].rstrip('\r\n')

		if "Test description:" in lines[line]:
			if Test_description_flag == 0:
				test_description = lines[line].split("Test description:")
				test_description = test_description[1].rstrip('\r\n')
				if "vol: " in test_description:
					test_description = test_description.split("vol: ")
				else: test_description = test_description.split("vol - ")
				results_dict_ST_header["noise_type"] = test_description[0].rstrip('.wav')
				results_dict_ST_header["noise_db"] = test_description[1]
				#results_dict_ST_header["noise_type"] = get_right_noise_type(results_dict_ST_header["noise_type"])
				Test_description_flag = 1

		if "list of wavs: " in lines[line]:
			if list_of_wavs_flag == 0:
				list_of_wavs = lines[line].split("list of wavs: ")
				results_dict_ST_header["list_of_wavs"] = list_of_wavs[1].rstrip('\r\n')
				list_of_wavs_flag = 1

		if "signal db is: " in lines[line]:
			try:
				r = re.search("-?\d{1,2}\.\d", lines[line])
				results_dict_ST_header["signal_db"] = r.group()
			except:
				try:
					r = re.search("\d+", lines[line])
					results_dict_ST_header["signal_db"] = r.group()
				except: results_dict_ST_header["signal_db"] = 'None'

		if "asr delay time is: " in lines[line]:
			r = re.search("\d+", lines[line])
			results_dict_ST_header["asr_delay_time"] = r.group()

		'''
		if " files in test" in lines[line]:
			if files_in_test_flag == 0:
				r = re.search("\d+", lines[line])
				results_dict_ST_header["num_of_files"] = r.group()
				files_in_test_flag = 1
		'''
		if "command line:" in lines[line]:
			if "MP" in lines[line]:
				results_dict_ST_header["is_MP"] = True
		if "Starting to play wav files" in lines[line]:
			line += 1
			break

	return results_dict_ST_header,line


def if_arg_is_directory_join_to_one_file(dir_path):
	if 'joined_fa_file.txt' in os.listdir(dir_path):
		os.remove(dir_path+'//'+'joined_fa_file.txt')

	is_first_file = 1

	outfile_path = dir_path+'\\'+'joined_fa_file_tmp.txt'
	outfile  =open(outfile_path,'w')
	for fname in os.listdir(dir_path):
		if fname == 'joined_fa_file_tmp.txt':
			continue

		elif not is_first_file:
			f = open(dir_path+'//'+fname, 'rb')
			lines = f.readlines()
			copy_lines = 0
			for i in xrange(15,len(lines)):
				line = lines[i]
				if copy_lines:
					# outfile.write(line+'\n')
					outfile.write(line)
				elif ('playing' and 'file') in line.lower():
					copy_lines=1
					# outfile.write(line + '\n')
					outfile.write(line)
			f.close()
		else:
			f = open(dir_path+'//'+fname, 'rb')
			outfile.write(f.read())
			is_first_file = 0
			f.close()

	outfile.close()
	outfile_path_final = dir_path + '\\' + 'joined_fa_file.txt'
	with open(outfile_path) as infile, open(outfile_path_final, 'w') as outfile_final:
		for line in infile:
			if not line.strip(): continue  # skip the empty line
			outfile_final.write(line)  # non-empty line. Write it to output

	if 'joined_fa_file_tmp.txt' in os.listdir(dir_path):
		os.remove(outfile_path)

	return outfile_path_final







fname = sys.argv[1]
if os.path.isdir(fname):
	fname=if_arg_is_directory_join_to_one_file(fname)
f = open(fname, 'rb')
lines = f.readlines()

new_excel = creat_new_excel_from_template_with_name_and_datetime()
wb = openpyxl.load_workbook(str(new_excel))
sheet=wb.get_sheet_by_name('FA')
sheet_final=wb.get_sheet_by_name('FA_final')
sheet_unknown=wb.get_sheet_by_name('FA_unknown')
sheet_files_review = wb.get_sheet_by_name('files_review')
sheet_files_review_one_list = wb.get_sheet_by_name('files_review_one_list')

cmd_count_dict={}
cmd_recognition=0
line=0

results_dict_ST_header = {"log_file_name": "", "noise_type": "", "signal_db": "", "asr_delay_time": "",
							  "noise_db": "", "Test_type": "", "list_of_wavs": "", "check_flag" : 0,"is_MP" : False}


results_dict_ST_header, line = Read_header(lines, results_dict_ST_header)

test_mode="trig_only"

curr_trig="None"
line_check=line
is_trig_last=""
flag=0
is_trig_curr = 'playing trig file'
# while flag<20:
# 	line_r = lines[line_check].lower()
# 	if "playing trig file " in line_r:
#
# 		is_trig_curr = line_r.split("playing trig file ")[1].rstrip('\r\n')
# 		if is_trig_curr==is_trig_last:
# 			test_mode="trig_asr"
# 			flag=10
# 			break
# 		else:
# 			is_trig_last = is_trig_curr
# 			is_trig_curr = ""
# 		flag += 1
# 		line_check+=6
# 	else:
# 		flag+=1
# 		line_check += 1

for i in xrange(1,30):
	if ('command line' in lines[i].lower()) and ('trig/asr' in lines[i].lower()):
		test_mode = 'trig_asr'
		break





if test_mode=="trig_asr":
	line_check=line
	fa_subtitution = 'None'
	# empty1,empty2,empty3,empty4,empty5,empty6,empty7,empty8,empty9,empty10 = 'play music','power off','empty3','empty4','empty5','empty6','empty7','empty8','empty9','empty10'
	empty1, empty2, empty3, empty4, empty5, empty6, empty7, empty8, empty9, empty10 = 'empty1', 'empty2', 'empty3', 'empty4', 'empty5', 'empty6', 'empty7', 'empty8', 'empty9', 'empty10'

	sub_dict= {'None' : 0, empty1 : 0 ,empty2 : 0,empty3 : 0,empty4 : 0,empty5 : 0,empty6 : 0,empty7 : 0,empty8 : 0,empty9 : 0,empty10 : 0}
	# print line
	while 1:
		# line_ch = lines[line]
		try:
			my_line = lines[line]
			#print(str(line))
		except: break
		if line >= (len(lines) - 2): #Reached EOF
			print "this last line: " + str(line)
			#print(lines[line])
			break

		elif is_trig_curr in lines[line].lower(): #line contains Trigger played
			# if line == 28438:
			# if '_0118.wav' in lines[line + 2]:
				# print 'yey'
				# print(cmd_count_dict["empty0118.wav"][0])
				#print(lines[line + 2])
			if ("Recognized! - LJ- Trigger" in lines[line + 1]) or ("Recognized! Hey Jabra" in lines[line + 1]) or ("Recognized! - Trigger" in lines[line + 1]):
				# print(str(line) +": "+ lines[line])
				try:
					r = re.search("_\d{4}.wav", lines[line + 2])
				except: r=0
				if r:
					curr_cmd = "empty" + r.group().strip('_')
					if (len(lines)> line + 3):
						if ("No Recognition" in lines[line + 3]) or ("Recognized! Unrecognized" in lines[line + 3]):
							cmd_recognition = 0
						elif "Recognized!" in lines[line + 3] or "undefined!" in lines[line + 3]:
							cmd_recognition = 1
							try:
								r=re.search("empty\d+", lines[line + 3] )
								fa_subtitution =  r.group()
							except:
								fa_subtitution = 'None'
							if fa_subtitution == 'None':
								try:
									for tmp_str in sub_dict:
										if tmp_str in lines[line + 3].lower():
											fa_subtitution = tmp_str
											break
								except:
									fa_subtitution = 'None'
					else:
						cmd_recognition = 0


					if curr_cmd in cmd_count_dict:
						cmd_count_dict[curr_cmd][0]=cmd_count_dict[curr_cmd][0] + 1
						cmd_count_dict[curr_cmd][1] = cmd_count_dict[curr_cmd][1] + cmd_recognition
						cmd_count_dict[curr_cmd][2][fa_subtitution] += 1
					else:
						cmd_count_dict[curr_cmd] = [1, cmd_recognition, sub_dict]
						cmd_count_dict[curr_cmd][0] = 1
						cmd_count_dict[curr_cmd][1] = cmd_recognition
						cmd_count_dict[curr_cmd][2] = copy.deepcopy(sub_dict)
						cmd_count_dict[curr_cmd][2][fa_subtitution] += 1
					if '_0118.wav' in lines[line + 2]:
						print("Line # is:" + str(line) + " " + str(cmd_count_dict[curr_cmd][0]))
				else:
					print("Phrase unknown: " +lines[line + 2])
				if cmd_recognition == 0:
					line += 3
				else:
					line += 4
				cmd_recognition = 0
				fa_subtitution = 'None'
			else: #Trigger was played but not recognized.  skip until the next playing trig is found
				line +=1
		else: #Check the next line
			line += 1



#curr_counter = 'counter 0'

# play_file_string = "playing file"
play_file_string = "playing trig file"


# curr_counter = 'counter1'

curr_counter = 'serial'

end_of_file = 0
recognized_files_dict = {}
if test_mode=="trig_only":
	for line in range(len(lines) - 1):
		line1 = lines[line]

		if play_file_string in lines[line].lower():
			n = lines[line].rfind('_')
			# if "27.197" in lines[line].lower():
			# 	print "stop"
			curr_cmd = 'empty' + lines[line][n + 1:-2]
			try:
				curr_cmd=curr_cmd.replace('\r','')
			except:
				pass
			cnt_line=0
			while True:
				cnt_line+=1
				try:

					if play_file_string in lines[line + cnt_line].lower():

						if cnt_line==1:
							cmd_recognition = 0
							break
						else:
							cnt_line -= 1
							break
				except:
					end_of_file = 1
					break



			if not end_of_file:
				for k in xrange(1,cnt_line+1):
					if (("recognized!" in lines[line + k].lower()) or ("timeout" in lines[line + k].lower())) and (curr_counter in lines[line + k].lower()):
						cmd_recognition = 1
						curr_cmd_full_path = lines[line].lower().split(play_file_string+' ')
						curr_cmd_full_path = curr_cmd_full_path[1].strip('\n\r')
						if curr_cmd in recognized_files_dict.keys():
							recognized_files_dict[curr_cmd].append(curr_cmd_full_path)
						else:
							recognized_files_dict[curr_cmd] = [curr_cmd_full_path]

					# if (" timeout" in lines[line + k].lower()) :
					# 	cmd_recognition = 1
				if curr_cmd in cmd_count_dict:
					cmd_count_dict[curr_cmd] = [cmd_count_dict[curr_cmd][0] + 1,
												cmd_count_dict[curr_cmd][1] + cmd_recognition]
				else:
					cmd_count_dict[curr_cmd] = [1, cmd_recognition]
		cmd_recognition = 0



#writing header to FA_final sheet:
sheet_final['P2'] = fname
sheet_final['Q2'] = results_dict_ST_header["list_of_wavs"]
sheet_final['R2'] = results_dict_ST_header["asr_delay_time"]
sheet_final['S2'] = results_dict_ST_header["signal_db"]
sheet_final['T2'] = results_dict_ST_header["noise_type"]
sheet_final['U2'] = results_dict_ST_header["noise_db"]
sheet_final['V2'] = test_mode
sheet_final['W2'] = curr_trig

m=j=3 #just initialized counters
for i in range(3,357):
	key = sheet['A' + str(i)].value

	if key in cmd_count_dict:
		sheet['C' + str(i)] = cmd_count_dict[key][0]
		sheet['D' + str(i)] = cmd_count_dict[key][1]
		sheet_final['A' + str(j)]= key
		sheet_final['B' + str(j)] = sheet['B'+str(i)].value
		sheet_final['C' + str(j)] = cmd_count_dict[key][0]
		sheet_final['D' + str(j)] = cmd_count_dict[key][1]
		if len(cmd_count_dict[key]) >2: #This parameter is only relelvant for mode_type trig/ast!  safer to test this was rather than check the trig_mode
			sheet_final['F' + str(j)] = cmd_count_dict[key][2][empty1]
			sheet_final['G' + str(j)] = cmd_count_dict[key][2][empty2]
			sheet_final['H' + str(j)] = cmd_count_dict[key][2][empty3]
			sheet_final['I' + str(j)] = cmd_count_dict[key][2][empty4]
			sheet_final['J' + str(j)] = cmd_count_dict[key][2][empty5]
			sheet_final['K' + str(j)] = cmd_count_dict[key][2][empty6]
			sheet_final['L' + str(j)] = cmd_count_dict[key][2][empty7]
			sheet_final['M' + str(j)] = cmd_count_dict[key][2][empty8]
			sheet_final['N' + str(j)] = cmd_count_dict[key][2][empty9]
			sheet_final['O' + str(j)] = cmd_count_dict[key][2][empty10]
		j+=1
		del cmd_count_dict[key]

for  key in cmd_count_dict:

	sheet_unknown['A' + str(m)] = key
	sheet_unknown['C' + str(m)] = cmd_count_dict[key][0]
	sheet_unknown['D' + str(m)] = cmd_count_dict[key][1]
	m += 1



col = 2
for key in recognized_files_dict:
	row = 3
	curr_key = recognized_files_dict[key]
	l_col = num_to_excel_alphabeit_colms(col)
	sheet_files_review[l_col + str(row)] = str(key)
	for name in curr_key:
		row+=1
		sheet_files_review[l_col + str(row)] = str(name)

	col+=1


row = 3
for key in recognized_files_dict:
	curr_key = recognized_files_dict[key]
	for name in curr_key:
		sheet_files_review_one_list['B'+str(row)]=str(name)
		row+=1


f.close()
wb.save(str(new_excel))
print ('\n\n\nthe file:  ' +str(new_excel)+ '   has been created!')

