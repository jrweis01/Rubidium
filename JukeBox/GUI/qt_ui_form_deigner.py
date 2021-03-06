# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'qt_ui_form_deigner.ui'
#
# Created by: PyQt4 UI code generator 4.11.4
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

class Ui_RubiJukeBox(object):
    def setupUi(self, RubiJukeBox):
        RubiJukeBox.setObjectName(_fromUtf8("RubiJukeBox"))
        RubiJukeBox.resize(1361, 780)
        self.gridLayout_4 = QtGui.QGridLayout(RubiJukeBox)
        self.gridLayout_4.setObjectName(_fromUtf8("gridLayout_4"))
        self.Tabs = QtGui.QTabWidget(RubiJukeBox)
        self.Tabs.setSizeIncrement(QtCore.QSize(2, 2))
        self.Tabs.setAutoFillBackground(True)
        self.Tabs.setObjectName(_fromUtf8("Tabs"))
        self.Player = QtGui.QWidget()
        self.Player.setLocale(QtCore.QLocale(QtCore.QLocale.English, QtCore.QLocale.UnitedStates))
        self.Player.setObjectName(_fromUtf8("Player"))
        self.groupBox = QtGui.QGroupBox(self.Player)
        self.groupBox.setGeometry(QtCore.QRect(20, 20, 591, 531))
        self.groupBox.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.groupBox.setObjectName(_fromUtf8("groupBox"))
        self.btn_puase = QtGui.QPushButton(self.groupBox)
        self.btn_puase.setGeometry(QtCore.QRect(110, 420, 93, 28))
        self.btn_puase.setObjectName(_fromUtf8("btn_puase"))
        self.btn_play = QtGui.QPushButton(self.groupBox)
        self.btn_play.setGeometry(QtCore.QRect(10, 420, 93, 28))
        self.btn_play.setObjectName(_fromUtf8("btn_play"))
        self.should_delay_ASR = QtGui.QCheckBox(self.groupBox)
        self.should_delay_ASR.setGeometry(QtCore.QRect(10, 392, 140, 20))
        self.should_delay_ASR.setMaximumSize(QtCore.QSize(140, 16777215))
        self.should_delay_ASR.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.should_delay_ASR.setObjectName(_fromUtf8("should_delay_ASR"))
        self.label_9 = QtGui.QLabel(self.groupBox)
        self.label_9.setGeometry(QtCore.QRect(473, 490, 16, 16))
        self.label_9.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.label_9.setAlignment(QtCore.Qt.AlignCenter)
        self.label_9.setObjectName(_fromUtf8("label_9"))
        self.btn_addWavDir = QtGui.QPushButton(self.groupBox)
        self.btn_addWavDir.setGeometry(QtCore.QRect(486, 28, 93, 28))
        self.btn_addWavDir.setAutoDefault(False)
        self.btn_addWavDir.setDefault(False)
        self.btn_addWavDir.setFlat(False)
        self.btn_addWavDir.setObjectName(_fromUtf8("btn_addWavDir"))
        self.should_delay = QtGui.QCheckBox(self.groupBox)
        self.should_delay.setGeometry(QtCore.QRect(10, 363, 149, 20))
        self.should_delay.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.should_delay.setObjectName(_fromUtf8("should_delay"))
        self.lbl_numOfWavs = QtGui.QLabel(self.groupBox)
        self.lbl_numOfWavs.setGeometry(QtCore.QRect(8, 339, 91, 18))
        font = QtGui.QFont()
        font.setPointSize(9)
        font.setBold(False)
        font.setWeight(50)
        self.lbl_numOfWavs.setFont(font)
        self.lbl_numOfWavs.setObjectName(_fromUtf8("lbl_numOfWavs"))
        self.wavsVolSpinBox = QtGui.QDoubleSpinBox(self.groupBox)
        self.wavsVolSpinBox.setGeometry(QtCore.QRect(407, 491, 59, 22))
        self.wavsVolSpinBox.setDecimals(1)
        self.wavsVolSpinBox.setMinimum(-200.0)
        self.wavsVolSpinBox.setMaximum(200.0)
        self.wavsVolSpinBox.setObjectName(_fromUtf8("wavsVolSpinBox"))
        self.btn_addWavFile = QtGui.QPushButton(self.groupBox)
        self.btn_addWavFile.setGeometry(QtCore.QRect(486, 63, 93, 28))
        self.btn_addWavFile.setAutoDefault(False)
        self.btn_addWavFile.setDefault(False)
        self.btn_addWavFile.setFlat(False)
        self.btn_addWavFile.setObjectName(_fromUtf8("btn_addWavFile"))
        self.btn_stop = QtGui.QPushButton(self.groupBox)
        self.btn_stop.setEnabled(False)
        self.btn_stop.setGeometry(QtCore.QRect(227, 420, 93, 28))
        self.btn_stop.setObjectName(_fromUtf8("btn_stop"))
        self.label_3 = QtGui.QLabel(self.groupBox)
        self.label_3.setGeometry(QtCore.QRect(240, 460, 21, 16))
        self.label_3.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.label_3.setAlignment(QtCore.Qt.AlignCenter)
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.bttn_addWavList = QtGui.QPushButton(self.groupBox)
        self.bttn_addWavList.setGeometry(QtCore.QRect(486, 98, 93, 28))
        self.bttn_addWavList.setObjectName(_fromUtf8("bttn_addWavList"))
        self.btn_removeAll = QtGui.QPushButton(self.groupBox)
        self.btn_removeAll.setGeometry(QtCore.QRect(490, 300, 93, 28))
        self.btn_removeAll.setObjectName(_fromUtf8("btn_removeAll"))
        self.btn_removeWavDir = QtGui.QPushButton(self.groupBox)
        self.btn_removeWavDir.setGeometry(QtCore.QRect(490, 260, 93, 28))
        self.btn_removeWavDir.setObjectName(_fromUtf8("btn_removeWavDir"))
        self.lst_wavList = QtGui.QListWidget(self.groupBox)
        self.lst_wavList.setGeometry(QtCore.QRect(12, 28, 467, 301))
        self.lst_wavList.setSelectionMode(QtGui.QAbstractItemView.ExtendedSelection)
        self.lst_wavList.setResizeMode(QtGui.QListView.Fixed)
        self.lst_wavList.setObjectName(_fromUtf8("lst_wavList"))
        self.label = QtGui.QLabel(self.groupBox)
        self.label.setGeometry(QtCore.QRect(20, 490, 60, 16))
        self.label.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.label.setAlignment(QtCore.Qt.AlignCenter)
        self.label.setObjectName(_fromUtf8("label"))
        self.wavsVolSlider = QtGui.QSlider(self.groupBox)
        self.wavsVolSlider.setGeometry(QtCore.QRect(120, 490, 271, 24))
        self.wavsVolSlider.setMinimum(-50)
        self.wavsVolSlider.setMaximum(50)
        self.wavsVolSlider.setSingleStep(0)
        self.wavsVolSlider.setPageStep(5)
        self.wavsVolSlider.setTracking(True)
        self.wavsVolSlider.setOrientation(QtCore.Qt.Horizontal)
        self.wavsVolSlider.setInvertedAppearance(False)
        self.wavsVolSlider.setInvertedControls(False)
        self.wavsVolSlider.setTickPosition(QtGui.QSlider.TicksAbove)
        self.wavsVolSlider.setTickInterval(10)
        self.wavsVolSlider.setObjectName(_fromUtf8("wavsVolSlider"))
        self.label_6 = QtGui.QLabel(self.groupBox)
        self.label_6.setGeometry(QtCore.QRect(100, 460, 33, 16))
        self.label_6.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.label_6.setAlignment(QtCore.Qt.AlignCenter)
        self.label_6.setObjectName(_fromUtf8("label_6"))
        self.label_8 = QtGui.QLabel(self.groupBox)
        self.label_8.setGeometry(QtCore.QRect(360, 460, 36, 16))
        self.label_8.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.label_8.setAlignment(QtCore.Qt.AlignCenter)
        self.label_8.setObjectName(_fromUtf8("label_8"))
        self.spin_delay_time = QtGui.QSpinBox(self.groupBox)
        self.spin_delay_time.setEnabled(False)
        self.spin_delay_time.setGeometry(QtCore.QRect(227, 362, 43, 22))
        self.spin_delay_time.setButtonSymbols(QtGui.QAbstractSpinBox.UpDownArrows)
        self.spin_delay_time.setMaximum(999)
        self.spin_delay_time.setProperty("value", 0)
        self.spin_delay_time.setObjectName(_fromUtf8("spin_delay_time"))
        self.btn_make_wav = QtGui.QPushButton(self.groupBox)
        self.btn_make_wav.setGeometry(QtCore.QRect(380, 420, 94, 28))
        self.btn_make_wav.setToolTip(_fromUtf8(""))
        self.btn_make_wav.setStatusTip(_fromUtf8(""))
        self.btn_make_wav.setWhatsThis(_fromUtf8(""))
        self.btn_make_wav.setCheckable(False)
        self.btn_make_wav.setFlat(False)
        self.btn_make_wav.setObjectName(_fromUtf8("btn_make_wav"))
        self.spin_delay_time_ASR = QtGui.QSpinBox(self.groupBox)
        self.spin_delay_time_ASR.setEnabled(False)
        self.spin_delay_time_ASR.setGeometry(QtCore.QRect(227, 391, 43, 22))
        self.spin_delay_time_ASR.setButtonSymbols(QtGui.QAbstractSpinBox.UpDownArrows)
        self.spin_delay_time_ASR.setMaximum(999)
        self.spin_delay_time_ASR.setProperty("value", 1)
        self.spin_delay_time_ASR.setObjectName(_fromUtf8("spin_delay_time_ASR"))
        self.groupBox_2 = QtGui.QGroupBox(self.Player)
        self.groupBox_2.setGeometry(QtCore.QRect(11, 557, 596, 161))
        self.groupBox_2.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.groupBox_2.setObjectName(_fromUtf8("groupBox_2"))
        self.noiseVolSpinBox = QtGui.QDoubleSpinBox(self.groupBox_2)
        self.noiseVolSpinBox.setGeometry(QtCore.QRect(490, 130, 59, 22))
        self.noiseVolSpinBox.setDecimals(1)
        self.noiseVolSpinBox.setMinimum(-200.0)
        self.noiseVolSpinBox.setMaximum(200.0)
        self.noiseVolSpinBox.setObjectName(_fromUtf8("noiseVolSpinBox"))
        self.label_5 = QtGui.QLabel(self.groupBox_2)
        self.label_5.setGeometry(QtCore.QRect(80, 110, 33, 16))
        self.label_5.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.label_5.setAlignment(QtCore.Qt.AlignCenter)
        self.label_5.setObjectName(_fromUtf8("label_5"))
        self.label_2 = QtGui.QLabel(self.groupBox_2)
        self.label_2.setGeometry(QtCore.QRect(10, 140, 56, 16))
        self.label_2.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.label_2.setAlignment(QtCore.Qt.AlignCenter)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.noiseVolSlider = QtGui.QSlider(self.groupBox_2)
        self.noiseVolSlider.setGeometry(QtCore.QRect(90, 140, 361, 24))
        self.noiseVolSlider.setMinimum(-50)
        self.noiseVolSlider.setMaximum(50)
        self.noiseVolSlider.setPageStep(5)
        self.noiseVolSlider.setOrientation(QtCore.Qt.Horizontal)
        self.noiseVolSlider.setTickPosition(QtGui.QSlider.TicksAbove)
        self.noiseVolSlider.setTickInterval(10)
        self.noiseVolSlider.setObjectName(_fromUtf8("noiseVolSlider"))
        self.btn_play_noise = QtGui.QPushButton(self.groupBox_2)
        self.btn_play_noise.setEnabled(False)
        self.btn_play_noise.setGeometry(QtCore.QRect(203, 71, 93, 28))
        self.btn_play_noise.setObjectName(_fromUtf8("btn_play_noise"))
        self.label_4 = QtGui.QLabel(self.groupBox_2)
        self.label_4.setGeometry(QtCore.QRect(260, 110, 21, 16))
        self.label_4.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.label_4.setAlignment(QtCore.Qt.AlignCenter)
        self.label_4.setObjectName(_fromUtf8("label_4"))
        self.lst_noiseList = QtGui.QListWidget(self.groupBox_2)
        self.lst_noiseList.setGeometry(QtCore.QRect(10, 30, 572, 31))
        self.lst_noiseList.setObjectName(_fromUtf8("lst_noiseList"))
        self.btn_choose_noise = QtGui.QPushButton(self.groupBox_2)
        self.btn_choose_noise.setEnabled(True)
        self.btn_choose_noise.setGeometry(QtCore.QRect(11, 71, 93, 28))
        self.btn_choose_noise.setObjectName(_fromUtf8("btn_choose_noise"))
        self.btn_stop_noise = QtGui.QPushButton(self.groupBox_2)
        self.btn_stop_noise.setEnabled(False)
        self.btn_stop_noise.setGeometry(QtCore.QRect(395, 71, 93, 28))
        self.btn_stop_noise.setObjectName(_fromUtf8("btn_stop_noise"))
        self.label_7 = QtGui.QLabel(self.groupBox_2)
        self.label_7.setGeometry(QtCore.QRect(423, 110, 36, 16))
        self.label_7.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.label_7.setAlignment(QtCore.Qt.AlignCenter)
        self.label_7.setObjectName(_fromUtf8("label_7"))
        self.groupBox_7 = QtGui.QGroupBox(self.Player)
        self.groupBox_7.setGeometry(QtCore.QRect(730, 350, 531, 161))
        self.groupBox_7.setObjectName(_fromUtf8("groupBox_7"))
        self.ChkBx_play_in_loop = QtGui.QCheckBox(self.groupBox_7)
        self.ChkBx_play_in_loop.setGeometry(QtCore.QRect(10, 30, 129, 20))
        self.ChkBx_play_in_loop.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.ChkBx_play_in_loop.setObjectName(_fromUtf8("ChkBx_play_in_loop"))
        self.chkBx_play_random_order = QtGui.QCheckBox(self.groupBox_7)
        self.chkBx_play_random_order.setGeometry(QtCore.QRect(10, 60, 221, 31))
        self.chkBx_play_random_order.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.chkBx_play_random_order.setObjectName(_fromUtf8("chkBx_play_random_order"))
        self.chkBx_randomize_delay = QtGui.QCheckBox(self.groupBox_7)
        self.chkBx_randomize_delay.setGeometry(QtCore.QRect(10, 110, 151, 17))
        self.chkBx_randomize_delay.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.chkBx_randomize_delay.setObjectName(_fromUtf8("chkBx_randomize_delay"))
        self.Delay_Mode = QtGui.QComboBox(self.groupBox_7)
        self.Delay_Mode.setGeometry(QtCore.QRect(340, 30, 121, 31))
        self.Delay_Mode.setObjectName(_fromUtf8("Delay_Mode"))
        self.label_16 = QtGui.QLabel(self.groupBox_7)
        self.label_16.setGeometry(QtCore.QRect(230, 30, 111, 31))
        self.label_16.setObjectName(_fromUtf8("label_16"))
        self.groupBox_4 = QtGui.QGroupBox(self.Player)
        self.groupBox_4.setGeometry(QtCore.QRect(730, 20, 531, 321))
        self.groupBox_4.setObjectName(_fromUtf8("groupBox_4"))
        self.txtAsrRecognitionrPhrases = QtGui.QLineEdit(self.groupBox_4)
        self.txtAsrRecognitionrPhrases.setGeometry(QtCore.QRect(137, 280, 221, 22))
        self.txtAsrRecognitionrPhrases.setMinimumSize(QtCore.QSize(221, 0))
        self.txtAsrRecognitionrPhrases.setMaximumSize(QtCore.QSize(16777215, 22))
        self.txtAsrRecognitionrPhrases.setText(_fromUtf8(""))
        self.txtAsrRecognitionrPhrases.setObjectName(_fromUtf8("txtAsrRecognitionrPhrases"))
        self.txtTriggerRecognitionrPhrases = QtGui.QLineEdit(self.groupBox_4)
        self.txtTriggerRecognitionrPhrases.setGeometry(QtCore.QRect(137, 250, 221, 22))
        self.txtTriggerRecognitionrPhrases.setMinimumSize(QtCore.QSize(221, 0))
        self.txtTriggerRecognitionrPhrases.setMaximumSize(QtCore.QSize(16777215, 22))
        self.txtTriggerRecognitionrPhrases.setText(_fromUtf8(""))
        self.txtTriggerRecognitionrPhrases.setObjectName(_fromUtf8("txtTriggerRecognitionrPhrases"))
        self.label_18 = QtGui.QLabel(self.groupBox_4)
        self.label_18.setGeometry(QtCore.QRect(20, 251, 121, 22))
        self.label_18.setObjectName(_fromUtf8("label_18"))
        self.label_19 = QtGui.QLabel(self.groupBox_4)
        self.label_19.setGeometry(QtCore.QRect(20, 280, 121, 22))
        self.label_19.setObjectName(_fromUtf8("label_19"))
        self.label_17 = QtGui.QLabel(self.groupBox_4)
        self.label_17.setGeometry(QtCore.QRect(240, 60, 61, 21))
        self.label_17.setObjectName(_fromUtf8("label_17"))
        self.TestType_List = QtGui.QComboBox(self.groupBox_4)
        self.TestType_List.setGeometry(QtCore.QRect(300, 60, 121, 31))
        self.TestType_List.setObjectName(_fromUtf8("TestType_List"))
        self.groupBox_6 = QtGui.QGroupBox(self.groupBox_4)
        self.groupBox_6.setGeometry(QtCore.QRect(20, 20, 191, 131))
        self.groupBox_6.setObjectName(_fromUtf8("groupBox_6"))
        self.chkBx_Log_MP = QtGui.QCheckBox(self.groupBox_6)
        self.chkBx_Log_MP.setGeometry(QtCore.QRect(20, 10, 141, 31))
        self.chkBx_Log_MP.setObjectName(_fromUtf8("chkBx_Log_MP"))
        self.chkBx_Log_LabJack = QtGui.QCheckBox(self.groupBox_6)
        self.chkBx_Log_LabJack.setGeometry(QtCore.QRect(20, 30, 141, 31))
        self.chkBx_Log_LabJack.setObjectName(_fromUtf8("chkBx_Log_LabJack"))
        self.chkBx_Log_UART = QtGui.QCheckBox(self.groupBox_6)
        self.chkBx_Log_UART.setGeometry(QtCore.QRect(20, 50, 141, 31))
        self.chkBx_Log_UART.setObjectName(_fromUtf8("chkBx_Log_UART"))
        self.chkBx_Log_SERIAL = QtGui.QCheckBox(self.groupBox_6)
        self.chkBx_Log_SERIAL.setGeometry(QtCore.QRect(20, 70, 141, 31))
        self.chkBx_Log_SERIAL.setObjectName(_fromUtf8("chkBx_Log_SERIAL"))
        self.chkBx_Log_QCCUSB = QtGui.QCheckBox(self.groupBox_6)
        self.chkBx_Log_QCCUSB.setGeometry(QtCore.QRect(20, 90, 141, 31))
        self.chkBx_Log_QCCUSB.setObjectName(_fromUtf8("chkBx_Log_QCCUSB"))
        self.Dictionary_List = QtGui.QComboBox(self.groupBox_4)
        self.Dictionary_List.setGeometry(QtCore.QRect(300, 20, 121, 31))
        self.Dictionary_List.setObjectName(_fromUtf8("Dictionary_List"))
        self.label_13 = QtGui.QLabel(self.groupBox_4)
        self.label_13.setGeometry(QtCore.QRect(240, 20, 61, 21))
        self.label_13.setObjectName(_fromUtf8("label_13"))
        self.txtCounter0Name = QtGui.QLineEdit(self.groupBox_4)
        self.txtCounter0Name.setGeometry(QtCore.QRect(140, 170, 221, 31))
        self.txtCounter0Name.setMinimumSize(QtCore.QSize(221, 0))
        self.txtCounter0Name.setMaximumSize(QtCore.QSize(16777215, 31))
        self.txtCounter0Name.setObjectName(_fromUtf8("txtCounter0Name"))
        self.txtCounter1Name = QtGui.QLineEdit(self.groupBox_4)
        self.txtCounter1Name.setGeometry(QtCore.QRect(140, 210, 221, 31))
        self.txtCounter1Name.setMinimumSize(QtCore.QSize(221, 0))
        self.txtCounter1Name.setMaximumSize(QtCore.QSize(16777215, 31))
        self.txtCounter1Name.setObjectName(_fromUtf8("txtCounter1Name"))
        self.label_14 = QtGui.QLabel(self.groupBox_4)
        self.label_14.setGeometry(QtCore.QRect(10, 180, 111, 31))
        self.label_14.setObjectName(_fromUtf8("label_14"))
        self.label_15 = QtGui.QLabel(self.groupBox_4)
        self.label_15.setGeometry(QtCore.QRect(10, 210, 111, 31))
        self.label_15.setObjectName(_fromUtf8("label_15"))
        self.groupBox_5 = QtGui.QGroupBox(self.Player)
        self.groupBox_5.setGeometry(QtCore.QRect(730, 520, 581, 211))
        self.groupBox_5.setObjectName(_fromUtf8("groupBox_5"))
        self.txtCounter1Name_2 = QtGui.QLineEdit(self.groupBox_5)
        self.txtCounter1Name_2.setGeometry(QtCore.QRect(110, 70, 461, 31))
        self.txtCounter1Name_2.setObjectName(_fromUtf8("txtCounter1Name_2"))
        self.label_20 = QtGui.QLabel(self.groupBox_5)
        self.label_20.setGeometry(QtCore.QRect(10, 30, 111, 31))
        self.label_20.setObjectName(_fromUtf8("label_20"))
        self.label_21 = QtGui.QLabel(self.groupBox_5)
        self.label_21.setGeometry(QtCore.QRect(10, 70, 111, 31))
        self.label_21.setObjectName(_fromUtf8("label_21"))
        self.txtCounter0Name_2 = QtGui.QLineEdit(self.groupBox_5)
        self.txtCounter0Name_2.setGeometry(QtCore.QRect(110, 30, 461, 31))
        self.txtCounter0Name_2.setObjectName(_fromUtf8("txtCounter0Name_2"))
        self.spin_multiply_lines = QtGui.QSpinBox(self.groupBox_5)
        self.spin_multiply_lines.setEnabled(True)
        self.spin_multiply_lines.setGeometry(QtCore.QRect(240, 130, 41, 22))
        self.spin_multiply_lines.setButtonSymbols(QtGui.QAbstractSpinBox.UpDownArrows)
        self.spin_multiply_lines.setMaximum(999)
        self.spin_multiply_lines.setProperty("value", 4)
        self.spin_multiply_lines.setObjectName(_fromUtf8("spin_multiply_lines"))
        self.label_22 = QtGui.QLabel(self.groupBox_5)
        self.label_22.setGeometry(QtCore.QRect(10, 120, 221, 41))
        self.label_22.setObjectName(_fromUtf8("label_22"))
        self.Bttn_multiply_list_rows = QtGui.QPushButton(self.groupBox_5)
        self.Bttn_multiply_list_rows.setGeometry(QtCore.QRect(60, 160, 93, 28))
        self.Bttn_multiply_list_rows.setObjectName(_fromUtf8("Bttn_multiply_list_rows"))
        self.Bttn_combine_lists = QtGui.QPushButton(self.groupBox_5)
        self.Bttn_combine_lists.setGeometry(QtCore.QRect(210, 160, 93, 28))
        self.Bttn_combine_lists.setObjectName(_fromUtf8("Bttn_combine_lists"))
        self.Tabs.addTab(self.Player, _fromUtf8(""))
        self.Logs = QtGui.QWidget()
        self.Logs.setObjectName(_fromUtf8("Logs"))
        self.gridLayout_2 = QtGui.QGridLayout(self.Logs)
        self.gridLayout_2.setObjectName(_fromUtf8("gridLayout_2"))
        self.lbl_numOfWavs_2 = QtGui.QLabel(self.Logs)
        font = QtGui.QFont()
        font.setPointSize(9)
        font.setBold(False)
        font.setWeight(50)
        self.lbl_numOfWavs_2.setFont(font)
        self.lbl_numOfWavs_2.setText(_fromUtf8(""))
        self.lbl_numOfWavs_2.setObjectName(_fromUtf8("lbl_numOfWavs_2"))
        self.gridLayout_2.addWidget(self.lbl_numOfWavs_2, 0, 0, 1, 1)
        self.groupBox_3 = QtGui.QGroupBox(self.Logs)
        self.groupBox_3.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.groupBox_3.setObjectName(_fromUtf8("groupBox_3"))
        self.gridLayout_3 = QtGui.QGridLayout(self.groupBox_3)
        self.gridLayout_3.setObjectName(_fromUtf8("gridLayout_3"))
        self.label_11 = QtGui.QLabel(self.groupBox_3)
        self.label_11.setObjectName(_fromUtf8("label_11"))
        self.gridLayout_3.addWidget(self.label_11, 0, 0, 1, 1)
        self.txtLogPath = QtGui.QLineEdit(self.groupBox_3)
        self.txtLogPath.setObjectName(_fromUtf8("txtLogPath"))
        self.gridLayout_3.addWidget(self.txtLogPath, 0, 1, 1, 3)
        self.bttn_Browse_LogPath = QtGui.QPushButton(self.groupBox_3)
        self.bttn_Browse_LogPath.setObjectName(_fromUtf8("bttn_Browse_LogPath"))
        self.gridLayout_3.addWidget(self.bttn_Browse_LogPath, 0, 4, 1, 1)
        self.btn_start_log = QtGui.QPushButton(self.groupBox_3)
        self.btn_start_log.setLocale(QtCore.QLocale(QtCore.QLocale.English, QtCore.QLocale.UnitedStates))
        self.btn_start_log.setObjectName(_fromUtf8("btn_start_log"))
        self.gridLayout_3.addWidget(self.btn_start_log, 2, 1, 1, 1)
        self.btn_clear_log = QtGui.QPushButton(self.groupBox_3)
        self.btn_clear_log.setObjectName(_fromUtf8("btn_clear_log"))
        self.gridLayout_3.addWidget(self.btn_clear_log, 2, 2, 1, 1)
        self.btn_stop_log = QtGui.QPushButton(self.groupBox_3)
        self.btn_stop_log.setObjectName(_fromUtf8("btn_stop_log"))
        self.gridLayout_3.addWidget(self.btn_stop_log, 2, 3, 1, 1)
        self.Bttn_open_log = QtGui.QPushButton(self.groupBox_3)
        self.Bttn_open_log.setObjectName(_fromUtf8("Bttn_open_log"))
        self.gridLayout_3.addWidget(self.Bttn_open_log, 0, 5, 1, 1)
        self.textBrowser = QtGui.QTextBrowser(self.groupBox_3)
        font = QtGui.QFont()
        font.setFamily(_fromUtf8("Courier New"))
        self.textBrowser.setFont(font)
        self.textBrowser.setObjectName(_fromUtf8("textBrowser"))
        self.gridLayout_3.addWidget(self.textBrowser, 1, 0, 1, 6)
        self.gridLayout_2.addWidget(self.groupBox_3, 1, 0, 1, 1)
        self.Tabs.addTab(self.Logs, _fromUtf8(""))
        self.gridLayout_4.addWidget(self.Tabs, 0, 0, 1, 1)

        self.retranslateUi(RubiJukeBox)
        self.Tabs.setCurrentIndex(0)
        QtCore.QMetaObject.connectSlotsByName(RubiJukeBox)

    def retranslateUi(self, RubiJukeBox):
        RubiJukeBox.setWindowTitle(_translate("RubiJukeBox", "JukeBox 2.5", None))
        self.groupBox.setTitle(_translate("RubiJukeBox", "Wave Settings", None))
        self.btn_puase.setText(_translate("RubiJukeBox", "Puase", None))
        self.btn_play.setText(_translate("RubiJukeBox", "Play", None))
        self.should_delay_ASR.setText(_translate("RubiJukeBox", "Delay After Trigger:", None))
        self.label_9.setText(_translate("RubiJukeBox", "db", None))
        self.btn_addWavDir.setText(_translate("RubiJukeBox", "Add Folder", None))
        self.should_delay.setText(_translate("RubiJukeBox", "Delay Before Trigger:", None))
        self.lbl_numOfWavs.setText(_translate("RubiJukeBox", "Found 0 wavs", None))
        self.btn_addWavFile.setText(_translate("RubiJukeBox", "Add Wav", None))
        self.btn_stop.setText(_translate("RubiJukeBox", "Stop", None))
        self.label_3.setText(_translate("RubiJukeBox", "0db", None))
        self.bttn_addWavList.setText(_translate("RubiJukeBox", "Add List", None))
        self.btn_removeAll.setText(_translate("RubiJukeBox", "Clear List", None))
        self.btn_removeWavDir.setText(_translate("RubiJukeBox", "Remove", None))
        self.label.setText(_translate("RubiJukeBox", "Signal Vol.", None))
        self.label_6.setText(_translate("RubiJukeBox", "-50db", None))
        self.label_8.setText(_translate("RubiJukeBox", "+50db", None))
        self.btn_make_wav.setText(_translate("RubiJukeBox", "Make .wav File", None))
        self.groupBox_2.setTitle(_translate("RubiJukeBox", "Noise Settings", None))
        self.label_5.setText(_translate("RubiJukeBox", "-50db", None))
        self.label_2.setText(_translate("RubiJukeBox", "Noise Vol.", None))
        self.btn_play_noise.setText(_translate("RubiJukeBox", "Play Noise", None))
        self.label_4.setText(_translate("RubiJukeBox", "0db", None))
        self.btn_choose_noise.setText(_translate("RubiJukeBox", "Choose Noise", None))
        self.btn_stop_noise.setText(_translate("RubiJukeBox", "Stop Noise", None))
        self.label_7.setText(_translate("RubiJukeBox", "+50db", None))
        self.groupBox_7.setTitle(_translate("RubiJukeBox", "Play/Delay Configuration", None))
        self.ChkBx_play_in_loop.setText(_translate("RubiJukeBox", "Play in loop", None))
        self.chkBx_play_random_order.setText(_translate("RubiJukeBox", "Randomize play order", None))
        self.chkBx_randomize_delay.setText(_translate("RubiJukeBox", "Randomize delay", None))
        self.label_16.setText(_translate("RubiJukeBox", "Delay Mode", None))
        self.groupBox_4.setTitle(_translate("RubiJukeBox", "Logging configuration", None))
        self.label_18.setText(_translate("RubiJukeBox", "Recognized Trigger:", None))
        self.label_19.setText(_translate("RubiJukeBox", "Finished ASR Mode:", None))
        self.label_17.setText(_translate("RubiJukeBox", "Test Type", None))
        self.groupBox_6.setTitle(_translate("RubiJukeBox", "Log Results Source", None))
        self.chkBx_Log_MP.setText(_translate("RubiJukeBox", "Mobile Phone", None))
        self.chkBx_Log_LabJack.setText(_translate("RubiJukeBox", "LabJack", None))
        self.chkBx_Log_UART.setText(_translate("RubiJukeBox", "UART", None))
        self.chkBx_Log_SERIAL.setText(_translate("RubiJukeBox", "SERIAL RS232", None))
        self.chkBx_Log_QCCUSB.setText(_translate("RubiJukeBox", "QCC-USB", None))
        self.label_13.setText(_translate("RubiJukeBox", "Dictionary", None))
        self.txtCounter0Name.setText(_translate("RubiJukeBox", "Counter0", None))
        self.txtCounter1Name.setText(_translate("RubiJukeBox", "Counter1", None))
        self.label_14.setText(_translate("RubiJukeBox", "Counter 0 Name:", None))
        self.label_15.setText(_translate("RubiJukeBox", "Counter 1 Name:", None))
        self.groupBox_5.setTitle(_translate("RubiJukeBox", "List preperation", None))
        self.txtCounter1Name_2.setText(_translate("RubiJukeBox", "Path to File 2", None))
        self.label_20.setText(_translate("RubiJukeBox", "Source/Trig Path:", None))
        self.label_21.setText(_translate("RubiJukeBox", "ASR List Path: ", None))
        self.txtCounter0Name_2.setText(_translate("RubiJukeBox", "Path to file 1", None))
        self.label_22.setText(_translate("RubiJukeBox", "Number of time to duplicate each row", None))
        self.Bttn_multiply_list_rows.setText(_translate("RubiJukeBox", "Multiply rows", None))
        self.Bttn_combine_lists.setText(_translate("RubiJukeBox", "Combine lists", None))
        self.Tabs.setTabText(self.Tabs.indexOf(self.Player), _translate("RubiJukeBox", "Player", None))
        self.groupBox_3.setTitle(_translate("RubiJukeBox", "Recognition Log", None))
        self.label_11.setText(_translate("RubiJukeBox", "Log Path:", None))
        self.txtLogPath.setText(_translate("RubiJukeBox", "C:\\AutomationEnvironment\\Logs", None))
        self.bttn_Browse_LogPath.setText(_translate("RubiJukeBox", "Browse", None))
        self.btn_start_log.setText(_translate("RubiJukeBox", "Start Logging", None))
        self.btn_clear_log.setText(_translate("RubiJukeBox", "Clear Log", None))
        self.btn_stop_log.setText(_translate("RubiJukeBox", "Stop Logging", None))
        self.Bttn_open_log.setText(_translate("RubiJukeBox", "Open Log", None))
        self.textBrowser.setHtml(_translate("RubiJukeBox", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:\'Courier New\'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n"
"<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:\'MS Shell Dlg 2\'; font-size:8pt;\"><br /></p></body></html>", None))
        self.Tabs.setTabText(self.Tabs.indexOf(self.Logs), _translate("RubiJukeBox", "Logs", None))

