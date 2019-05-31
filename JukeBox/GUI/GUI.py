# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'P:\share1\users\josh\JukeboxAuto\LabJack_Listener.ui'
#
# Created: Tue Jun 14 15:43:37 2016
#      by: PyQt4 UI code generator 4.11.2
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName(_fromUtf8("MainWindow"))
        MainWindow.resize(417, 186)
        self.centralwidget = QtGui.QWidget(MainWindow)
        self.centralwidget.setObjectName(_fromUtf8("centralwidget"))
        self.layoutWidget = QtGui.QWidget(self.centralwidget)
        self.layoutWidget.setGeometry(QtCore.QRect(20, 70, 273, 24))
        self.layoutWidget.setObjectName(_fromUtf8("layoutWidget"))
        self.horizontalLayout = QtGui.QHBoxLayout(self.layoutWidget)
        self.horizontalLayout.setMargin(0)
        self.horizontalLayout.setObjectName(_fromUtf8("horizontalLayout"))
        self.label_2 = QtGui.QLabel(self.layoutWidget)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.horizontalLayout.addWidget(self.label_2)
        self.txtListen_time = QtGui.QDoubleSpinBox(self.layoutWidget)
        self.txtListen_time.setDecimals(0)
        self.txtListen_time.setMaximum(7000000.0)
        self.txtListen_time.setProperty("value", 30000.0)
        self.txtListen_time.setObjectName(_fromUtf8("txtListen_time"))
        self.horizontalLayout.addWidget(self.txtListen_time)
        self.label_3 = QtGui.QLabel(self.layoutWidget)
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.horizontalLayout.addWidget(self.label_3)
        self.txtCalculated_hours = QtGui.QLabel(self.layoutWidget)
        self.txtCalculated_hours.setEnabled(False)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Preferred, QtGui.QSizePolicy.Preferred)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.txtCalculated_hours.sizePolicy().hasHeightForWidth())
        self.txtCalculated_hours.setSizePolicy(sizePolicy)
        self.txtCalculated_hours.setLineWidth(6)
        self.txtCalculated_hours.setObjectName(_fromUtf8("txtCalculated_hours"))
        self.horizontalLayout.addWidget(self.txtCalculated_hours)
        self.layoutWidget1 = QtGui.QWidget(self.centralwidget)
        self.layoutWidget1.setGeometry(QtCore.QRect(20, 110, 204, 24))
        self.layoutWidget1.setObjectName(_fromUtf8("layoutWidget1"))
        self.horizontalLayout_2 = QtGui.QHBoxLayout(self.layoutWidget1)
        self.horizontalLayout_2.setMargin(0)
        self.horizontalLayout_2.setObjectName(_fromUtf8("horizontalLayout_2"))
        self.label = QtGui.QLabel(self.layoutWidget1)
        self.label.setObjectName(_fromUtf8("label"))
        self.horizontalLayout_2.addWidget(self.label)
        self.txtSleep_time = QtGui.QDoubleSpinBox(self.layoutWidget1)
        self.txtSleep_time.setDecimals(1)
        self.txtSleep_time.setObjectName(_fromUtf8("txtSleep_time"))
        self.horizontalLayout_2.addWidget(self.txtSleep_time)
        self.layoutWidget2 = QtGui.QWidget(self.centralwidget)
        self.layoutWidget2.setGeometry(QtCore.QRect(10, 150, 395, 30))
        self.layoutWidget2.setObjectName(_fromUtf8("layoutWidget2"))
        self.horizontalLayout_3 = QtGui.QHBoxLayout(self.layoutWidget2)
        self.horizontalLayout_3.setMargin(0)
        self.horizontalLayout_3.setObjectName(_fromUtf8("horizontalLayout_3"))
        self.bttnStart = QtGui.QPushButton(self.layoutWidget2)
        self.bttnStart.setObjectName(_fromUtf8("bttnStart"))
        self.horizontalLayout_3.addWidget(self.bttnStart)
        self.bttnStop = QtGui.QPushButton(self.layoutWidget2)
        font = QtGui.QFont()
        font.setStyleStrategy(QtGui.QFont.PreferAntialias)
        self.bttnStop.setFont(font)
        self.bttnStop.setFocusPolicy(QtCore.Qt.WheelFocus)
        self.bttnStop.setObjectName(_fromUtf8("bttnStop"))
        self.horizontalLayout_3.addWidget(self.bttnStop)
        self.bttnClose = QtGui.QPushButton(self.layoutWidget2)
        self.bttnClose.setObjectName(_fromUtf8("bttnClose"))
        self.horizontalLayout_3.addWidget(self.bttnClose)
        self.bttnrestart = QtGui.QPushButton(self.layoutWidget2)
        self.bttnrestart.setObjectName(_fromUtf8("bttnrestart"))
        self.horizontalLayout_3.addWidget(self.bttnrestart)
        self.layoutWidget3 = QtGui.QWidget(self.centralwidget)
        self.layoutWidget3.setGeometry(QtCore.QRect(20, 30, 227, 24))
        self.layoutWidget3.setObjectName(_fromUtf8("layoutWidget3"))
        self.horizontalLayout_4 = QtGui.QHBoxLayout(self.layoutWidget3)
        self.horizontalLayout_4.setMargin(0)
        self.horizontalLayout_4.setObjectName(_fromUtf8("horizontalLayout_4"))
        self.lblBoardType = QtGui.QLabel(self.layoutWidget3)
        self.lblBoardType.setObjectName(_fromUtf8("lblBoardType"))
        self.horizontalLayout_4.addWidget(self.lblBoardType)
        self.cmbBoardType = QtGui.QComboBox(self.layoutWidget3)
        self.cmbBoardType.setLocale(QtCore.QLocale(QtCore.QLocale.English, QtCore.QLocale.UnitedStates))
        self.cmbBoardType.setEditable(True)
        self.cmbBoardType.setObjectName(_fromUtf8("cmbBoardType"))
        self.cmbBoardType.addItem(_fromUtf8(""))
        self.cmbBoardType.addItem(_fromUtf8(""))
        self.cmbBoardType.addItem(_fromUtf8(""))
        self.horizontalLayout_4.addWidget(self.cmbBoardType)
        MainWindow.setCentralWidget(self.centralwidget)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow", None))
        self.label_2.setText(_translate("MainWindow", "Length of time to listen", None))
        self.label_3.setText(_translate("MainWindow", "Hours", None))
        self.txtCalculated_hours.setText(_translate("MainWindow", "00", None))
        self.label.setText(_translate("MainWindow", "Counter check frequency", None))
        self.bttnStart.setText(_translate("MainWindow", "Start", None))
        self.bttnStop.setText(_translate("MainWindow", "Stop", None))
        self.bttnClose.setText(_translate("MainWindow", "Close", None))
        self.bttnrestart.setText(_translate("MainWindow", "Re-Start", None))
        self.lblBoardType.setText(_translate("MainWindow", "Choose the type of board", None))
        self.cmbBoardType.setItemText(0, _translate("MainWindow", "ST", None))
        self.cmbBoardType.setItemText(1, _translate("MainWindow", "CSR", None))
        self.cmbBoardType.setItemText(2, _translate("MainWindow", "Android", None))

