'''
@author: Barak & Josh
'''

from time import sleep, time
from PyQt4 import QtCore
import logging
# import sys
from globs import *
from get_files_from_directories import setup_logger
import Devices.Board as Board
from Devices.Board import EvaluationBoard

logging_level = logging.INFO
global LOGGER_PATH

class Listening_Loop(QtCore.QThread):
    global listening_duration, check_interval, running_from

    def __init__(self,listening_duration, check_interval, dict_name, counter0_name = "Rubidium", counter1_name = "Rubidium",\
                 running_from = 'From JukeBox',log_every_time_checked = False, listener_log_path = ""):
        super(Listening_Loop, self).__init__()

        self.listening_duration = listening_duration
        self.check_interval = check_interval
        self.running_from = running_from
        self.dict_name = dict_name
        self.counter0_name = counter0_name
        self.counter1_name = counter1_name
        self.log_every_time_checked = log_every_time_checked
        self.listener_log_path = listener_log_path


        if running_from == 'Stand Alone':
            if self.listener_log_path == "" or not self.listener_log_path[-4:]== '.txt':
                #if the log path is empty OR if the last 4 characters are not .txt
                #set the path for the log file
                log_path = os.path.join(os.path.dirname(os.path.dirname(__file__)), 'logs')
                listener_log_path = os.path.join(log_path, "Listener_log_%s.txt" % TIME_FOR_FILENAMES)
            setup_logger('', listener_log_path)

    def run(self):
        global LJ, continue_listening, listening_duration, check_interval, EB, running_from

        print("starting to run the listner")
        check_interval = self.check_interval
        running_from = self.running_from
        if check_interval == 0:
            check_interval = 0.2
        listening_duration = self.listening_duration

        EB = EvaluationBoard()
        EB.start(self.dict_name)
        LJ = Board.check_labjack_connection()

        cnt0 = 0
        prev_cnt0 = 0
        cnt1 = 0
        prev_cnt1 = 0
        continue_listening = True
        i = 0
        recognition = 0
        self.emit(QtCore.SIGNAL('log-info'), 'LISTENING for ' + str(int(listening_duration)/3600) + ' hours')
        self.emit(QtCore.SIGNAL('log-info'), 'LabJack will be checked every ' + str(check_interval) + ' seconds')
        print('LISTENING for ' + str(listening_duration) + ' seconds')
        while i < float(listening_duration) and continue_listening:
            # print(str(i))
            sleep(check_interval)
            i = i + check_interval
            LJ_counter0 = LJ.readCounter0()
            LJ_counter1 = LJ.readCounter()

            if cnt0 != LJ_counter0[0] or cnt1 != LJ_counter1[0]:
                # need to check if the counter is still being updated or not
                # we will check every 50ms and once the counters stop changing the results will be considered final
                while True:
                    # print("Waiting for counter to be fully updated")
                    sleep(0.2)
                    temp_counter0 = LJ.readCounter0()
                    temp_counter1 = LJ.readCounter()
                    if temp_counter0 == LJ_counter0 and temp_counter1 == LJ_counter1:
                        break
                    else:
                        # print("updating counter, counter is: " + str(temp_counter0) + ", " + str(temp_counter1))
                        LJ_counter0 = temp_counter0
                        LJ_counter1 = temp_counter1
                cnt0 = LJ_counter0[0]
                res0 = cnt0 - prev_cnt0
                prev_cnt0 = cnt0
                if res0 > 0:
                    diagnostic0 = 'Counter0 - ' + EB.phrase_diagnostic_analysis(res0)
                    # print(diagnostic0 + ' - ' + str(res0))
                    if running_from == 'Stand Alone':
                        logging.info("Listener: %s - %d", diagnostic0, res0)
                    else:
                        self.emit(QtCore.SIGNAL('log-info'), diagnostic0 + ' - ' + str(res0))
                if self.counter1_name and self.counter1_name != "None":  # **Check if counter1 has a name (if not don't check its value)
                    cnt1 = LJ_counter1[0]
                    res1 = cnt1 - prev_cnt1
                    prev_cnt1 = cnt1
                    if res1 > 0:
                        if self.counter1_name == self.counter0_name:  # ** if Counter1 & Counter 0 have the same name then counter 1 is recording the number of times there was a reset in the application
                            diagnostic1 = 'Counter1 - LJ- Reset ' + str(res1/2) + ' time\s'
                        else:  # ** 2 diffrent application are being tested
                            diagnostic1 = 'Counter1 - ' + EB.phrase_diagnostic_analysis(res1)
                            # print(diagnostic1 + ' - ' + str(res1))
                        if running_from == 'Stand Alone':
                            # print('items will be logged to a separate file using logging.info')
                            logging.info("Listener: %s - %d", diagnostic1, res1)
                        else:
                            self.emit(QtCore.SIGNAL('log-info'), diagnostic1 + ' - ' + str(res1))
                recognition = recognition + 1

            if self.log_every_time_checked:
                # Print the value of the LabJack counter to the log even if it didn't change at all
                    self.emit(QtCore.SIGNAL('log-info'),'LabJack Counter: ' + str(LJ_counter1[0]))
                    self.emit(QtCore.SIGNAL('log-info'),'LabJack Counter: ' + str(LJ_counter0[0]))
        # print("Finished listening loop")

        self.emit(QtCore.SIGNAL('log-info'), "Finished LISTENING!")
        print("Finished LISTENING!")
        LJ.closeConnectionWithHw()
        self.stop_loop()
        self.close()

    def close(self):
        global EB
        print('Closing LabJack connection')
        # EB.close()
        if len(sys.argv)>1 and self.running_from == 'Stand Alone':
            log = logging.getLogger()
            for hdlr in log.handlers[:]:  # remove all old handlers
                print("removing log with handler: " + str(hdlr))
                log.removeHandler(hdlr)
            raise SystemExit
            # sys.exit(0)
        self.terminate()

    def stop_loop(self):
        global continue_listening
        print("stop Listening")
        continue_listening = False

if __name__ == "__main__":
    mode = 'Stand Alone'

    if len(sys.argv) > 1:
        args = []
        try:
            j = int(sys.argv[1])
            args = sys.argv
            log_path = ""
        except:
            log_path = sys.argv[1]
            args = sys.argv[1:]


        time_to_listen = args[1]
        check_interval = float(args[2])
        dictionary_name = args[3]
        counter0_name = args[4]
        counter1_name = args[5]
    else:
        time_to_listen = 345600 #4 days in seconds
        check_interval = 0.2
        dictionary_name = 'MyMano'
        counter0_name = "Rubidium"
        counter1_name = "Rubidium"

    app = Listening_Loop(time_to_listen, check_interval, dictionary_name, counter0_name, counter1_name, mode, False, log_path)
    app.start()
    app.exec_()