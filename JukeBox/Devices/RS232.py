from globs import *
import logging
import datetime
import serial
import io
from PyQt4 import QtCore



class SERIAL_LoggerThread(QtCore.QThread):
    global check_interval

    def __init__(self, com_port="COM9", listening_time=5000):
        super(SERIAL_LoggerThread, self).__init__()
        # configure the serial connections (the parameters differs on the device you are connecting to)
        self.serial_rs232_connection = serial.Serial(com_port,
                                  baudrate = 115200, #38400,
                                  parity=serial.PARITY_NONE,
                                  stopbits=serial.STOPBITS_ONE,
                                  bytesize=serial.EIGHTBITS,
                                  timeout=3.0)
        self.listening_time = listening_time


    def readlineCR(self, serial_rs232_connection):
        rv = ""
        while True:
            ch = serial_rs232_connection.read()
            # print("ch is: " + ch)
            if ch == '\r' or ch == '' or ch == '*':
                # print("end of string")
                return rv
            else:
                rv += ch


    def run(self):
        global continue_listening, RECOGNIZED_PHRASE_SERIAL
        print("starting to run the Serial-RS232 listner")

        continue_listening = True
        i = 0
        self.running_time = 0
        # print("Listening duration: " + str(int(self.listening_time))+ ' seconds')

        while continue_listening:
            rcv = self.readlineCR(self.serial_rs232_connection)
            # print("Receive: " + rcv)
            # tm = unicode(datetime.datetime.now())
            rcv = rcv.strip("\n\r")
            rcv = rcv.lstrip()
            if rcv != "":
                # print("SERIAL-RS232 Recognized: " + rcv)
                RECOGNIZED_PHRASE_SERIAL = rcv
                self.emit(QtCore.SIGNAL('recognized_SERIAL'))

        print("Finished LISTENING to UART!")
        if i >= (int(self.listening_time) / check_interval):
            print("Automatically closing RS232 after Listening time is over")
            self.close_serial_connection()
            self.emit(QtCore.SIGNAL('Listening-done'))


    def get_recognized_phrase_SERIAL(self):
        global RECOGNIZED_PHRASE_SERIAL
        return RECOGNIZED_PHRASE_SERIAL


    def close_serial_connection(self):
	    self.serial_rs232_connection.close()
	    # exit()