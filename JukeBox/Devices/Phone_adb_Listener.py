'''
@author: Barak & Josh
'''

from time import sleep
from PyQt4 import QtCore
import logging

from globs import *
from get_files_from_directories import setup_logger
# from Devices.HWmanager import HWmanager
import Devices.phone as Board
from Devices.phone import MobilePhone

logging_level = logging.INFO


class Listening_Loop(QtCore.QThread):
    global listening_duration, check_interval, running_from

    def __init__(self,listening_duration, check_interval, dict_name, running_from = 'From JukeBox',log_every_time_checked = False):
        super(Listening_Loop, self).__init__()

        self.listening_duration = listening_duration
        self.check_interval = check_interval
        self.running_from = running_from
        self.dict_name = dict_name
        self.log_every_time_checked = log_every_time_checked


        if running_from == 'Stand Alone':
            setup_logger('', "Listener_log_%s.txt" % TIME_FOR_FILENAMES)

    def run(self):
        global LJ, continue_listening, listening_duration, check_interval, EB, running_from

        print("starting to run the listner")
        check_interval = self.check_interval
        running_from = self.running_from
        if check_interval == 0:
            check_interval = 0.5
        listening_duration = self.listening_duration

        DEVICE = MobilePhone()
        DEVICE.start(self.dict_name)
        PM = Board.MobilePhone.check_phone_connected()

        continue_listening = True
        i = 0
        recognition = 0
        self.emit(QtCore.SIGNAL('log-info'), 'LISTENING for ' + str(int(listening_duration)/3600) + ' hours')
        self.emit(QtCore.SIGNAL('log-info'), 'Phone adb log will be checked every ' + str(check_interval) + ' seconds')
        print('LISTENING for ' + str(listening_duration) + ' seconds')
        while i < float(listening_duration) and continue_listening:

            sleep(check_interval)
            i = i + check_interval
            LJ_counter0 = LJ.readCounter0()

            if cnt0 != LJ_counter0[0]:
                cnt0 = LJ_counter0[0]
                res0 = cnt0 - prev_cnt0
                prev_cnt0 = cnt0

                diagnostic0 = EB.phrase_diagnostic_analysis(res0)
                print(diagnostic0 + ' - ' + str(res0))
                recognition = recognition + 1
                if running_from == 'Stand Alone':
                    # print('items will be logged to a separate file using logging.info')
                    logging.info("Listener: %s - %d", diagnostic0, res0)
                else:
                    self.emit(QtCore.SIGNAL('log-info'), diagnostic0 + ' - ' + str(res0))
        if self.log_every_time_checked:
            # Print the value of the LabJack counter to the log even if it didn't change at all
            self.emit(QtCore.SIGNAL('log-info'), 'LabJack Counter: ' + str(LJ_counter0[0]))

        print("Finished LISTENING!")
        self.close()

    def close(self):
        global EB
        print('Closing adb connection')
        # EB.close()
        self.terminate()
        print('adb connection closed')

    def stop_loop(self):
        global continue_listening
        print("stop Listening")
        continue_listening = False

if __name__ == "__main__":
    if len(sys.argv) > 1:
        time_to_listen = sys.argv[1]
        check_interval = float(sys.argv[2])
        dictionary_name = sys.argv[3]
    else:
        time_to_listen = 50 # 00000
        check_interval = 0.5
        dictionary_name = 'Google'
    mode = 'Stand Alone'
    app = Listening_Loop(time_to_listen, check_interval,dictionary_name,mode)
    app.start()
    app.exec_()