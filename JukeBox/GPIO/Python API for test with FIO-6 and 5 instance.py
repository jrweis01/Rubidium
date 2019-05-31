'''
Created on 13 11 2014

@author: mshaul
'''
import gpio
import time 

if __name__ == '__main__':

    MyLabjack = gpio.labjack()
    print(MyLabjack.verifyConnectionWithHw())   
    print(MyLabjack.readCounter())
    
    for i in range(256): 
        MyLabjack.setPulse()
        
    print(MyLabjack.readCounter())
    MyLabjack.closeConnectionWithHw()
    