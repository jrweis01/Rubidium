from time import sleep

from PyQt4 import QtCore

from Devices import u3
from Devices.Phrases_and_Diagnostics import PRJ_DICT

global continue_listening

def check_labjack_connection(Counter_0_Name, Counter_1_Name):
    global LJ

    LJ = LabJack(Counter_0_Name, Counter_1_Name)
    assert LJ.verifyConnectionWithHw(), "connection failure, try Labjack reconnection"
    LJ.resetCounter0()
    LJ.resetCounter1()

    return LJ

class LabJack:
    def __init__(self,Counter_0_Name, Counter_1_Name):
        self.labjackModule = u3.U3()
        self.labjackModule.configTimerClock(2,0)  # Clock configuration to 48 MHz (Default) according to Labjack user manual section 5.2.4
        self.labjackModule.configIO(TimerCounterPinOffset=8)
        # if Counter_0_Name != "" and Counter_0_Name.lower() != "none":
        #     self.labjackModule.configIO(EnableCounter0=1)
        # else:
        #     self.labjackModule.configIO(EnableCounter0=0)
        #
        # if Counter_1_Name != "" and Counter_1_Name.lower() != "none":
        #     self.labjackModule.configIO(EnableCounter1=1)
        # else:
        #     self.labjackModule.configIO(EnableCounter1=0)
        self.labjackModule.configIO(EnableCounter1=1, EnableCounter0=1, TimerCounterPinOffset=8)  # Configure EIO-0 to act as counter (1)
        # according to Labjack user manual section 2.9

    def verifyConnectionWithHw(self):  # verify logical connection with Labjack
        self.labjackModule.setName("Rubidium LabJack U3_HV")  # write the name to Labjack
        labjackName = self.labjackModule.getName()  # Read labjack name
        if (labjackName == 'Rubidium LabJack U3_HV'):
            return True
        else:
            return False

    def readCounter(self):  # Return the content counter 1
        return self.labjackModule.getFeedback(u3.Counter1())

    def readCounter0(self):  # Return the content counter 0
        return self.labjackModule.getFeedback(u3.Counter0())

    def resetCounter1(self):  # Reset the content counter 1
        return self.labjackModule.getFeedback(u3.Counter1(Reset=True))

    def resetCounter0(self):  # Reset the content counter 1
        return self.labjackModule.getFeedback(u3.Counter0(Reset=True))

    def closeConnectionWithHw(self):  # Close the connection with labjack
        self.labjackModule.close()


# a decorator that returns the relevant "phrases" and "diagnosis" dictionaries according to an argument,
# which based on the project being tested (e.g. Fitbit or Jabra or Fitness etc')
def dict_per_board(func):
    def phrase_diag_dicts(dev, client):
        return func(dev, PRJ_DICT[client])

    return phrase_diag_dicts


class LoggerEB(QtCore.QThread):  # LoggerThread
    # **Get the counter names in order to determine how many counters to use and how many applications are being tested.
    def __init__(self, phrase_diagnostic_analysis, counter0_name, counter1_name):

        # try with or without super
        super(LoggerEB, self).__init__()
        # self.wav_player = wav_player
        self.phrase_diagnostic_analysis = phrase_diagnostic_analysis
        self.phrase_and_diagnos = None
        self.prev_counter = 0
        self.prev_counter0 = 0
        self.counter0_name = counter0_name
        self.counter1_name = counter1_name

    def run(self):
        global LJ
        global RECOGNIZED_PHRASE_LJ
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

        print("EB-CounterName1 is:" + str(self.counter1_name))
        if self.counter1_name:  # **Check if counter1 has a name (if not don't check its value)
            LJ_counter = LJ.readCounter()
            LJ_counter1_t = int(str(LJ_counter).strip('[]'))
            if LJ_counter1_t >= 60000:
                print("Total Counter1 is:" + str(LJ_counter1_t))
                LJ.resetCounter1()
                reset_prev_counter1 = True
            counter_value = LJ_counter[0] - self.prev_counter
            if self.counter1_name == self.counter0_name:  # ** if Counter1 & Counter 0 have the same name then counter 1 is recording the number of times there was a reset in the application
                self.phrase_and_diagnos = 'Reset ' + str(counter_value) + ' time\s'
            else:  # ** 2 diffrent applications are being tested

                self.phrase_and_diagnos = self.phrase_diagnostic_analysis(counter_value)
            if reset_prev_counter1:
                self.prev_counter = 0
                self.emit(QtCore.SIGNAL('log-info'), "Counter1 was Reset")
            else:
                self.prev_counter = LJ_counter[0]


    def close(self):
        self.wait(3000)
        self.quit()
        self.terminate()


class EvaluationBoard():
    global PHRASES, DIAGNOSTIC, LJ

    @dict_per_board
    def start(self, phrase_diag_dicts):
        self.PHRASES, self.DIAGNOSTIC = phrase_diag_dicts
        check_labjack_connection(None, None)  # decorator

    def phrase_diagnostic_analysis(self, value=0):  # make sure value is an integer
        # print(value)
        if (value >> 0x5) != 0:
            if self.DIAGNOSTIC[0] == "old":
                try:
                    string_to_print_DIAGNOSTIC=self.DIAGNOSTIC[value >> 0x5]
                except LookupError:
                    return ''.join(["undefined value"])
            else:
                string_to_print_DIAGNOSTIC = self.print_DIAGNOSTIC(value, self.DIAGNOSTIC)
        try:
            if (value & 0x1F) == 0 and (value >> 0x5) == 0:
                return ' '.join(["No Recognition - LJ"])
            elif (value & 0x1F) == 0 and (value >> 0x5) != 0:
                return ' '.join(["No Recognition - LJ-", string_to_print_DIAGNOSTIC])
            elif (value & 0x1F) != 0 and (value >> 0x5) == 0:
                return ' '.join(["Recognized! - LJ-", self.PHRASES[value & 0x1F]])
            else:
                return ' '.join([self.PHRASES[value & 0x1F], string_to_print_DIAGNOSTIC])
        except LookupError:
            # print("Diagnostic is new; value is: " + str(value))
            return ''.join(["undefined value - LJ-"])



    # threads inheritance
    def print_DIAGNOSTIC(self, value, origDIAGNOSTIC):
        newvalue = value >> 0x5
        newstring = ""
        newlist = []
        pivot = 1
        cmd_reference = {'cmd1': 1, 'cmd2': 2, 'cmd3': 4, 'cmd4': 8, 'cmd5': 16, }
        for i in range(1, 6):
            if (pivot & newvalue) != 0:
                newlist.append("cmd" + str(i))
            pivot = pivot << 0x1

        for j in range(len(newlist)):
            newstring = newstring + str(origDIAGNOSTIC[(cmd_reference[str(newlist[j])])]) + ', '
        return newstring


class Listening_Loop(QtCore.QThread):
    global check_interval

    def __init__(self, dict_name, counter0_name, counter1_name,log_every_time_checked = False, check_interval =0.2, listening_time=5000):
        super(Listening_Loop, self).__init__()

        self.check_interval = check_interval
        self.dict_name = dict_name
        self.log_every_time_checked = log_every_time_checked
        self.counter0_name = counter0_name
        self.counter1_name = counter1_name
        self.listening_time = listening_time

    def run(self):
        global LJ, continue_listening, check_interval, EB, RECOGNIZED_PHRASE_LJ

        print("starting to run the LabJack listner")
        check_interval = self.check_interval

        EB = EvaluationBoard()
        EB.start(self.dict_name)

        cnt0 = 0
        prev_cnt0 = 0
        cnt1 = 0
        prev_cnt1 = 0
        continue_listening = True
        i = 0
        recognition = 0
        self.running_time = 0
        # print("Listening duration: " + str(int(self.listening_time))+ ' seconds')
        self.emit(QtCore.SIGNAL('log-info'), 'LabJack will be checked every ' + str(check_interval) + ' seconds')
        while continue_listening and i < (int(self.listening_time) / check_interval):

            sleep(check_interval)
            i = i + check_interval
            LJ_counter0 = LJ.readCounter0()
            LJ_counter1 = LJ.readCounter()
            # print(LJ_counter1)
            if cnt0 != LJ_counter0[0] or cnt1 != LJ_counter1[0]:
                # need to check if the counter is still being updated or not
                # we will check every 50ms and once the counters stop changing the results will be considered final
                while True:
                    # print("Waiting for counter to be fully updated")
                    sleep(0.07)
                    temp_counter0 = LJ.readCounter0()
                    temp_counter1 = LJ.readCounter()
                    if temp_counter0 == LJ_counter0 and temp_counter1 == LJ_counter1:
                        break
                    else:
                        # print("updating counter, counter is: " + str(temp_counter0) + ", " + str(temp_counter1))
                        LJ_counter0 = temp_counter0
                        LJ_counter1 = temp_counter1
                LJ_counter0_t = int(str(LJ_counter0).strip('[]'))
                reset_prev_counter0 = False
                if LJ_counter0_t >= 500:
                    print("Total Counter0 is:" + str(LJ_counter0_t))
                    LJ.resetCounter0()
                    reset_prev_counter0 = True
                cnt0 = LJ_counter0[0]
                res0 = cnt0 - prev_cnt0
                if reset_prev_counter0:
                    prev_cnt0 = 0
                else:
                    prev_cnt0 = cnt0
                if res0 > 0:
                    RECOGNIZED_PHRASE_LJ = EB.phrase_diagnostic_analysis(res0) + ' - ' + str(res0)
                    # print(RECOGNIZED_PHRASE_LJ)
                    print("counter0: " + str(res0))
                    self.emit(QtCore.SIGNAL('recognized_LJ0'))
                    #self.emit(QtCore.SIGNAL('log-info'), diagnostic0 + ' - ' + str(res0))
                if self.counter1_name and self.counter1_name != "None":  # **Check if counter1 has a name (if not don't check its value)
                    # print("counter 1 name is:" + str(self.counter1_name))
                    LJ_counter1_t = int(str(LJ_counter1).strip('[]'))
                    reset_prev_counter1 = False
                    if LJ_counter1_t >= 500:
                        print("Total Counter1 is:" + str(LJ_counter1_t))
                        LJ.resetCounter1()
                        reset_prev_counter1 = True
                    cnt1 = LJ_counter1[0]
                    res1 = cnt1 - prev_cnt1
                    if reset_prev_counter1:
                        prev_cnt1 = 0
                    else:
                        prev_cnt1 = cnt1
                    if res1 > 0:
                        if self.counter1_name == self.counter0_name:  # ** if Counter1 & Counter 0 have the same name then counter 1 is recording the number of times there was a reset in the application
                            diagnostic1 = ' LJ- Reset ' + str(res1/2) + ' time\s'
                        else:  # ** 2 diffrent application are being tested
                            diagnostic1 = EB.phrase_diagnostic_analysis(res1) + ' - ' + str(res1)
                        RECOGNIZED_PHRASE_LJ = diagnostic1
                        # print(RECOGNIZED_PHRASE_LJ)
                        print("counter1: " + str(res1))
                        self.emit(QtCore.SIGNAL('recognized_LJ1'))
                        #self.emit(QtCore.SIGNAL('log-info'), diagnostic1 + ' - ' + str(res1))

                recognition = recognition + 1

            if self.log_every_time_checked:
                # Print the value of the LabJack counter to the log even if it didn't change at all
                self.emit(QtCore.SIGNAL('log-info'),'LabJack Counter: ' + str(LJ_counter1[0]))
                self.emit(QtCore.SIGNAL('log-info'),'LabJack Counter: ' + str(LJ_counter0[0]))
        # print(continue_listening)
        # print(str(i))
        # print(str(int(self.listening_time) / check_interval))
        print("Finished LISTENING!")
        if i >= (int(self.listening_time) / check_interval):
            print("Automatically closing after Listening time is over")
            self.emit(QtCore.SIGNAL('Listening-done'))
        LJ.closeConnectionWithHw()
        self.stop_loop()
        self.close()





    def get_recognized_phrase_LJ(self):
        global RECOGNIZED_PHRASE_LJ
        return RECOGNIZED_PHRASE_LJ

    def close(self):
        global EB
        print('Closing LabJack connection')
        self.terminate()
        print('LabJack connection closed')

    def stop_loop(self):
        global continue_listening
        print("stop LabJack Listening")
        continue_listening = False