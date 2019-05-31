'''
Created on 13 11 2014

@author: 
'''

import u3
import sys

class labjack:
        
        def __init__(self):
            self.labjackModule= u3.U3()
            self.labjackModule.configTimerClock(2, 0)                               #Clock configuration to 48 MHz (Default) according to Labjack user manual section 5.2.4
            self.labjackModule.configIO(EnableCounter1=1,TimerCounterPinOffset = 6) # Configure EIO-0 to act as counter (1) 

        def readCounter(self):  # Return the content counter 1
            return self.labjackModule.getFeedback(u3.Counter1())
        
        def resetCounter(self): # Reset the content counter 1
            return self.labjackModule.getFeedback(u3.Counter1(Reset = True)) 
                     
        def closeConnectionWithHw(self): # Close the connection with labjack
            self.labjackModule.close()   
            
            
if __name__ == "__main__":
    
    LJ = labjack()
    
    print(LJ.readCounter())     # check print to command
    #sys.stdout.write(str(1024))
    LJ.closeConnectionWithHw()

    #sys.exit(app.exec_())