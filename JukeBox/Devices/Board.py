'''


@author: barak
'''
from PyQt4 import QtCore

from Devices.HWmanager import HWmanager
from Devices.Phrases_and_Diagnostics import PRJ_DICT
from GPIO.labjack import LabJack


#from FitBit_Phrases_and_Diagnostics import *

def check_labjack_connection():
    
    global LJ
    
    LJ = LabJack()
    assert LJ.verifyConnectionWithHw(), "connection failure, try Labjack reconnection"
    
    return LJ
    
# def reset_labjack_counters():
#     global LJ
#
#     LJ.resetcou
# a decorator that returns the relevant "phrases" and "diagnosis" dictionaries according to an argument,
# which being passed, named on its "client/project" (e.g. Fitbit)
def dict_per_board(func):
    
    def phrase_diag_dicts(dev, client):
        return func(dev, PRJ_DICT[client])
         
    return phrase_diag_dicts


class LoggerEB(QtCore.QThread):           # LoggerThread
    # **Get the counter names in order to determine how many counters to use and how many applications are being tested.
    def __init__(self, phrase_diagnostic_analysis, counter0_name, counter1_name):
        
        # try with or without super
        super(LoggerEB, self).__init__()
        #self.wav_player = wav_player
        self.phrase_diagnostic_analysis = phrase_diagnostic_analysis
        self.phrase_and_diagnos = None
        self.prev_counter = 0
        self.prev_counter0 = 0
        self.counter0_name = counter0_name
        self.counter1_name = counter1_name

    def run(self):
        global LJ
        reset_prev_counter0 = False
        reset_prev_counter1 = False

        LJ_counter0 = LJ.readCounter0()
        LJ_counter0_t = int(str(LJ_counter0).strip('[]'))
        if LJ_counter0_t >= 60000:
            print("Total Counter0 is:" + str(LJ_counter0_t))
            LJ.resetCounter0()
            reset_prev_counter0 = True
        counter0_value = LJ_counter0[0] - self.prev_counter0
        # print( self.counter0_name + ' ' + self.counter1_name)
        self.phrase_and_diagnos0 = self.phrase_diagnostic_analysis(counter0_value)
        if reset_prev_counter0:
            self.prev_counter0 = 0
            self.emit(QtCore.SIGNAL('log-info'), "Counter0 was Reset")
        else:
            self.prev_counter0 = LJ_counter0[0]
        self.emit(QtCore.SIGNAL('log-info'), "Counter0- " + self.phrase_and_diagnos0 + " - " + str(counter0_value))

        if self.counter1_name.lower() != "none" and self.counter1_name: # **Check if counter1 has a name (if not don't check its value)
            LJ_counter = LJ.readCounter()
            # print("Total Counter1 is:" + str(LJ_counter))
            LJ_counter1_t = int(str(LJ_counter).strip('[]'))
            if LJ_counter1_t >= 60000:
                print("Total Counter1 is:" + str(LJ_counter1_t))
                LJ.resetCounter1()
                reset_prev_counter1 = True
            counter_value = LJ_counter[0] - self.prev_counter
            if self.counter1_name == self.counter0_name: # ** if Counter1 & Counter 0 have the same name then counter 1 is recording the number of times there was a reset in the application
                self.phrase_and_diagnos = 'Reset ' + str(counter_value/2) + ' time\s'
                self.emit(QtCore.SIGNAL('log-info'), "Counter1- " + self.phrase_and_diagnos)
            else: # ** 2 different application are being tested
                self.phrase_and_diagnos = self.phrase_diagnostic_analysis(counter_value)
                self.emit(QtCore.SIGNAL('log-info'), "Counter1- " + self.phrase_and_diagnos + " - " + str(counter_value))
            if reset_prev_counter1:
                self.prev_counter = 0
                self.emit(QtCore.SIGNAL('log-info'), "Counter1 was Reset")
            else:
                self.prev_counter = LJ_counter[0]


    def close(self):
        self.wait(3000)
        self.quit()
        #self.wait()
                
                               
class EvaluationBoard(HWmanager):
    
    global PHRASES, DIAGNOSTIC, LJ

    @dict_per_board
    def start(self, phrase_diag_dicts):
        self.PHRASES, self.DIAGNOSTIC = phrase_diag_dicts
        check_labjack_connection()      # decorator

        

    def close(self):
        global LJ
        # if self.EBStatus == 'Started':

        #self.logger.close()
        #LJ.closeConnectionWithHw()



        # self.logger.wait(2000)
        # self.logger.quit()
        #self.logger.stop()
        # self.logger.wait()
        # self.logger.terminate()


    def phrase_diagnostic_analysis(self, value=0):        # make sure value is an integer
        print(value)
        if (value >> 0x5) != 0:
            if self.DIAGNOSTIC[0]=="old":
                try:
                    string_to_print_DIAGNOSTIC=self.DIAGNOSTIC[value >> 0x5]
                except LookupError:
                    return ''.join(["undefined value"])
            else:
                string_to_print_DIAGNOSTIC = self.print_DIAGNOSTIC(value,self.DIAGNOSTIC)
        try:
            if (value & 0x1F) == 0 and (value >> 0x5) == 0:
                return ' '.join(["No Recognition"])
            elif (value & 0x1F) == 0 and (value >> 0x5) != 0:
                return ' '.join(["No Recognition",string_to_print_DIAGNOSTIC])
            elif (value & 0x1F) != 0 and (value >> 0x5) == 0:
                return ' '.join(["Recognized!", self.PHRASES[value & 0x1F]])
            else:
                return ' '.join([self.PHRASES[value & 0x1F], string_to_print_DIAGNOSTIC])
        except LookupError:
            return ''.join(["undefined value"])
        
        
    def logger(self, counter0_name, counter1_name): # ** recieve counter names
        self.logger = LoggerEB(self.phrase_diagnostic_analysis, counter0_name, counter1_name)
        return self.logger
    
    


# threads inheritance
    def print_DIAGNOSTIC(self,value,origDIAGNOSTIC):
        newvalue = value >> 0x5
        newstring = ""
        newlist=[]
        pivot = 1
        cmd_reference = {'cmd1': 1, 'cmd2': 2, 'cmd3': 4, 'cmd4': 8, 'cmd5': 16,}
        for i in range(1, 6):
            if (pivot & newvalue) != 0:
                newlist.append("cmd" + str(i))
            pivot = pivot << 0x1

        for j in range(len(newlist)):
            newstring = newstring + str(origDIAGNOSTIC[(cmd_reference[str(newlist[j])])]) + ', '
        return newstring