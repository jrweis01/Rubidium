'''
Created on 13 11 2014

@author: Moshe Shaul

Purpose: create High level direver for Labjack U3-HV module upon U3 class.
Reveision:1.0
Revision history:
08/01/2015: 1.0 Moshe Shaul: First revision
'''

import u3

class LabJack:
        
        def __init__(self):
            self.labjackModule= u3.U3()
            self.labjackModule.configTimerClock(2, 0) #Clock configuration to 48 MHz (Default) according to Labjack user manual section 5.2.4
            self.labjackModule.configIO(EnableCounter1=1, EnableCounter0=1,TimerCounterPinOffset = 8) # Configure EIO-0 to act as counter (1)
                                                                                    # according to Labjack user manual section 2.9      
        def verifyConnectionWithHw(self): # verify logical connection with Labjack 
            self.labjackModule.setName("Rubidium LabJack U3_HV")    # write the name to Labjack
            labjackName=self.labjackModule.getName()                # Read labjack name
            if (labjackName =='Rubidium LabJack U3_HV'):
                return True
            else:
                return False
            
        def readCounter(self):  # Return the content counter 1
            return self.labjackModule.getFeedback(u3.Counter1()) 

        def readCounter0(self):  # Return the content counter 0
            return self.labjackModule.getFeedback(u3.Counter0())

        def resetCounter1(self): # Reset the content counter 1
            return self.labjackModule.getFeedback(u3.Counter1(Reset = True))

        def resetCounter0(self):  # Reset the content counter 0
            return self.labjackModule.getFeedback(u3.Counter0(Reset=True))

        def closeConnectionWithHw(self): # Close the connection with labjack
            self.labjackModule.close()   