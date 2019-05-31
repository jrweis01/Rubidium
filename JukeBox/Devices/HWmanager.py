'''

'''
import abc

class HWmanager(object):
    __metaclass__ = abc.ABCMeta
      
    @staticmethod
    def set_device(tested_hw):
        
        from Devices.Board import EvaluationBoard
        from Devices.phone import MobilePhone
        
        if tested_hw == "MP":
            return MobilePhone()
        elif tested_hw == "EB":
            return EvaluationBoard()#(dict_name)
        else:
            return
        
                 
    @abc.abstractmethod
    def start(self):
        return
        #pass
    
    
    @abc.abstractmethod
    def close(self):
        return
        #pass
    
    
    @abc.abstractmethod
    def logger(self):
        return
        #pass
    
    