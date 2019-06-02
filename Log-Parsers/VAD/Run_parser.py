import sys
import os
from scipy.io import wavfile
import my_time_utils as time
from excel_utils import ExcelHandler, EXCEL_FILE_NAME, SCRIPT1_TEMPLATE
import contextlib
import wave
import copy

#Global constants
SILENT = 0
SPEAKING = 1
BUFFER_SIZE_MILLISECONDS = 240
MILLISECOUNDS_RESOLUTION = 10
CLOSING_LATENCY_EXPECTED = 3
##################################

class parse_wav_to_timestamps():
	def __init__(self,file_path):
		self.filepath = file_path


	def read_wav_to_signed_short_buffer(self, file_path):
		file_path = file_path.strip("\n")
		try:
			fs, data = wavfile.read(file_path)
			return data
		except:
			print("Couldn't open file: " + file_path)
			return False

	def _get_noise_details(self, file_path):
		# print("parsing filename to get noise details")
		noise_name = ""
		potential_db = 0
		folder_name, file_name = os.path.split(file_path)
		if "babble" in file_name.lower():
			noise_name = "Babble"
		elif "car" in file_name.lower():
			noise_name = "Car"
		elif "office" in file_name.lower():
			noise_name = "Office"
		elif "pink" in file_name.lower():
			noise_name = "Pink"
		elif "white" in file_name.lower():
			noise_name = "White"
		elif "music" in file_name.lower():
			noise_name = "Music"
		elif "cafeteria" in file_name.lower():
			noise_name = "Cafeteria"
		else:
			noise_name = "Silence"

		if noise_name == "Silence":
			dB_level = 0
		else:
			noise_level_position_in_filename = file_name.lower().find("db")
			potential_db = file_name[noise_level_position_in_filename - 4:noise_level_position_in_filename]

			noise_level_position_in_filename = potential_db.find("_")
			if noise_level_position_in_filename > -1:
				if "+" in potential_db:
					dB_level = potential_db[noise_level_position_in_filename + 2:]
				elif "-" in potential_db:
					potential_db = potential_db[noise_level_position_in_filename + 2:]
					dB_level = int(potential_db) * -1
				else:
					dB_level = potential_db[noise_level_position_in_filename + 1:]
			else:
				print("dB level not found in filename: " + file_path)
				dB_level = 0
		return noise_name, dB_level


	def parse_file(self, file_path):
		# file_path = cmd_comands[1]  # "your full file path"
		data = self.read_wav_to_signed_short_buffer(file_path)
		noise_type, noise_level = self._get_noise_details(file_path)
		delta_t = 1.0 / 16000
		results = []
		opening_vad_time = 0
		closing_vad_time = 0
		voice_detected = False
		try:
			# results.append(file_path)
			file_path_parts = file_path.split("\\")
			results.append("Folder Name: " + file_path_parts[len(file_path_parts) - 2])
			results.append("File Name: " + file_path_parts[len(file_path_parts) - 1])
			# file_name_parts = file_path_parts[len(file_path_parts) - 1].strip(".wav").split("_")
			results.append("Noise Type: " + noise_type) #  file_name_parts[len(file_name_parts) - 2])
			results.append("Noise Level: " +  str(noise_level)) #  + file_name_parts[len(file_name_parts) - 1].strip("dB").strip("+"))
			results.append("File Length: " + time.milliseconds_to_timestamp((delta_t * len(data)*1000)))
			results.append("=======================================================================")

			# print(str(len(data)))
			for i in range(len(data)):
				# print(str(i))
				if data[i] < 0:
					closing_vad_time = 0
					if opening_vad_time == 0:
						opening_vad_time = i * delta_t
					if data[i] < -30000 and voice_detected == False:
						voice_detected = True
						opening_vad_timestamp = time.calculate_time_stamp(opening_vad_time)
						results.append(opening_vad_timestamp + ', Voice Started')
						# print(opening_vad_timestamp + ', Voice Started')
				elif data[i] > 0:
					opening_vad_time = 0
					if closing_vad_time == 0:
						closing_vad_time = i * delta_t
					if data[i] > 20000 and voice_detected == True:
						voice_detected = False
						results.append(time.calculate_time_stamp(closing_vad_time) + ', Voice Ended')
						# print(time.calculate_time_stamp(closing_vad_time) + ', Voice Ended')

			total_file_time = i * delta_t
			self.write_results_to_file(results,file_path, total_file_time)
			return results
		except:
			print("ERROR parsing file: " + file_path + " at line:" + str(i))


	def get_results_file_path(self,filepath):
		folderpath, filename = os.path.split(filepath)
		results_filename = filename.replace(".wav","_.txt")
		return folderpath, results_filename

	def write_results_to_file(self,results,filepath,total_file_time):
		folderpath, results_filename = self.get_results_file_path(filepath)
		outputfilepath = os.path.join(folderpath,results_filename)
		outputfile = open(outputfilepath.strip("\n"), "w+")


		for timestamp in results:
			outputfile.write(timestamp + "\n")
		# outputfile.write(time.calculate_time_stamp(total_file_time) + ", Total time\n")
		outputfile.close()


class compare_results_to_template_new():


	def __init__(self, file_path):
		self.filepath = file_path
		self.template_voice_state = SILENT  # SILENT or SPEAKING
		self.VAD_open = False
		self.all_close_laitencies = []
		self.all_open_laitencies = []

    #
	# def _calculate_open_vad_laitency(self, speach_started_milliseconds, vad_opened_milliseconds):
	# 	VAD_open_time = vad_opened_milliseconds - speach_started_milliseconds
	# 	if VAD_open_time > 0:
	# 		self.all_open_laitencies.append(VAD_open_time)
	# 	else:
	# 		print("ERROR: VAD Open laitency Can't be negative or zero!")
    #
    #
	# def _calculate_close_vad_laitency(self,speach_ended_milliseconds,vad_closed_milliseconds):
	# 	VAD_closed_Time = vad_closed_milliseconds - speach_ended_milliseconds
	# 	if VAD_closed_Time > 0:
	# 		self.all_close_laitencies.append(VAD_closed_Time)
	# 	else:
	# 		print("ERROR: VAD close laitency can't be negative")
    #
    #
	# def _state_VAD_listening_During_Silence(self,start_listening_milisecounds,end_listening_miliseconds):
	# 	# print("Speach detected FA")
    #
	# 	# start_listening_milisecounds = time.timestamp_to_milliseconds(end_listening_timestamp)
	# 	# end_listening_miliseconds = time.timestamp_to_milliseconds(start_listening_timestamp)
	# 	vad_open_duration = end_listening_miliseconds - start_listening_milisecounds
	# 	if vad_open_duration >= 0:
	# 		self.results_data["FA_Listening_count"] += 1
	# 		self.results_data["total_FA_Listening"] +=  vad_open_duration
	# 	else:
	# 		print("ERROR: amount of time VAD is open must be positive")
    #
    #
	# def _state_VAD_NOT_listening_During_Speach(self,stop_listening_time,start_listening_time):
	# 	stop_listening_milliseconds = time.timestamp_to_milliseconds(stop_listening_time)
	# 	start_listening_milliseconds = time.timestamp_to_milliseconds(start_listening_time)
	# 	vad_closed_duration = start_listening_milliseconds - stop_listening_milliseconds
	# 	if vad_closed_duration >= 0:
	# 		self.results_data["FA_Not_Listening_count"] += 1
	# 		self.results_data["total_FA_not_Listening"] += vad_closed_duration
	# 	else:
	# 		print("ERROR:  Duration of vad being closed must be positive")

	def __compare_lists_for_debug(self,template_map,results_map,length_of_wav):
		excel_workbook = ExcelHandler(EXCEL_FILE_NAME+"_Debug")
		excel_workbook.run_debug_printing(template_map,results_map,MILLISECOUNDS_RESOLUTION,length_of_wav)

		excel_workbook.save_workbook()

	def get_header(self,line):
		header_dict = {"File Name": "", "File Length": "", "Noise Type": "", "Noise Level": 0}
		file_path = line.split("FROM ")[1].strip(" \n\r\t")
		fname = file_path[file_path.rfind('\\'):].strip(" \\")
		# header_dict["File Name"] = fname
		self.results_header["File_Name"] = fname
		'''find "Noise Type"'''
		noises_list = ["Cafeteria", "Car", "Music", "Office", "Pink"]
		for n in noises_list:
			if n.lower() in fname.lower():
				noise = n
				break
		# header_dict["Noise Type"] = noise
		self.results_header["Noise_Type"] = noise
		'''find "Noise Level"'''
		import re
		try:
			# header_dict["Noise Level"] = int(re.search("(\-\d+|\d+)(?=db)", fname.lower()).group())
			self.results_header["Noise_Level"] = int(re.search("(\-\d+|\d+)(?=db)", fname.lower()).group())
		except:
			print "cant find dB level"
			# header_dict["Noise Level"] = 99999
			self.results_header["Noise_Level"] = 99999

		'''find File Length in time_stamp format'''

		with contextlib.closing(wave.open(file_path, 'r')) as f:
			frames = f.getnframes()
			rate = f.getframerate()
			duration = frames / float(rate)
			h = int(duration / 3600)
			m = int((duration - h * 3600) / 60)
			s = float(duration - h * 3600 - m * 60)
			#header_dict["File Length"] = "{}:{}:{}".format(h, m, round(s, 3))
			self.results_header["File_Length"] = "{}:{}:{}".format(h, m, round(s, 3))
		# return header_dict

	def _state_VAD_listening_During_Silence_and_Speech(self,start_listening_timestamp, start_speach_timestmp, end_listening_timestamp):
		self.results_data["FA_Listening_count"] += 1
		start_listening_milisecounds = time.timestamp_to_milliseconds(start_listening_timestamp)
		start_speach_miliseconds = time.timestamp_to_milliseconds(start_speach_timestmp)
		end_listening_miliseconds = time.timestamp_to_milliseconds(end_listening_timestamp)

	def _map_timestamps(self,timestamps_list,starting_index = 0):
		timestamp_map = []
		index = starting_index
		template_map_time = 0
		expected_VAD = 1
		while index < len(timestamps_list):
			current_template_timestamp = timestamps_list[index].strip("\n")
			current_template_milisecounds = time.timestamp_to_milliseconds(current_template_timestamp)
			if expected_VAD == 1:
				expected_VAD = 0
			else:
				expected_VAD = 1
			while template_map_time <= current_template_milisecounds:
				timestamp_map.append(expected_VAD)
				template_map_time += MILLISECOUNDS_RESOLUTION
			index += 1
		return timestamp_map

	def compare_lists(self, results, template):
		index_template = 0
		index_results = 0
		results_EOF = False
		template_EOF = False
		self.all_close_laitencies = []
		self.all_open_laitencies = []
		max_close_laitency = 3500
		self.results_header = {"File_Path" : "", "File_Name" : "", "Noise_Type" : "", "Noise_Level" : 0, "File_Length" : ""}
		self.results_data = {"total_FA_Listening" : 0, "total_FA_not_Listening" : 0, "average_open_laitency" : 0,
							 "average_close_laitency" : 0, "FA_Listening_count" : 0, "FA_Not_Listening_count" : 0,
							 "vad_close_laitency" : {},"vad_open_laitency" : {}}

		# Read the header data from the results
		line_content = results[index_results].strip("\n")
		if line_content[:5] == "FROM ":
			if "frame" in results[index_results + 1]:
				self.get_header(line_content)

		if self.results_header["File_Name"] == "":
			while index_results <= (len(results) - 1) and not "=========" in line_content:
				if line_content != '':
					line_split = line_content.split(":")
					if len(line_split) > 2:  # Timestamps are split into parts and need to put back together
						line_split[1] = line_split[1] + ":" + line_split[2] + ":" + line_split[3]
					if len(line_split) > 1:
						self.results_header[line_split[0].replace(" ", "_")] = line_split[1]
					else:
						print("ERROR parsing header line, line=" + str(index_results) + line_content)
				index_results = index_results + 1
				if index_results < len(results):
					line_content = results[index_results].strip("\n")
				else:
					print"PROBLEM Reading header"
		print("comparing results from file: " + self.results_header["File_Name"])
		index_results = index_results + 1
		template_map = self._map_timestamps(template)
		test_results_map = self._map_timestamps(results, index_results)
		# self.__compare_lists_for_debug(template_map, test_results_map, self.results_header['File_Length'])
		index_compare_test_to_template = 6500/MILLISECOUNDS_RESOLUTION # skip the first 6.5 seconds of the results to avoide catching a false at the very begining caused by transient of background noise starting
		prev_template_state = 0
		calculate_laitency = False
		wav_length_Millisecounds = time.timestamp_to_milliseconds(self.results_header['File_Length'])
		while index_compare_test_to_template <= wav_length_Millisecounds:
			if len(template_map) > index_compare_test_to_template:
				current_template_result = template_map[index_compare_test_to_template]
			else:
				current_template_result = 0
			if len(test_results_map) > index_compare_test_to_template:
				current_test_result = test_results_map[index_compare_test_to_template]
			else:
				current_test_result = 0
			if index_compare_test_to_template >= 651:
				index_compare_test_to_template = index_compare_test_to_template
			if index_compare_test_to_template >= 3314:
				index_compare_test_to_template = index_compare_test_to_template
			if prev_template_state != current_template_result:
				if current_template_result != current_test_result or (current_template_result == current_test_result and current_test_result != prev_test_results_state):
					calculate_laitency = True
					index_template_state_change = index_compare_test_to_template
			if current_template_result != current_test_result:
				if current_template_result == 0:
					# FA_Listening_During_Silence += 100
					self.results_data["total_FA_Listening"] += MILLISECOUNDS_RESOLUTION
				else:
					# FA_NOT_Listening_During_Speach += 100
					self.results_data["total_FA_not_Listening"] += MILLISECOUNDS_RESOLUTION
			elif calculate_laitency == True and prev_test_results_state != current_test_result:
				laitency = (index_compare_test_to_template - index_template_state_change) * MILLISECOUNDS_RESOLUTION
				if current_test_result == 0:
					if laitency <= max_close_laitency:
						self.all_close_laitencies.append(laitency)
				else:
					self.all_open_laitencies.append(laitency)
				calculate_laitency = False
			prev_template_state = current_template_result
			prev_test_results_state = current_test_result
			index_compare_test_to_template += 1


		# while index_template <= len(template):
		# 	if index_template == len(template) and index_results == len(results):
		# 		break
		# 	if template[0] == "00:00:00.000":  # Parsing results with backgourn noise only.  there is no template of expected speach to xompare to.
		# 		while index_results <= (len(results) - 1):
		# 			self._state_VAD_listening_During_Silence(results[index_results],results[index_results + 1])
		# 			index_results = index_results + 2
		# 		# break
		# 	else:  # print("comparing actual results to excpected results")
		# 		if index_template < len(template):  # the loop will continue one iteration past the last expected result to make check for FA beyound the last end of speach
		# 			current_template_timestamp = template[index_template].strip("\n")
		# 		else:
		# 			template_EOF = True
		# 		while index_results <= len(results) - 1:  # make sure there are still more results to be parsed
		# 			current_results_timestamp = results[index_results].strip("\n")
		# 			# make sure the line is not empty
        #
		# 			while current_results_timestamp == "":  # make sure the row of results is not empty (normaly at the end of the header or end of the file of results there could be empty rows
		# 				index_results = index_results + 1
		# 				current_results_timestamp = results[index_results].strip("\n")
		# 			current_template_milisecounds = time.timestamp_to_milliseconds(current_template_timestamp)
		# 			current_results_milisecounds = time.timestamp_to_milliseconds(current_results_timestamp)
		# 			while current_results_milisecounds < 5500:  # make sure the row of results is not empty (normaly at the end of the header or end of the file of results there could be empty rows
		# 				index_results = index_results + 2
		# 				current_results_timestamp = results[index_results].strip("\n")
		# 				current_results_milisecounds = time.timestamp_to_milliseconds(current_results_timestamp)
		# 			if index_template + 1 <= len(template)-1:
		# 				next_template_timestamp = template[index_template + 1].strip("\n")
		# 			else:
		# 				next_template_timestamp = current_template_timestamp # self.results_header["File_Length"]
		# 				template_EOF = True
		# 				# self.template_voice_state = SILENT
		# 			next_template_milisecounds = time.timestamp_to_milliseconds(next_template_timestamp)
		# 			# if index_results == 29:
		# 			# 	index_results = index_results
		# 			if "started" in current_results_timestamp.lower() and "end" in current_template_timestamp.lower() and index_template + 1 < len(template)-1:
		# 				index_template += 1
		# 				current_template_timestamp = template[index_template].strip("\n")
		# 				current_template_milisecounds = time.timestamp_to_milliseconds(current_template_timestamp)
		# 				self.template_voice_state = SPEAKING
		# 			elif "end" in current_results_timestamp.lower() and "start" in current_template_timestamp.lower() and index_template + 1 < len(template)-1:
		# 				index_template += 1
		# 				current_template_timestamp = template[index_template].strip("\n")
		# 				current_template_milisecounds = time.timestamp_to_milliseconds(current_template_timestamp)
		# 				self.template_voice_state = SILENT
		# 			while current_results_milisecounds <= current_template_milisecounds or index_template >= len(template):  # loop through all the results untill speach should have started
		# 				# print("results index=" + str(index_results) + " Template Index=" + str(index_template) + "FA")
		# 				if index_results >=50 or index_template >=27:
		# 				 	print("ABOUT TO GET STUCK!")
		# 				if index_results + 1 >= len(results):
		# 					# print("next results timestamp can't be calculated")
		# 					index_results += 1
		# 					results_EOF = True
		# 					break
		# 				next_results_timestamp = results[index_results + 1].strip("\n")
		# 				next_results_milisecounds = time.timestamp_to_milliseconds(next_results_timestamp)
        #
		# 				if self.template_voice_state == SILENT:
		# 					if next_results_milisecounds < current_template_milisecounds or index_template >= len(template):
		# 						# both start and end of VAD are before the speech starts "current_template_milisecounds"
		# 						self._state_VAD_listening_During_Silence(current_results_milisecounds, next_results_milisecounds)
		# 					else:
		# 						if index_template + 1 < len(template):
		# 							next_template_timestamp = template[index_template + 1].strip("\n")
		# 							next_template_milisecounds = time.timestamp_to_milliseconds(next_template_timestamp)
		# 						else:
		# 							template_EOF = True
		# 						if next_results_milisecounds < next_template_milisecounds or template_EOF == True:
		# 							#VAD started before speach started but
		# 							#VAD closed after speach started AND before speach ended
		# 							##False listening is only until the point when speach starts and not untill the next result
		# 							self._state_VAD_listening_During_Silence(current_results_milisecounds, current_template_milisecounds)
		# 							index_template += 1
		# 							if index_template < len(template):
		# 								next_template_timestamp = template[index_template].strip("\n")
		# 								next_template_milisecounds = time.timestamp_to_milliseconds(next_template_timestamp)
		# 							else:
		# 								template_EOF = True
		# 						else:
		# 							# VAD started before speach started but
		# 							# VAD closed after speach ended
		# 							# **could be a number of speach block afterwards
		# 							self._state_VAD_listening_During_Silence(current_results_milisecounds, current_template_milisecounds)
		# 							if index_template < len(template) -1:
		# 								next_next_template_timestamp = results[index_results + 2].strip("\n")
		# 								next_next_template_milisecounds = time.timestamp_to_milliseconds(next_next_template_timestamp)
		# 								if next_results_milisecounds < next_next_template_milisecounds:
		# 									self._calculate_close_vad_laitency(next_template_milisecounds,next_results_milisecounds)
		# 							else:
		# 								template_EOF = True
		# 								print ("next next template is not available t=" + str(index_template) + " r=" + str(index_results))
		# 					index_results += 2
		# 				else:
		# 					if next_results_milisecounds < current_template_milisecounds:
		# 						# VAD stopped listening and started again during the current speach segment.
		# 						self._state_VAD_NOT_listening_During_Speach(current_results_timestamp, next_results_timestamp)
		# 						#self._state_VAD_NOT_listening_During_Speach(current_template_milisecounds, next_template_milisecounds)
		# 						index_results += 2
		# 					elif next_results_milisecounds < next_template_milisecounds:
		# 						# VAD started before speach started but
		# 						# VAD closed after speach started AND before speach ended
		# 						##False listening is only until the point when speach starts and not untill the next result
		# 						print("VAD closed during speach and only oppened again after speach ended but before next speach started")
		# 						#call NOT listening until the end of speach
		# 						self._state_VAD_NOT_listening_During_Speach(current_results_timestamp,
		# 																	current_template_timestamp)
		# 						index_results += 1
		# 						index_template += 1
		# 						# current_results_timestamp = results[index_results].strip("\n")
		# 						current_template_timestamp = template[index_template].strip("\n")
		# 						current_template_milisecounds = time.timestamp_to_milliseconds(current_template_timestamp)
		# 					else:
		# 						#  NOT listening from begining untill after end of speach segment
		# 						self._state_VAD_NOT_listening_During_Speach(current_template_timestamp, next_template_timestamp)
		# 						index_template += 2
		# 						if index_template < len(template)-1:
		# 							current_template_timestamp = template[index_template].strip("\n")
		# 							current_template_milisecounds = time.timestamp_to_milliseconds(current_template_timestamp)
		# 							next_template_timestamp = template[index_template + 1].strip("\n")
		# 							next_template_milisecounds = time.timestamp_to_milliseconds(next_template_timestamp)
		# 						elif index_template < len(template):
		# 							current_template_timestamp = template[index_template].strip("\n")
		# 							current_template_milisecounds = time.timestamp_to_milliseconds(current_template_timestamp)
		# 						else:
		# 							template_EOF = True
		# 							break
		# 				if index_results < len(results):
		# 					current_results_timestamp = results[index_results].strip("\n")
		# 					current_results_milisecounds = time.timestamp_to_milliseconds(current_results_timestamp)
		# 			if current_results_milisecounds < next_template_milisecounds or index_template == len(template)-1:
		# 				# print("results index=" + str(index_results) + " Template Index=" + str(index_template))
		# 				if index_results >= 50 or index_template >= 27:
		# 					print("ABOUT TO GET STUCK!")
		# 				if self.template_voice_state == SILENT:
		# 					self._calculate_open_vad_laitency(current_template_milisecounds, current_results_milisecounds)
		# 					self.template_voice_state = SPEAKING
		# 				else:
		# 					self._calculate_close_vad_laitency(current_template_milisecounds, current_results_milisecounds)
		# 					self.template_voice_state = SILENT
        #
		# 				index_results += 1
        #
		# 			elif results_EOF == False:
		# 				if self.template_voice_state == SILENT:
		# 					#VAD Skipped entire segment of speach (at least one)
		# 					self._state_VAD_NOT_listening_During_Speach(current_template_timestamp, next_template_timestamp)
		# 					index_template += 1
		# 					# self._calculate_open_vad_laitency(current_template_milisecounds, next_template_milisecounds)
		# 					# self.template_voice_state = SPEAKING
		# 				# else:
		# 					# self._calculate_close_vad_laitency(current_template_milisecounds, next_template_milisecounds)
		# 					# self.template_voice_state = SILENT
		# 			index_template += 1
		# 			if index_template < len(template):
		# 				current_template_timestamp = template[index_template].strip("\n")
		# 			else:
		# 				template_EOF = True
		# 				self.template_voice_state = SILENT

		total_open_laitencies = 0
		if len(self.all_open_laitencies) > 0:
			for laitency in self.all_open_laitencies:
				total_open_laitencies += laitency
			self.results_data['average_open_laitency'] = total_open_laitencies / len(self.all_open_laitencies)
		else:
			print("OPEN Laitency is unknown")
		total_close_laitencies = 0
		if len(self.all_close_laitencies) > 0:
			for laitency in self.all_close_laitencies:
				total_close_laitencies += laitency
			self.results_data['average_close_laitency'] = total_close_laitencies / len(self.all_close_laitencies)
		else:
			print("CLOSE Laitency is unknown")
		return self.results_header, self.results_data


def main(cmd_comands):
	file_path = cmd_comands[1]  # "your full file path"
	template_path = cmd_comands[2]
	template = []
	total_time_timestamp = 0
	if template_path.lower() == "none":
		template.append("00:00:00.000")
	else:
		file_of_template = open(template_path, "r")
		template = file_of_template.readlines()
		file_of_template.close()
	# file_parser = parse_wav_to_timestamps(file_path)
	all_results = []
	get_results_new = compare_results_to_template_new(file_path)
	def read_the_results_file(result_file):
		try:
			result_file = result_file.strip("\n")
			folderpath, filename = os.path.split(result_file)
			file_name, file_extention = os.path.splitext(filename)
			file_extention = file_extention.strip(".").lower()
			if file_extention == 'wav':
				print("Now parsing file: " + result_file)
				file_parser = parse_wav_to_timestamps(result_file)
				# total_time_seconds, results = file_parser.parse_file(result_file)
				# total_time_timestamp = time.calculate_time_stamp(total_time_seconds)
				results = file_parser.parse_file(result_file)
			elif file_extention == 'txt':
				print("Now reading results from file: " + result_file)
				file_of_results = open(result_file, "r")
				results = file_of_results.readlines()
				file_of_results.close()
				total_time_timestamp = results[len(results) - 1]
			else:
				print("Parser does not know how to parse results fom a file with this extention (" + file_name + ")")
			all_results.append(results)
		except:
			pass
	if cmd_comands[3].lower() == "list":
		file_of_list_of_results = open(file_path,"r")
		list_of_results = file_of_list_of_results.readlines()
		file_of_list_of_results.close()
		for result_file in list_of_results:
			if not result_file[:3].lower() == "rem":
				read_the_results_file(result_file)
	else:
		try:
			if not file_path[:3].lower() == "rem":
				result_file = file_path.strip("\n")
				read_the_results_file(result_file)
		except:
			pass

	excel_class = ExcelHandler(EXCEL_FILE_NAME)
	for result in all_results:
		print("comparing results from file: " + result[0] + "/" + result[1])
		results_header, results_dict = get_results_new.compare_lists(result,template)

		if "Folder_Name" in results_header.keys():
			results_dict['log_file_path'] = results_header["Folder_Name"]
		else:
			results_dict['log_file_path'] = ""
		results_dict['speech_script'] = template_path.strip('\n')
		temppath, results_dict['speech_script'] = os.path.split(results_dict['speech_script'])
		results_dict['speech_script'].strip("_timestamps.txt")
		results_dict['speech_script'].replace("_"," ")
		results_dict['noise_name'] = results_header["Noise_Type"]
		results_dict['noise_level'] = results_header["Noise_Level"]
		results_dict['file_length'] = results_header["File_Length"] # total_time_timestamp.strip(", Total time\n")
		total_time_milisecounds = float(time.timestamp_to_milliseconds(results_dict['file_length']))
		#results_dict['average_laitency_openning'] = results_dict.average_open_laitency
		#results_dict['average_laitency_closing'] = results_dict.average_laitency_closing
		results_dict['total_FA_time'] = results_dict['total_FA_Listening'] + results_dict['total_FA_not_Listening']
		results_dict['total_FA_percent'] = round((results_dict['total_FA_time']/total_time_milisecounds),4)
		results_dict['total_FA_count'] = results_dict['FA_Not_Listening_count'] + results_dict['FA_Listening_count']
		#results_dict['listening_FA_time'] = results_dict.FA_time_listening
		results_dict['listening_FA_percent'] = round((results_dict['total_FA_Listening'] / (total_time_milisecounds)),4)
		#results_dict['listening_FA_count'] = results_dict.FA_Listening_count
		#results_dict['not_listening_FA_time'] = results_dict.FA_time_not_listening
		results_dict['not_listening_FA_percent'] = round((results_dict['total_FA_not_Listening'] / (total_time_milisecounds )),4)
		#results_dict['not_listening_FA_count'] = results_dict.FA_not_Listening_count
		results_dict['total_FA_time'] = time.milliseconds_to_timestamp(results_dict['total_FA_time'])
		results_dict['total_FA_Listening'] = time.milliseconds_to_timestamp(results_dict['total_FA_Listening'])
		results_dict['total_FA_not_Listening'] = time.milliseconds_to_timestamp(results_dict['total_FA_not_Listening'])

		excel_class.run_log_printing(results_dict)

		try:
			print("Results for Log: " + results_dict['log_file_path'])
			print("Total time of wave is: " + results_dict['file_length'])
			print("Total FA time is: " + time.milliseconds_to_timestamp(['total_FA_time']) + ", " + str(results_dict['total_FA_percent']*100) + "%")
			print("FA time Not listening is: " + time.milliseconds_to_timestamp(results_dict['not_listening_FA_time']) + ", " +
				  str(results_dict['not_listening_FA_percent']*100) + "% in " + str(results_dict['not_listening_FA_count']) + " times")
			print("FA time listening is: " + time.milliseconds_to_timestamp(results_dict['listening_FA_time']) + ", " +
				  str(results_dict['listening_FA_percent']*100) + "% in " + str(results_dict['listening_FA_count']) + " times")
			print("Average Laitency to detect START of speech: " + str(results_dict['average_laitency_openning']))
			print("Average Laitency to detect END of speech: " + str(results_dict['average_laitency_closing']))
		except:
			pass
	excel_class.save_workbook()
	sys.exit(1)


if __name__ == "__main__":
	main( sys.argv)










class compare_results_to_template():
	def __init__(self,file_path):
		self.filepath = file_path

	def compare_lists(self,results,template):
		i = 0
		j = 0
		vad_open = False
		vad_should_be_open = True
		FA_Listening_start = 0
		total_FA_Listening = 0
		total_FA_not_Listening = 0
		all_open_laitencies = []
		all_close_laitencies = []
		average_open_laitency = 0
		average_close_laitency =0
		FA_not_Listening_count = 0
		FA_Listening_count = 0
		results_header = {"File_Path" : "", "File_Name" : "", "Noise_Type" : "", "Noise_Level" : 0, "File_Length" : ""}

		# Read the header data from the results
		line_content = results[j].strip("\n")
		while j <= (len(results)-1) and not "=========" in line_content:
			if line_content != '':
				line_split = line_content.split(":")
				if len(line_split) > 2: # Timestamps are split into parts and need to put back together
					line_split[1] = line_split[1] + ":" + line_split[2] +":" + line_split[3]
				results_header[line_split[0].replace(" ", "_")] = line_split[1]
			j = j + 1
			line_content = results[j].strip("\n")
		print("comparing results from file: " + results_header["File_Name"])
		j = j + 1 # Start analyzing the
		while i <= len(template):
			if i < len(template): # the loop will continue one iteration past the last expected result to make check for FA beyound the last end of speach
				current_template_timestamp = template[i].strip("\n")
			if template[0] == "00:00:00.000": # Parsing results with backgourn noise only.  there is no template of expected speach to xompare to.
				while j <= (len(results)-1):
					if vad_open == False:
						FA_Listening_start = results[j]
						vad_open = True
						j = j + 1
					else:
						FA_Listening = time.timestamp_difference(FA_Listening_start[:12], results[j][:12])
						total_FA_Listening = time.timestamp_addition(total_FA_Listening, FA_Listening)
						vad_open = False
						# print("FA Listening time is:" + str(FA_Listening))
						# print("Total FA Listening time is:" + str(total_FA_Listening))
						j = j + 1
				break
			else: # print("comparing actual results to excpected results")
				if j < len(results) - 1:  # make sure there are still more results to be parsed
					current_results_timestamp = results[j].strip("\n")
				while current_results_timestamp == "": # make sure the row of results is not empty (normaly at the end of the header or end of the file of results there could be empty rows
					j = j + 1
					current_results_timestamp = results[j].strip("\n")
				if j < len(results)-1: # Read the next timestamp from the list of results
					current_results_timestamp = results[j].strip("\n")
				current_template_milisecounds = time.timestamp_to_milliseconds(current_template_timestamp)
				current_results_milisecounds = time.timestamp_to_milliseconds(current_results_timestamp)

				while (j < (len(results) - 1)) and current_results_milisecounds <= current_template_milisecounds: # loop through all the results untill the timestamp of the result is latter than the timestamp of the template
					print (str(j))
					if "car_-9db" in results_header["File_Name"].lower():  # and j >= 6:
						j = j
					if current_results_milisecounds > 5500: # Ignore and results that come up in the first half second of the file.  this is normaly a false created by the energy level jumping because the test (sound) just starts.

						# current_template_timestamp = time.timestamp_to_milliseconds(template[i].strip("\n"))
						try:
							next_results_timestamp = results[j + 1].strip("\n")
							next_results_milisecounds = time.timestamp_to_milliseconds(next_results_timestamp)
							if next_results_milisecounds <= current_template_milisecounds or i == len(template):
								end_FA = next_results_milisecounds
							else:
								end_FA = current_template_milisecounds
							if vad_should_be_open == True:
								FA_Listening = end_FA - current_results_milisecounds
								if FA_Listening < 0: # If time elapsed is negitive there is a bug this test will catch the bug
									print("ERROR:  FA time can't be nigetive! i=" + str(i) + " j=" + str(j) + " end_FA= " + str(end_FA) + " Current time in Mil=" + str(current_results_milisecounds) + " current_results_timestamp=" + str(current_results_timestamp))
									break
								else:
									total_FA_Listening = total_FA_Listening + FA_Listening
									FA_Listening_count = FA_Listening_count + 1
							else:
								FA_not_Listening = end_FA - current_results_milisecounds
								if FA_not_Listening < 0: # If time elapsed is negitive there is a bug this test will catch the bug
									print("ERROR:  FA time can't be nigetive!! i=" + str(i) + " j=" + str(j) + " end_FA= " + str(end_FA) + " current_results_timestamp=" + str(current_results_timestamp))
									break
								else:
									total_FA_not_Listening = total_FA_not_Listening + FA_not_Listening
									FA_not_Listening_count = FA_not_Listening_count + 1
						except:
							print(
							"can't calculate results for result number: " + str(j) + "and template number: " + str(i))
						if end_FA != next_results_milisecounds:
							if vad_should_be_open == False:
								FA_Listening = current_results_milisecounds - next_results_milisecounds
								if FA_Listening < 0:  # If time elapsed is negitive there is a bug this test will catch the bug
									print("ERROR:  FA time can't be nigetive! i=" + str(i) + " j=" + str(
										j) + " end_FA= " + str(end_FA) + " Current time in Mil=" + str(
										current_results_milisecounds) + " current_results_timestamp=" + str(
										current_results_timestamp))
									break
								else:
									total_FA_Listening = total_FA_Listening + FA_Listening
									FA_Listening_count = FA_Listening_count + 1
								vad_open = True
							else:
								FA_not_Listening = current_results_milisecounds - next_results_milisecounds
								if FA_not_Listening < 0:  # If time elapsed is negitive there is a bug this test will catch the bug
									print("ERROR:  FA time can't be nigetive!! i=" + str(i) + " j=" + str(
										j) + " end_FA= " + str(end_FA) + " current_results_timestamp=" + str(
										current_results_timestamp))
									break
								else:
									total_FA_not_Listening = total_FA_not_Listening + FA_not_Listening
									FA_not_Listening_count = FA_not_Listening_count + 1
								vad_open = False

						j = j + 2
						if j < len(results) - 1:
							current_results_timestamp = results[j].strip("\n")
							current_results_milisecounds = time.timestamp_to_milliseconds(current_results_timestamp)

					elif j + 2 <= len(results)-1:
						j = j + 2
						current_results_timestamp = results[j].strip("\n")
						current_results_milisecounds = time.timestamp_to_milliseconds(current_results_timestamp)
					else:
						j = len(results)
				if i == len(template) and j < len(results)-1:
					# print("speech has ended but there are false voice detections afterwards that need to be calculated.")
					while j < len(results)-1:
						if j >= 123 and "car_-9db" in results_header["File_Name"].lower():
							j = j
						current_results_timestamp = results[j].strip("\n")
						current_results_milisecounds = time.timestamp_to_milliseconds(current_results_timestamp)
						next_results_timestamp = results[j + 1].strip("\n")
						next_results_milisecounds = time.timestamp_to_milliseconds(next_results_timestamp)
						FA_Listening = next_results_milisecounds - current_results_milisecounds
						if FA_Listening < 0:  # If time elapsed is negitive there is a bug this test will catch the bug
							print("ERROR:  FA time can't be nigetive! i=" + str(i) + " j=" + str(j) + " end_FA= " + str(
								next_results_milisecounds) + " Current time in Mil=" + str(
								current_results_milisecounds) + " current_results_timestamp=" + str(
								current_results_timestamp))
							break
						else:
							total_FA_Listening = total_FA_Listening + FA_Listening
							FA_Listening_count = FA_Listening_count + 1
						j = j + 2
						# if j <= len(results)-1:
				elif vad_should_be_open == False and vad_open == False:
					print("vad was closed before speach ended and remained closed until latter")
					#False Not listening time = from the last timestamp in results until the end of the speach from the template
					if j < len(results):
						FA_not_Listening = current_results_milisecounds - time.timestamp_to_milliseconds(results[j].strip("\n"))
					else:
						break
					if FA_not_Listening < 0:  # If time elapsed is negitive there is a bug this test will catch the bug
						print("ERROR:  FA time can't be nigetive!! i=" + str(i) + " j=" + str(j) + " end_FA= " + str(
							end_FA) + " current_results_timestamp=" + str(current_results_timestamp))
						break
					else:
						total_FA_not_Listening = total_FA_not_Listening + FA_not_Listening
						FA_not_Listening_count = FA_not_Listening_count + 1
						j = j - 1
				elif vad_should_be_open == True:
					if i < len(template)-1:
						next_template_timestamp = template[i + 1].strip("\n")

					else:
						next_template_timestamp = results_header["File_Length"]
					next_template_milisecounds = time.timestamp_to_milliseconds(next_template_timestamp)
					if vad_open == False and current_results_milisecounds > current_template_milisecounds and current_results_milisecounds < next_template_milisecounds: # calculate laitency only if VAD oppened after speach started
						open_laitency = current_results_milisecounds - current_template_milisecounds
						all_open_laitencies.append(open_laitency)
					elif current_results_milisecounds >= next_template_milisecounds:
						print("Speach segment was not detected at all")
						FA_not_Listening = current_template_milisecounds - time.timestamp_to_milliseconds(results[j-1].strip("\n"))
						if FA_not_Listening < 0:  # If time elapsed is negitive there is a bug this test will catch the bug
							print("ERROR:  FA time can't be nigetive!! i=" + str(i) + " j=" + str(j) + " end_FA= " + str(end_FA) + " current_results_timestamp=" + str(current_results_timestamp))
							break
						else:
							total_FA_not_Listening = total_FA_not_Listening + FA_not_Listening
							FA_not_Listening_count = FA_not_Listening_count + 1
							i = i + 1
				else:
					if vad_open == True:  # calculate laitency only if VAD oppened after speach started
						close_laitency = current_results_milisecounds - current_template_milisecounds
						if close_laitency >= 0:
							all_close_laitencies.append(close_laitency)
						else:
							print("cloase taitency is negitive: " + str(close_laitency) + " i=" + str(i) + " j= " + str(j))
				j = j + 2
				if vad_open == True:
					vad_open = False
				else:
					vad_open = True
				i= i + 1

				if vad_should_be_open == True or i == len(template):
					vad_should_be_open = False
				else:
					vad_should_be_open = True
		if len(all_open_laitencies) > 0:
			total_laitency = 0
			for laitnecy in all_open_laitencies:
				total_laitency = total_laitency + laitnecy
			average_open_laitency = total_laitency/len(all_open_laitencies)
		if len(all_close_laitencies) > 0:
			total_laitency = 0
			for laitnecy in all_close_laitencies:
				total_laitency = total_laitency + laitnecy
			average_close_laitency = total_laitency/len(all_close_laitencies)

		# average_open_laitency = round(average_open_laitency/1000,2)
		# average_close_laitency = round(average_close_laitency / 1000, 2)
		return results_header, time.milliseconds_to_timestamp(total_FA_Listening), FA_Listening_count, time.milliseconds_to_timestamp(total_FA_not_Listening), FA_not_Listening_count, average_open_laitency, average_close_laitency

