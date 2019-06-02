
def timestamp_difference(time_PREV, time_CURR):
	#  Splitting the time stamp into elements of hours minutes secound and milisecound
	cur_milliseconds = []
	prev_milliseconds = []

	prev_h,prev_m,prev_s = time_PREV.split(":")
	prev_s, prev_mil = prev_s.split(".")
	prev_milliseconds = prev_mil.split(",")
	prev_mil = prev_milliseconds[0]
	cur_h, cur_m, cur_s = time_CURR.split(":")
	cur_s, cur_mil = cur_s.split(".")
	cur_milliseconds = cur_mil.split(",")
	cur_mil = cur_milliseconds[0]

	#  Calculating the elapsed time starting from Miliseconds to hours
	#  if the curent time element is not larger than the same previous time element than a unit (hour, minute, second) needs to be takne into account from the next element of time.
	if int(cur_mil) >= int(prev_mil):
		res_mil = int(cur_mil) - int(prev_mil)
		cur_s = int(cur_s)
	else:
		res_mil = (1000 + int(cur_mil)) - int(prev_mil)
		cur_s = int(cur_s) -1

	if cur_s >= int(prev_s):
		res_s = cur_s - int(prev_s)
		cur_m = int(cur_m)
	else:
		res_s = (60 + cur_s) - int(prev_s)
		cur_m = int(cur_m) -1

	if cur_m >= int(prev_m):
		res_m = cur_m - int(prev_m)
		cur_h = int(cur_h)
	else:
		res_m = (60 + cur_m) - int(prev_m)
		cur_h = int(cur_h) -1

	if cur_h >= int(prev_h):
		res_h = cur_h - int(prev_h)
	else:
		res_h = (60 + cur_h) - int(prev_h)

	#  Making sure all preceeding zeros are in place and translating each element back into string format.
	if res_h < 10:
		res_h = "0" + str(res_h)
	else:
		res_h = str(res_h)
	if res_m < 10:
		res_m = "0" + str(res_m)
	else:
		res_m = str(res_m)
	if res_s < 10:
		res_s = "0" + str(res_s)
	else:
		res_s = str(res_s)
	if res_mil < 100:
		res_mil = "00" + str(res_mil)
	elif res_mil < 10:
		res_mil = "0" + str(res_mil)
	else:
		res_mil = str(res_mil)

	return res_h + ":" + res_m + ":" + res_s + "." + res_mil


def timestamp_addition(time_PREV, time_CURR):
	#  Splitting the time stamp into elements of hours minutes secound and milisecound
	prev_h,prev_m,prev_s = time_PREV.split(":")
	prev_s, prev_mil = prev_s.split(".")
	cur_h, cur_m, cur_s = time_CURR.split(":")
	cur_s, cur_mil = cur_s.split(".")

	#  Adding  the previus time to the current time Miliseconds to hours
	#  if any of the elements are larger that the max value for that element than 1 unit of time is transfered to the next time element

	res_mil = int(cur_mil) + int(prev_mil)
	if res_mil >= 1000:
		res_mil = res_mil - 1000
		res_s = int(cur_s) + int(prev_s) + 1
	else:
		res_s = int(cur_s) + int(prev_s)
	if res_s >= 60:
		res_s = res_s - 60
		res_m = int(cur_m) + int(prev_m) + 1
	else:
		res_m = int(cur_m) + int(prev_m)
	if res_m >= 60:
		res_m = res_m - 60
		res_h = int(cur_h) + int(prev_h) + 1
	else:
		res_h = int(cur_h) + int(prev_h)


	#  Making sure all preceeding zeros are in place and translating each element back into string format.
	if res_h < 10:
		res_h = "0" + str(res_h)
	else:
		res_h = str(res_h)
	if res_m < 10:
		res_m = "0" + str(res_m)
	else:
		res_m = str(res_m)
	if res_s < 10:
		res_s = "0" + str(res_s)
	else:
		res_s = str(res_s)
	if res_mil < 100:
		res_mil = "00" + str(res_mil)
	elif res_mil < 10:
		res_mil = "0" + str(res_mil)
	else:
		res_mil = str(res_mil)

	return res_h + ":" + res_m + ":" + res_s + "." + res_mil


def milliseconds_to_timestamp(milliseconds):
	if milliseconds < 1000:
		timestamp = "00:00:00." + str(milliseconds)
	else:
		secounds = int(milliseconds/1000)
		milliseconds = int(milliseconds - (secounds*1000))
		if secounds < 60:
			timestamp = "00:00:" + str(secounds) + "." + str(milliseconds)
		else:
			minutes = int(secounds/60)
			secounds = secounds - (minutes*60)
			if minutes < 60:
				timestamp = "00:" + str(minutes) + ":" + str(secounds) + "." + str(milliseconds)
			else:
				hours = int(minutes/60)
				minutes = minutes - (hours * 60)
				timestamp = str(hours) + ":"  + str(minutes) + ":" + str(secounds) + "." + str(milliseconds)
	return timestamp


def timestamp_to_milliseconds(timestamp):
	#  Splitting the time stamp into elements of hours minutes secound and milisecound
	try:
		# if "392002, Voice Started,  frame: 3087" in timestamp:
		# 	print"say hi + 0:0:49.392002, Voice Started,  frame: 3087"
		milliseconds_placement = timestamp.count('.')

		num_elements_in_timetamp = timestamp.count(':')
		if num_elements_in_timetamp == 1:
			timestamp = "00:" + timestamp
		elif num_elements_in_timetamp == 0:
			timestamp = "00:00:" + timestamp
		elif num_elements_in_timetamp > 2:
			pos = timestamp.find(",")
			timestamp = timestamp[:pos]

		milisecounds = []
		h,m,s = timestamp.split(":")
		s, mil = s.split(".")
		milisecounds = mil.split(",")
		mil = milisecounds[0][:3]

		total_milliseconds = int(mil)+(1000*(int(s)+(60*(int(m)+(int(h)*60)))))
		return total_milliseconds
	except:
		print("Can't parse timestamp" + timestamp)
		return "ERROR"


def calculate_time_stamp(total_time_in_secounds):
	if total_time_in_secounds < 86400:  #time to calculate must be less than 24 hours
		hours = int(total_time_in_secounds/3600)
		minutes = int(total_time_in_secounds/60)
		secounds  = str(total_time_in_secounds - (minutes*60))
		secounds, miliseconds = secounds.split(".")
		if hours < 10:
			hours = "0" + str(hours)
		else:
			hours = str(hours)
		if minutes < 10:
			minutes = "0" + str(minutes)
		else:
			minutes = str(minutes)
		if int(secounds) < 10:
			secounds = "0" + str(secounds)
		else:
			secounds = str(secounds)
		if int(miliseconds) < 10:
			miliseconds = "00" + str(miliseconds)
		elif int(miliseconds) < 100:
			miliseconds = "0" + str(miliseconds)
		else:
			miliseconds = str(miliseconds)
		miliseconds = miliseconds[:3]

		return hours + ":" + minutes + ":" + secounds + "." + miliseconds
	else:
		print("Elapsed time must be less than 24 hours")
		return str(total_time_in_secounds)


def _timestamp_difference_avihay(time_PREV, time_CURR):
	from datetime import datetime, time as datetime_time, timedelta
	def handle_result(res):
		h, m, s = str(res).rsplit(':')
		s = str(round((float(s)), 2))
		if (int(h) == 0) and (int(m) == 0):
			result = "00:00:{}".format( s)
		elif (int(h) == 0) and (int(m) != 0):
			result = "00:{}:{}".format(m, s)
		else:
			result = "{}:{}:{}".format(h, m, s)
		return str(result)

	start,end=time_PREV, time_CURR

	for time_range in ['{}-{}'.format(start, end)]:
		start, end = [datetime.strptime(t, '%H:%M:%S.%f') for t in time_range.split('-')]

	if isinstance(start, datetime_time):  # convert to datetime
		assert isinstance(end, datetime_time)
		start, end = [datetime.combine(datetime.min, t) for t in [start, end]]

	if start <= end:  # e.g., 10:33:26-11:15:49
		return handle_result(end - start)
	else:  # end < start e.g., 23:55:00-00:25:00
		end += timedelta(1)  # +day
		assert end > start
		return handle_result(end - start)
