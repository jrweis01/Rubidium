#!/usr/bin/env python
############################################################################
# CONFIDENTIAL
#
# Copyright (c) 2016 Qualcomm Technologies International, Ltd.
#   Part of 6.2
#
############################################################################
"""
Run the apps1 trap_live_log() command
"""
import sys
import os
import datetime
try:
    import csr
    QCC_LOAD_ERROR = False
except ImportError:
	QCC_LOAD_ERROR = True
	print("csr MODULE COULDN'T LOAD")
import time
import logging
from GUI.qt_ui_form_deigner import *



if QCC_LOAD_ERROR == False: from csr.front_end.pydbg_front_end import PydbgFrontEnd

# ----------------------------------------------------------------------------
# Entry
# ----------------------------------------------------------------------------
def start_listening_to_QCC_log_with_thread_and_class():
    # import sys
    # app = QtGui.QApplication(sys.argv)
    # widget = QtGui.QWidget()
    logging.info("Connecting to QCC USB for results")
    QCCLoggerThread = QCC_LoggerThread()
    # widget.connect(QCCLoggerThread, QtCore.SIGNAL("log-info"), logging.info)
    # widget.connect(QCCLoggerThread, QtCore.SIGNAL("log-debug"), logging.info)
    # widget.connect(QCCLoggerThread, QtCore.SIGNAL("recognized_SERIAL"),
    #                     recognized_QCC_event)
    # widget.connect(QCCLoggerThread, QtCore.SIGNAL("play-done"), stop_logging)
    # widget.connect(QCCLoggerThread, QtCore.SIGNAL("Listening-done"),
    #                     lambda: shut_down_Listener_automaticaly(QCCLoggerThread))
    Logging_QCC = True
    QCCLoggerThread.run()
    timecounter = 0
    while timecounter < 1000:
        time.sleep(0.1)
        timecounter =+ 1
        print timecounter


class QCC_LoggerThread(QtCore.QThread):
    def __init__(self):
        super(QCC_LoggerThread, self).__init__()
        print("initiating QCC listner")

        my_dir = "tools"
        pylib_dir = os.path.join(my_dir, "pylib")
        if pylib_dir not in sys.path:
            sys.path.insert(0, pylib_dir)
            try:
                # See http://svn.python.org/projects/sandbox/branches/setuptools-0.6/pkg_resources.txt
                # description of WorkingSet objects.
                # We do early import of pkg_resources because it is used in class
                # csr.front_end.pydbg_config which calling scripts may have already used.
                # All subsequent updates to sys.path must update the WorkingSet thus:
                import pkg_resources
                pkg_resources.working_set = pkg_resources.WorkingSet()
            except ImportError:
                # import failed; setuptools not installed on this PC
                pass

        del my_dir
        del pylib_dir

    def run(self):
        global continue_QCC_listening, RECOGNIZED_PHRASE_QCC, INFO_PHRASE_QCC, ENERGY_PHRASE_QCC, DEBUG_PRINTING
        DEBUG_PRINTING = False
        if DEBUG_PRINTING == True: print("entered QCCLogging --> run")
        continue_QCC_listening = True

        print("starting the QCC listner")
        """
            A simple routine entry point that setuptools:setup.py can
            provide as an executable entry point when project is built via setup.py
            """
        try:
            ELF_path = r"C:\Projects\loop\apps\applications\dev_board_loopback_download\qcc512x_qcc302x\common\depend_debug_qcc512x_qcc302x\dev_board_loopback_download.elf"
            m_globals = '-dtrb:usb2trb -fapps1:%s log' % ELF_path
            # Adding arguemtns so that pydbg will connect to the chip - it reads the arguments from argv
            sys.argv = m_globals.split()
            file_path = os.path.abspath(__file__)
            file_dir = os.path.dirname(file_path)
            cur_pythonpath = os.getenv("PYTHONPATH", None)
            if cur_pythonpath:
                os.environ["PYTHONPATH"] = cur_pythonpath + ";" + file_dir
            else:
                os.environ["PYTHONPATH"] = file_dir
            # print os.getenv("PYTHONPATH", None)

            PydbgFrontEnd.main_wrapper(shell=globals())
            device = csr.dev.attached_device
            apps1 = device.chip.apps_subsystem.p1
            apps1.fw.env.load = True
            apps1.get_log = lambda: apps1.fw.debug_log.generate_decoded_event_report(return_str=True)
            # First time clears log
            apps1.get_log()
            print("Listening")
            vad = ""
            listening = ""
            while continue_QCC_listening:
                messaage_array = []
                time.sleep(0.01)
                new_log = apps1.get_log()
                if new_log:
                    #  print new_log
                    messaage_array = new_log.split("\n")
                    # print(messaage_array)
                    prev_ENERGY_PHRASE_QCC = ""
                    for message in messaage_array:
                        if message.strip(" ") != "":
                            # print("Message is: " + message)
                            if message.lower().find("listen") > -1:  # Message is only clipping
                                # print("Message contains Listen state")
                                if listening == "" or not listening in message:
                                    pos_listen = message.lower().find("listen")
                                    INFO_PHRASE_QCC = message[pos_listen:].strip("\n")# .strip("\n----.---    apps1: ASR_START OK")
                                    listening = INFO_PHRASE_QCC
                                    self.emit(QtCore.SIGNAL('Info_QCC'))
                                # else:
                                #     print("founf LISTEN message but value is same as before: " +listening + ", " +  message)
                            if message.find("MEAN ENERGY") > -1:  # Message is TIMEOUT
                                # print("Message contains MEAN ENERGY state")
                                pos_energy = message.find("MEAN ENERGY")
                                ENERGY_PHRASE_QCC = message[pos_energy:].strip("\n")
                                if ENERGY_PHRASE_QCC != prev_ENERGY_PHRASE_QCC:
                                    self.emit(QtCore.SIGNAL('Energy_QCC'))
                                    prev_ENERGY_PHRASE_QCC = ENERGY_PHRASE_QCC
                            if message.lower().find("timeout") > -1:  # Message is TIMEOUT
                                # print("Message contains timout state")
                                pos_tout = message.lower().find("timeout")
                                INFO_PHRASE_QCC = message[pos_tout:].strip("\n")
                                self.emit(QtCore.SIGNAL('Info_QCC'))
                                pos_tout = -1
                            if message.lower().find("unknown cmd") > -1:  # Message is TIMEOUT
                                # print("Message contains unknown cmd state")
                                pos_ucmd = message.lower().find("unknown cmd")
                                INFO_PHRASE_QCC = message[pos_ucmd:].strip("\n")
                                self.emit(QtCore.SIGNAL('Info_QCC'))
                            if message.lower().find("vad") > -1:  # Message is only clipping
                                # print("Message contains VAD state")
                                pos_vad = message.lower().find("vad")
                                INFO_PHRASE_QCC = message[pos_vad:].strip("\n")#.strip("\n----.---    apps1: ASR_START OK")
                                self.emit(QtCore.SIGNAL('Info_QCC'))
                            pos = message.lower().find("recognized")
                            pos1 = message.lower().find("clipping")
                            if pos1 > -1 and pos == -1:  # Message is only clipping
                                # print("Message is only clipping")
                                INFO_PHRASE_QCC = message[pos1:].strip("\n").strip("\n----.---    apps1: ASR_START OK")
                                self.emit(QtCore.SIGNAL('Info_QCC'))
                            elif pos > -1 and pos1 == -1:  # message contains recognized but NOT clipping
                                # print("message contains recognized but NOT clipping")
                                # RECOGNIZED_PHRASE_QCC = new_log[pos:].strip("\n").strip('\n----.---    apps1: ASR_START OK')
                                RECOGNIZED_PHRASE_QCC = message[pos:].strip("\n")
                                self.emit(QtCore.SIGNAL('recognized_QCC'))
                            elif pos > -1 and pos1 > -1:  # Message contains both Recognition and clipping
                                # print("Message contains both Recognition and clipping")
                                temp_str = message.split("\n")
                                RECOGNIZED_PHRASE_QCC = temp_str[0][pos:].strip("\n")
                                INFO_PHRASE_QCC = temp_str[1][pos1:].strip("\n").strip("\n----.---    apps1: ASR_START OK")
                                self.emit(QtCore.SIGNAL('recognized_QCC'))
                                self.emit(QtCore.SIGNAL('Info_QCC'))
                            #print RECOGNIZED_PHRASE_QCC

            print("END Listening")
        except Exception as e:
            print("couldn't activate listening to QCC: " + str(e))
            self.stop()

    def get_recognized_QCC_phrase(self):
        global RECOGNIZED_PHRASE_QCC
        # print("Retriving recognized QCC phrase")
        return RECOGNIZED_PHRASE_QCC

    def get_energy_QCC_phrase(self):
        global ENERGY_PHRASE_QCC
        # print("Retriving energy QCC phrase")
        return ENERGY_PHRASE_QCC


    def get_info_QCC_phrase(self):
        global INFO_PHRASE_QCC
        # print("Retriving info QCC phrase")
        return INFO_PHRASE_QCC


    def stop(self):
        global continue_QCC_listening
        continue_QCC_listening = False

    def reset_QCC_chip(self):
        ELF_path = r"C:\Projects\loop\apps\applications\dev_board_loopback_download\qcc512x_qcc302x\common\depend_debug_qcc512x_qcc302x\dev_board_loopback_download.elf"
        m_globals = '-d trb:usb2trb -f apps1:%s' % ELF_path
        # Adding arguemtns so that pydbg will connect to the chip - it reads the arguments from argv
        sys.argv.extend(m_globals.split())

        PydbgFrontEnd.main_wrapper(shell=globals())
        device = csr.dev.attached_device
        device.reset()


def start_listening_to_QCC_log():
    """
    A simple routine entry point that setuptools:setup.py can
    provide as an executable entry point when project is built via setup.py
    """
    ELF_path = r"C:\Projects\loop\apps\applications\dev_board_loopback_download\qcc512x_qcc302x\common\depend_debug_qcc512x_qcc302x\dev_board_loopback_download.elf"
    m_globals = '-d trb:usb2trb -f apps1:%s log' % ELF_path
    # Adding arguemtns so that pydbg will connect to the chip - it reads the arguments from argv

    sys.argv.extend(m_globals.split())

    file_path = os.path.abspath(__file__)
    file_dir = os.path.dirname(file_path)
    cur_pythonpath = os.getenv("PYTHONPATH", None)
    if cur_pythonpath:
        os.environ["PYTHONPATH"] = cur_pythonpath + ";" + file_dir
    else:
        os.environ["PYTHONPATH"] = file_dir

    print os.getenv("PYTHONPATH", None)
    now = datetime.datetime.now()
    timestamp = now.strftime("%a %d/%m/%Y %H:%M:%S")
    timestamp_for_filename = timestamp.replace(" ","_").replace("/","-").replace(":","-")
    log_file_path ="C:\\AutomationEnvironment\\Logs\QCC_Log_" + timestamp_for_filename + ".txt"
    f = open(log_file_path, 'w+')

    PydbgFrontEnd.main_wrapper(shell=globals())
    device = csr.dev.attached_device
    apps1 = device.chip.apps_subsystem.p1
    apps1.fw.env.load = True
    f.write(timestamp + " - Attached & Listening\n")
    f.close()
    apps1.get_log = lambda: apps1.fw.debug_log.generate_decoded_event_report(return_str=True)
    # First time clears log
    apps1.get_log()

    while True:
        time.sleep(0.01)
        new_log = apps1.get_log()
        if new_log:
            # print new_log
            now = datetime.datetime.now()
            timestamp = now.strftime("%a %d/%m/%Y %H:%M:%S") + ('.%03d' % (now.microsecond / 10000))
            messaage_array = new_log.split("\n")
            # print(messaage_array)
            for message in messaage_array:
                if message.strip(" ") != "":
                   #  print("Message is: " + message)
                    # if "recognized" in new_log.lower() or "clipping" in new_log.lower() or "vad" in new_log.lower() or "listen" in new_log.lower():
                    # print("RECOGNIZED!!")
                    f = open(log_file_path, 'a')
                    if message.lower().find("listen") > -1:  # Message is only clipping
                        # print("Message contains Listen state")
                        if listening == "" or not listening in message:
                            pos = message.lower().find("listen")
                            INFO_PHRASE_QCC = message[pos:].strip("\n")  # .strip("\n----.---    apps1: ASR_START OK")
                            listening = INFO_PHRASE_QCC
                            print INFO_PHRASE_QCC
                            f.write(timestamp + " - " + INFO_PHRASE_QCC + "\n")
                    if message.lower().find("timeout") > -1:  # Message is TIMEOUT
                        # print("Message contains VAD state")
                        pos = message.lower().find("timeout")
                        INFO_PHRASE_QCC = message[pos:].strip("\n")# .strip("\n----.---    apps1: ASR_START OK")
                        print INFO_PHRASE_QCC
                        f.write(timestamp + " - " + INFO_PHRASE_QCC + "\n")
                    if message.lower().find("vad") > -1:  # Message is only clipping
                        # print("Message contains VAD state")
                        pos = message.lower().find("vad")
                        INFO_PHRASE_QCC = message[pos:].strip("\n").strip("\n----.---    apps1: ASR_START OK")
                        print INFO_PHRASE_QCC
                        f.write(timestamp + " - " + INFO_PHRASE_QCC + "\n")
                    if message.lower().find("unknown cmd") > -1:  # Message is only clipping
                        # print("Message contains VAD state")
                        pos = message.lower().find("unknown cmd")
                        INFO_PHRASE_QCC = message[pos:].strip("\n").strip("\n----.---    apps1: ASR_START OK")
                        print INFO_PHRASE_QCC
                        f.write(timestamp + " - " + INFO_PHRASE_QCC + "\n")
                    pos = message.lower().find("recognized")
                    pos1 = message.lower().find("clipping")
                    if pos1 > -1 and pos == -1:  # Message is only clipping
                        #  print("Message is only clipping")
                        INFO_PHRASE_QCC = message[pos1:].strip("\n").strip("\n----.---    apps1: ASR_START OK")
                        print INFO_PHRASE_QCC
                        f.write(timestamp + " - " + INFO_PHRASE_QCC + "\n")
                    elif pos > -1 and pos1 == -1:  # message contains recognized but NOT clipping
                        # print("message contains recognized but NOT clipping")
                        # RECOGNIZED_PHRASE_QCC = new_log[pos:].strip("\n").strip('\n----.---    apps1: ASR_START OK')
                        RECOGNIZED_PHRASE_QCC = message[pos:].strip("\n")
                        print RECOGNIZED_PHRASE_QCC
                        f.write(timestamp + " - " + RECOGNIZED_PHRASE_QCC + "\n")
                    elif pos > -1 and pos1 > -1:  # Message contains both Recognition and clipping
                        # print("Message contains both Recognition and clipping")
                        temp_str = message.split("\n")
                        RECOGNIZED_PHRASE_QCC = temp_str[0][pos:].strip("\n")
                        INFO_PHRASE_QCC = temp_str[1][pos1:].strip("\n").strip("\n----.---    apps1: ASR_START OK")
                        print RECOGNIZED_PHRASE_QCC
                        f.write(timestamp + " - " + RECOGNIZED_PHRASE_QCC + "\n")
                        print INFO_PHRASE_QCC
                        f.write(timestamp + " - " + INFO_PHRASE_QCC + "\n")
                    f.close()


def shut_down_Listener_automaticaly(QCCLoggerThread):
    QCCLoggerThread.stop()

def stop_logging(QCCLoggerThread):
    QCCLoggerThread.stop()

def recognized_QCC_event(QCCLoggerThread):
    recognition_phrase = QCCLoggerThread.get_recognized_QCC_phrase()
    print("RECOGNIZED: " + recognition_phrase)


def main():
    start_listening_to_QCC_log()
    # start_listening_to_QCC_log_with_thread_and_class()

if __name__ == "__main__":
    main()

    # sys.exit(app.exec_())
    # sys.exit(1)