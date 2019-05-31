from PyQt4 import QtGui # Import the PyQt4 module we'll need
import sys # We need sys so that we can pass argv to QApplication
import GUI # This file holds our MainWindow and all design related things
            # it also keeps events etc that we defined in Qt Designer
#import thread
from Listener import *


class ListenerAPP(QtGui.QMainWindow, GUI.Ui_MainWindow):
    def __init__(self):
        # Explaining super is out of the scope of this article
        # So please google it if you're not familar with it
        # Simple reason why we use it here is that it allows us to
        # access variables, methods etc in the design.py file
        super(self.__class__, self).__init__()
        self.setupUi(self)  # This sets up layout and widgets that are defined

        self.bttnStop.setEnabled(False)
        self.bttnrestart.setEnabled(False)

        self.bttnStart.clicked.connect(self.start_listening())
        self.bttnClose.clicked.connect(self.closeEvent)
        self.bttnStop.clicked.connect(self.stop_listening())
        #self.txtListen_time.changeEvent.connect(self.Update_hours)

    def update_hours(self):
        self.txtCalculated_hours.setText(self.txtListen_time.value()/100/60)

    def stop_listening(self):
        Listening_Loop.Stop_Loop()

    def start_listening(self):
        self.bttnrestart.setEnabled(False)
        self.bttnStop.setEnabled(True)
        #self.bttnrestart.setEnabled(True)
        self.txtCalculated_hours.setText(str(round(self.txtListen_time.value()/60/60,ndigits=1)))
        #print(str(round(self.txtListen_time.value()/60/60,ndigits=1)))
        sleepTime = self.txtSleep_time.value()
        if sleepTime <= 0:
            sleepTime = 0.5
        i = 0
        self.continue_loop = 1
        #print ("start loop: %s" % (time.ctime(time.time())))
        thread.start_new_thread(Listening_Loop.Start_Loop,(self.txtListen_time.value(), sleepTime))

        #t1 = threading.Thread(target=Listening_Loop.Start_Loop(self.txtListen_time.value(),sleepTime))
        #t1.start()
        #print("end loop: %s" % (time.ctime(time.time())))
        self.bttnrestart.setEnabled(True)

    def closeEvent(self, event):
        self.close()

def main():
    app = QtGui.QApplication(sys.argv)  # A new instance of QApplication
    form = ListenerAPP()                 # We set the form to be our ExampleApp (design)
    form.show()                         # Show the form
    ret = app.exec_()                         # and execute the app
    sys.exit(ret)


if __name__ == '__main__':              # if we're running file directly and not importing it
    main()