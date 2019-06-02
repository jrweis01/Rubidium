from my_log_classes import *
from utils import Utils, ExcelHandler
import re
from datetime import datetime, time as datetime_time, timedelta


def this_func(a,b,*args,**kwargs):
	print "a = {} ,b = {}".format(a,b)
	if args:
		print 'args'
	if kwargs:
		print 'kwargs'
	else:
		print 'else!'


def get_time_stamp( line):
	time = re.search("\d{2}:\d{2}:\d{2}\.*\d*", line)
	return time.group()


def timestamp_difference( time_PREV, time_CURR):
	time1_hours, time1_minutes, time1_secondes = time_PREV.split(':')
	time1_hours, time1_minutes, time1_secondes = int(time1_hours), int(time1_minutes), float(time1_secondes)
	time2_hours, time2_minutes, time2_secondes = time_CURR.split(':')
	time2_hours, time2_minutes, time2_secondes = int(time2_hours), int(time2_minutes), float(time2_secondes)
	f = lambda t1, t2: (((t2 + 60) - t1) if (t2 - t1) < 0 else (t2 - t1))
	res_seconds = f(time1_secondes, time2_secondes)
	return str(res_seconds)


def insertion_sort( items):
	for i in range(1, len(items)):
		j = i
		while j > 0 and items[j] > items[j - 1]:
			items[j - 1], items[j] = items[j], items[j - 1]
			j = j - 1
	return items




def time_diff(start, end):
	def handle_result(res):
		h, m, s = str(res).rsplit(':')
		s = str(round((float(s)), 2))
		if (int(h)==0) and (int(m)==0):
			result = s
		elif (int(h)==0) and (int(m)!=0):
			result = "{}:{}".format(m, s)
		else:
			result = "{}:{}:{}".format(h,m, s)
		return str(result)

	for time_range in ['{}-{}'.format(start,end)]:
		start, end = [datetime.strptime(t, '%H:%M:%S.%f') for t in time_range.split('-')]

	if isinstance(start, datetime_time): # convert to datetime
		assert isinstance(end, datetime_time)
		start, end = [datetime.combine(datetime.min, t) for t in [start, end]]

	if start <= end: # e.g., 10:33:26-11:15:49
		return handle_result(end-start)
	else: # end < start e.g., 23:55:00-00:25:00
		end += timedelta(1) # +day
		assert end > start
		return handle_result(end - start)


def clac_recognition_rate_per_minutes(duration, recognized):
	if recognized > 0:
		h, m, s = duration.split(':')
		h, m, s = int(h), int(m), round(float(s))
		time_in_hours = h + (m / float(60))
		rate = round(recognized/time_in_hours , 1)
		return rate
	else:
		return 0


def main():
	duration= '00:30:34'
	reco=3
	rate=clac_recognition_rate_per_minutes(duration,reco)
	h, m, s = duration.split(':')
	h, m, s = int(h), int(m), round(float(s))
	# time_in_minutes = round(float(h*60 + m + s * (1 / float(60))),2)
	time_in_hours= h+(m/float(60))
	rate = reco/time_in_hours

	# line = 	'Thu 23/02/2017 10:27:40 INFO - Recognized! - MP- Trigger'
	line_prev ="Wed 01/03/2017 23:24:54.600 INFO"
	line_curr ="Wed 01/03/2017 00:26:01.015 INFO"
	#
	time_prev = get_time_stamp(line_prev)
	time_curr = get_time_stamp(line_curr)

	# for time_range in ['{}-{}'.format(time_prev,time_curr)]:
	# 	s, e = [datetime.strptime(t, '%H:%M:%S.%f') for t in time_range.split('-')]

	print(time_diff(time_prev, time_curr))

	print "yey"
	# FMT= '%H:%M:%S'
	# s,e=datetime.strptime(time_prev,FMT),datetime.strptime(time_curr,FMT)
	# print(time_diff(s, e))
	# print "yey"
	# times=timestamp_difference(time_prev,time_curr)











if __name__ == "__main__":
	main()
