from globs import *
import logging
import subprocess as sp
import re
import datetime
from PyQt4 import QtCore, QtGui

global RECOGNIZED_PHRASE_MP
ADB_DIRECTORY = os.path.abspath(os.path.join(os.path.dirname(__file__), "..\\adb"))
DEVICE_PRESENT_REGEX = re.compile("([0-9a-zA-Z])*device\r\n", re.MULTILINE)
class phoneConnectionManager():

    def _is_on_64bit(self):
        """
        returns whether we are running on a x64 platform, so that the script will know which adb exe to run
        """
        return os.environ['PROGRAMFILES'].endswith("(x86)")


    def _get_adb_path(self):
        """
        The adb exe is in a folder next to our script. Find the correct exe and return it's path
        """
        if self._is_on_64bit():
            architecture = "x64"
        else:
            architecture = "x86"
        adb_path = os.path.join(ADB_DIRECTORY, architecture, "adb.exe")

        assert os.path.isfile(adb_path), "adb.exe not found!"

        return adb_path


    def assert_check_device_present(self,adb):
        """
        Check and assert that the device is connected, and ready to work with
        """
        find_devices_process = sp.Popen([adb, "devices"], stdout=sp.PIPE)
        find_devices_process.wait()
        stdout = find_devices_process.stdout.read()
        print(stdout)
        # If device is offilne, the adb server is dead. Restart it and try again
        if "offline" in stdout: # or stdout == "":
            print("Restarting ADB service")
            sp.Popen([adb, "kill-server"]).wait()
            sp.Popen([adb, "start-server"]).wait()

            find_devices_process = sp.Popen([adb, "devices"], stdout=sp.PIPE)
            find_devices_process.wait()
            stdout = find_devices_process.stdout.read()
            print(stdout)
        ##end if
        assert not "offline" in stdout, "A device is connected, but it is OFFLINE. Try to disconnect and re-connect it"

        # If string "unauthorized" is in the output, it means the device is connected but not authorized
        assert not "unauthorized" in stdout, "A device is connected, but it is not authorized with the computer, allow this computer to connect on the phone"

        assert DEVICE_PRESENT_REGEX.search(stdout), "No connected devices found!"


    def check_phone_connected(self, adb):
        while True:
            try:
                self.assert_check_device_present(adb)
                logging.info("Found connected phone")
                return True
            except AssertionError as e:
                no_phone_msgbox = QtGui.QMessageBox()
                no_phone_msgbox.setStandardButtons(
                    QtGui.QMessageBox.Retry | QtGui.QMessageBox.Ignore | QtGui.QMessageBox.Abort)
                no_phone_msgbox.setText("No phone attached");
                user_choice = no_phone_msgbox.exec_()
                if user_choice == QtGui.QMessageBox.Retry:
                    continue
                elif user_choice == QtGui.QMessageBox.Abort:
                    os._exit(1)
                elif user_choice == QtGui.QMessageBox.Ignore:
                    logging.info("Continuing without connected phone")
                    return
                # return False

                return
    def close_phone_connection(self):
        adb = self._get_adb_path()
        sp.Popen([adb, "kill-server"]).wait()

class MP_LoggerThread(QtCore.QThread):
    """
    This is a thread which gets the phone's log using adb logcat and sets a signal each time relevent entry is found in the phone's log
    """
    def __init__(self, adb,listening_time = 5000):
        QtCore.QThread.__init__(self)
        self.adb = adb
        self.listening_time = listening_time

    def run(self):
        global RECOGNIZED_PHRASE_MP
        self.emit( QtCore.SIGNAL('log-info'), "Connecting to device...")
        end_time = datetime.datetime.now() +datetime.timedelta(seconds= int(self.listening_time))
        #for i in range(6):
        logging_process = sp.Popen([self.adb, "logcat"], stdout=sp.PIPE, stderr=sp.STDOUT, shell=True)
        self.emit( QtCore.SIGNAL('log-info'), "Connected to MP device! Logging events")
        print("Connected to MP device! Logging events")
        while True and datetime.datetime.now() <= end_time:
            log_line = logging_process.stdout.readline()
            recognized = False

            if ("Phrase name = Hi Galaxy" in log_line) or (
                ("I/FSSDKsample" in log_line) and ("***RESULT=hi galaxy score=" in log_line)):
                RECOGNIZED_PHRASE_MP = "Hi Galaxy"
                recognized = True
            elif ("Alexa Trigger Recognized but Ignored" in log_line):
                RECOGNIZED_PHRASE_MP = "Trigger Ignored"
                recognized = True
            elif (("TRIGGER - Ok Google" in log_line) or ("Phrase name = Ok Google" in log_line) or (
                "Alexa Trigger Recognized" in log_line) or ("Phrase name = Hello Rubidium" in log_line) or (
                "Phrase name = Hey Jabra" in log_line)):
                RECOGNIZED_PHRASE_MP = "Trigger"
                recognized = True
            elif ("Waiting for Trigger" in log_line):
                RECOGNIZED_PHRASE_MP = "Waiting for Trigger"
                recognized = True
            elif ("VOX Closed" in log_line):
                RECOGNIZED_PHRASE_MP = "VOX Closed"
                recognized = True
            elif ("VOX Closed Timeout" in log_line):
                RECOGNIZED_PHRASE_MP = "VOX Closed Timeout"
                recognized = True
            elif ("Amazon Listening" in log_line):
                RECOGNIZED_PHRASE_MP = "Amazon Listening"
                recognized = True
            elif ("Amazon Speaking" in log_line):
                RECOGNIZED_PHRASE_MP = "Amazon Speaking"
                recognized = True
            elif ("Amazon Processing" in log_line):
                RECOGNIZED_PHRASE_MP = "Amazon Processing"
                recognized = True
            elif ("BT is Disconnected" in log_line):
                RECOGNIZED_PHRASE_MP = "BT Disconnected"
                recognized = True
            elif ("BT is Connected" in log_line):
                RECOGNIZED_PHRASE_MP = "BT is Connected"
                recognized = True
            elif ("No Recognition" in log_line):
                RECOGNIZED_PHRASE_MP = "No Recognition"
                recognized = True
            if recognized:
                RECOGNIZED_PHRASE_MP = "MP- " + RECOGNIZED_PHRASE_MP
                self.emit( QtCore.SIGNAL('recognized_MP'))

            if datetime.datetime.now() >= end_time:
                print("MP Listening time is over")
                self.emit(QtCore.SIGNAL('Listening-done'))
                break

    def get_recognized_phrase_MP(self):
        global RECOGNIZED_PHRASE_MP
        return RECOGNIZED_PHRASE_MP

    def stop(self,logging_thread):
        print("Closing logging thread of adb")

        sp.Popen([logging_thread, "kill-server"]).wait()