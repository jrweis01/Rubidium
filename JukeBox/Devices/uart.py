from globs import *
import logging
import datetime
import serial
import io
from PyQt4 import QtCore



class UART_LoggerThread(QtCore.QThread):
    global check_interval

    def __init__(self, com_port="COM21", listening_time=5000):
        super(UART_LoggerThread, self).__init__()
        # configure the serial connections (the parameters differs on the device you are connecting to)
        self.port = serial.Serial(com_port, baudrate=115200, timeout=3.0)
        self.listening_time = listening_time


    def readlineCR(self, port):
        rv = ""
        while True:
            ch = port.read()
            rv += ch
            if ch == '\r' or ch == '':
                return rv

    def run(self):
        global continue_listening, RECOGNIZED_PHRASE_UART

        print("starting to run the UART listner")

        continue_listening = True
        i = 0
        self.running_time = 0
        # print("Listening duration: " + str(int(self.listening_time))+ ' seconds')

        while continue_listening:
            rcv = self.readlineCR(self.port)
            # tm = unicode(datetime.datetime.now())
            rcv = rcv.strip("\n\r")
            rcv = rcv.lstrip()
            if rcv != "":
                # print("UART Recognized: " + rcv)
                RECOGNIZED_PHRASE_UART = rcv
                self.emit(QtCore.SIGNAL('recognized_UART'))

        print("Finished LISTENING to UART!")
        if i >= (int(self.listening_time) / check_interval):
            print("Automatically closing UART after Listening time is over")
            self.emit(QtCore.SIGNAL('Listening-done'))


    def get_recognized_phrase_UART(self):
        global RECOGNIZED_PHRASE_UART
        return RECOGNIZED_PHRASE_UART