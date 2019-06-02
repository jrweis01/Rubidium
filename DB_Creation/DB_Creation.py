from PyQt4 import QtCore, QtGui, uic
from PyQt4.QtGui import QMessageBox,QPixmap
from PyQt4.QtCore import Qt, QTimer, QSize, QByteArray
from PyQt4.QtGui import *
from PyQt4.QtCore import pyqtSlot,SIGNAL,SLOT
import re
import os
import sys
import fnmatch
import shutil
import time
from distutils.dir_util import copy_tree
import threading
import math


Training_men = []
Training_women = []
Testing_men = []
Testing_women = []


def directory(path):
    count = 0
    for root, dirnames, filenames in os.walk(path):
        for filename in fnmatch.filter(filenames, '*.wav'):
            count = count+1
    return count



form_class = uic.loadUiType(os.path.join(os.path.dirname(__file__), 'main.ui'))[0]



class MyWidget(QtGui.QMainWindow, form_class):
    def __init__(self, parent=None):
        QtGui.QMainWindow.__init__(self, parent)
        self.setupUi(self)
        self.pushButton.clicked.connect(self.open_source_clicked)
        self.pushButton_2.clicked.connect(self.open_dest_clicked)
        self.pushButton_5.clicked.connect(self.open_file_clicked)
        self.pushButton_3.clicked.connect(self.OK_clicked)
        self.pushButton_4.clicked.connect(self.CreateDB_clicked)
        self.pushButton_6.clicked.connect(self.ReadFromFile_clicked)
        self.pushButton_7.clicked.connect(self.Create_Noise_clicked)
        self.pushButton_8.clicked.connect(self.delete_item_clicked)
        self.pushButton_9.clicked.connect(self.startProcess_clicked)
        self.pushButton_19.clicked.connect(self.startTweaking_clicked)
        self.label.setPixmap(QPixmap("rubidium_pic.jpg"))
        self.label.show()
        self.label_7.setPixmap(QPixmap("rubidium_pic.jpg"))
        self.label.show()
        self.label_46.setPixmap(QPixmap("rubidium_pic.jpg"))
        self.label.show()
        self.radioButton.setChecked(True)
        self.txt_FROM.setPlainText("-24")
        self.txt_TO.setPlainText("6")
        self.txt_STEP.setPlainText("3")
        self.label_19.setSizePolicy(QSizePolicy.Expanding,
            QSizePolicy.Expanding)
        self.label_19.setAlignment(Qt.AlignCenter)
        self.movie = QMovie("loading.gif", QByteArray(), self)
        self.movie.setCacheMode(QMovie.CacheAll)
        self.movie.setSpeed(100)
        self.label_19.setMovie(self.movie)
        self.label_19.hide()

        #self.player.show()
        #self.setCentralWidget(self.widget)
        #self.overlay = Overlay(self.centralWidget())
        #self.overlay.hide()



    def open_source_clicked(self):
        direct = "/home"
        src_tree = QtGui.QFileDialog.getExistingDirectory(None, "Select Folder",direct)
        self.textEdit.setPlainText(src_tree)

    def open_dest_clicked(self):
        direct = "/home"
        dst_tree = QtGui.QFileDialog.getExistingDirectory(None, "Select Folder",direct)
        self.textEdit_2.setPlainText(dst_tree)

    def open_file_clicked(self):
        direct = "/home"
        list_txt = QtGui.QFileDialog.getOpenFileName(None, "Open list file (txt)", direct, "text file (*.txt)")
        self.textEdit_6.setPlainText(list_txt)
        ref_file = open(str(list_txt))
        lines = ref_file.readlines()
        for i in range(len(lines)):
            lines[i] = lines[i].rstrip('\n')
            splt1 = lines[i].split('=')
            if splt1[0] == "testing_men":
                splt2 = splt1[1].split(',')
                for j in range(len(splt2)):
                    Testing_men.append(splt2[j])
            elif splt1[0] == "testing_women":
                splt2 = splt1[1].split(',')
                for j in range(len(splt2)):
                    Testing_women.append(splt2[j])
            elif splt1[0] == "training_men":
                splt2 = splt1[1].split(',')
                for j in range(len(splt2)):
                    Training_men.append(splt2[j])
            elif splt1[0] == "training_women":
                splt2 = splt1[1].split(',')
                for j in range(len(splt2)):
                    Training_women.append(splt2[j])


    def OK_clicked(self):
        if str(self.textEdit_5.toPlainText()) == "":
            msgBox = QMessageBox()
            msgBox.setText('ERROR - You must enter word/garbage before you click OK')
            msgBox.StandardButton(QMessageBox.Ok)
            msgBox.setIcon(QMessageBox.Critical)
            msgBox.exec_()
        else:
            word = str(self.textEdit_5.toPlainText())
            item = QtGui.QListWidgetItem()
            item.setText(word)
            self.listWidget.addItem(item)
            self.textEdit_5.clear()

    def ReadFromFile_clicked(self):
        direct = "/home"
        list_txt = QtGui.QFileDialog.getOpenFileName(None, "Open list file (txt)", direct, "text file (*.txt)")
        self.textEdit_7.setPlainText(list_txt)
        ref_file = open(str(list_txt))
        lines = ref_file.readlines()

        for i in range(len(lines)):
            lines[i] = lines[i].rstrip('\n')
            item = QtGui.QListWidgetItem()
            item.setText(lines[i])
            self.listWidget.addItem(item)

    def CreateDB_clicked(self):
        if str(self.textEdit.toPlainText()) == "":
            msgBox = QMessageBox()
            msgBox.setText('ERROR - You must enter the source folder')
            msgBox.StandardButton(QMessageBox.Ok)
            msgBox.setIcon(QMessageBox.Critical)
            msgBox.exec_()
            return

        if str(self.textEdit_2.toPlainText()) == "":
            msgBox = QMessageBox()
            msgBox.setText('ERROR - You must enter the destination folder')
            msgBox.StandardButton(QMessageBox.Ok)
            msgBox.setIcon(QMessageBox.Critical)
            msgBox.exec_()
            return

        if not self.checkBox.isChecked() and not self.checkBox_2.isChecked() and not self.checkBox_3.isChecked() and not self.checkBox_4.isChecked() and not self.checkBox_5.isChecked() and not self.checkBox_6.isChecked() and not self.checkBox_7.isChecked() and not self.checkBox_8.isChecked():
            msgBox = QMessageBox()
            msgBox.setText('ERROR - You must choose at least one microphone type')
            msgBox.StandardButton(QMessageBox.Ok)
            msgBox.setIcon(QMessageBox.Critical)
            msgBox.exec_()
            return

        if not self.checkBox_17.isChecked() and not self.checkBox_18.isChecked() and not self.checkBox_19.isChecked() and not self.checkBox_20.isChecked() and not self.checkBox_21.isChecked() and not self.checkBox_22.isChecked():
            msgBox = QMessageBox()
            msgBox.setText('ERROR - You must choose at least one workout type')
            msgBox.StandardButton(QMessageBox.Ok)
            msgBox.setIcon(QMessageBox.Critical)
            msgBox.exec_()
            return

        if str(self.textEdit_6.toPlainText()) == "":
            msgBox = QMessageBox()
            msgBox.setText('ERROR - You must enter the training and testing file')
            msgBox.StandardButton(QMessageBox.Ok)
            msgBox.setIcon(QMessageBox.Critical)
            msgBox.exec_()
            return

        if str(self.textEdit_3.toPlainText()) == "":
            msgBox = QMessageBox()
            msgBox.setText('ERROR - You must enter the name of the DB')
            msgBox.StandardButton(QMessageBox.Ok)
            msgBox.setIcon(QMessageBox.Critical)
            msgBox.exec_()
            return

        if self.listWidget.count() == 0:
            msgBox = QMessageBox()
            msgBox.setText('ERROR - You must enter words and garbages')
            msgBox.StandardButton(QMessageBox.Ok)
            msgBox.setIcon(QMessageBox.Critical)
            msgBox.exec_()
            return
        self.pushButton_4.setEnabled(False)
        #self.player.show()
        self.label_19.show()
        self.movie.start()
        go_thread = threading.Thread(target=self.go)
        go_thread.start()





    def go(self):
        mics = []
        workouts = []
        mode = "TRIGGER"

        if self.radioButton_2.isChecked():
            mode = "ASR"

        if self.checkBox.isChecked():
            mics.append(str(self.checkBox.text()))
        if self.checkBox_2.isChecked():
            mics.append(str(self.checkBox_2.text()))
        if self.checkBox_3.isChecked():
            mics.append(str(self.checkBox_3.text()))
        if self.checkBox_4.isChecked():
            mics.append(str(self.checkBox_4.text()))
        if self.checkBox_5.isChecked():
            mics.append(str(self.checkBox_5.text()))
        if self.checkBox_6.isChecked():
            mics.append(str(self.checkBox_6.text()))
        if self.checkBox_7.isChecked():
            mics.append(str(self.checkBox_7.text()))
        if self.checkBox_8.isChecked():
            mics.append(str(self.checkBox_8.text()))

        if self.checkBox_17.isChecked():
            workouts.append(str(self.checkBox_17.text()))
        if self.checkBox_18.isChecked():
            workouts.append(str(self.checkBox_18.text()))
        if self.checkBox_19.isChecked():
            workouts.append(str(self.checkBox_19.text()))
        if self.checkBox_20.isChecked():
            workouts.append(str(self.checkBox_20.text()))
        if self.checkBox_21.isChecked():
            workouts.append(str(self.checkBox_21.text()))
        if self.checkBox_22.isChecked():
            workouts.append(str(self.checkBox_22.text()))

        gender = ["MEN", "WOMEN"]

        for i in range(len(mics)):
            for j in range(len(workouts)):
                for k in range(len(gender)):
                    if k == 0:
                        for g in range(len(Testing_men)):
                            TESTING_PATH = str(self.textEdit_2.toPlainText()) + "\\" + str(mode) + "\\TESTING\\" + str(mics[i]) + "\\" + str(workouts[j]) + "\\Nodes\\" + str(self.textEdit_3.toPlainText()) + "\\REC_16K\\" + str(gender[k]) + "\\" + str(Testing_men[g])
                            if not os.path.exists(str(TESTING_PATH)):
                                os.makedirs(str(TESTING_PATH))

                        for g in range(len(Training_men)):
                            TRAINING_PATH = str(self.textEdit_2.toPlainText()) + "\\" + str(mode) + "\\TRAINING\\" + str(mics[i]) + "\\" + str(workouts[j]) + "\\Nodes\\" + str(self.textEdit_3.toPlainText()) + "\\REC_16K\\" + str(gender[k]) + "\\" + str(Training_men[g])

                            if not os.path.exists(str(TRAINING_PATH)):
                                os.makedirs(str(TRAINING_PATH))
                    else:
                        for g in range(len(Testing_women)):
                            TESTING_PATH = str(self.textEdit_2.toPlainText()) + "\\" + str(mode) + "\\TESTING\\" + str(mics[i]) + "\\" + str(workouts[j]) + "\\Nodes\\" + str(self.textEdit_3.toPlainText()) + "\\REC_16K\\" + str(gender[k]) + "\\" + str(Testing_women[g])
                            if not os.path.exists(str(TESTING_PATH)):
                                os.makedirs(str(TESTING_PATH))

                        for g in range(len(Training_women)):
                            TRAINING_PATH = str(self.textEdit_2.toPlainText()) + "\\" + str(mode) + "\\TRAINING\\" + str(mics[i]) + "\\" + str(workouts[j]) + "\\Nodes\\" + str(self.textEdit_3.toPlainText()) + "\\REC_16K\\" + str(gender[k]) + "\\" + str(Training_women[g])

                            if not os.path.exists(str(TRAINING_PATH)):
                                os.makedirs(str(TRAINING_PATH))

        for i in range(len(mics)):
            for j in range(len(workouts)):
                for k in range(len(gender)):
                    if k == 0:
                        PATH = str(str(self.textEdit.toPlainText()) + "\\" + mics[i] + "\\" + workouts[j] + "\\" + gender[k])
                        for g in range(self.listWidget.count()):
                            item = self.listWidget.item(g)
                            for root, dirnames, filenames in os.walk(PATH):
                                for filename in fnmatch.filter(filenames, '*[0-9]-' + str(item.text()) + '.wav'):
                                    n = root.rfind("\\")
                                    speaker = root[n+1:]
                                    wav = os.path.join(root,filename)
                                    if speaker in Testing_men:
                                        PATH_TO = str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "\\TESTING\\" + mics[i] + "\\" + workouts[j] + "\\Nodes\\" + str(self.textEdit_3.toPlainText()) + "\\REC_16K\\" + gender[k] + "\\" + speaker)
                                        if not os.path.exists(PATH_TO + "\\empty" + str(g+1) + ".wav"):
                                            shutil.copy2(wav,PATH_TO)
                                            os.rename(PATH_TO + "\\" + filename,PATH_TO + "\\empty" + str(g+1) + ".wav")
                                    elif speaker in Training_men:
                                        PATH_TO = str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "\\TRAINING\\" + mics[i] + "\\" + workouts[j] + "\\Nodes\\" + str(self.textEdit_3.toPlainText()) + "\\REC_16K\\" + gender[k] + "\\" + speaker)
                                        if not os.path.exists(PATH_TO + "\\empty" + str(g+1) + ".wav"):
                                            shutil.copy2(wav,PATH_TO)
                                            os.rename(PATH_TO + "\\" + filename,PATH_TO + "\\empty" + str(g+1) + ".wav")

                            for root, dirnames, filenames in os.walk(PATH):
                                for filename in fnmatch.filter(filenames, '*[0-9]_' + str(item.text()) + '.wav'):
                                    n = root.rfind("\\")
                                    speaker = root[n+1:]
                                    wav = os.path.join(root,filename)
                                    if speaker in Testing_men:
                                        PATH_TO = str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "\\TESTING\\" + mics[i] + "\\" + workouts[j] + "\\Nodes\\" + str(self.textEdit_3.toPlainText()) + "\\REC_16K\\" + gender[k] + "\\" + speaker)
                                        if not os.path.exists(PATH_TO + "\\empty" + str(g+1) + ".wav"):
                                            shutil.copy2(wav,PATH_TO)
                                            os.rename(PATH_TO + "\\" + filename,PATH_TO + "\\empty" + str(g+1) + ".wav")
                                    elif speaker in Training_men:
                                        PATH_TO = str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "\\TRAINING\\" + mics[i] + "\\" + workouts[j] + "\\Nodes\\" + str(self.textEdit_3.toPlainText()) + "\\REC_16K\\" + gender[k] + "\\" + speaker)
                                        if not os.path.exists(PATH_TO + "\\empty" + str(g+1) + ".wav"):
                                            shutil.copy2(wav,PATH_TO)
                                            os.rename(PATH_TO + "\\" + filename,PATH_TO + "\\empty" + str(g+1) + ".wav")
                    else:
                        PATH = str(str(self.textEdit.toPlainText()) + "\\" + mics[i] + "\\" + workouts[j] + "\\" + gender[k])
                        for g in range(self.listWidget.count()):
                            item = self.listWidget.item(g)
                            for root, dirnames, filenames in os.walk(PATH):
                                for filename in fnmatch.filter(filenames, '*[0-9]-' + str(item.text()) + '.wav'):
                                    n = root.rfind("\\")
                                    speaker = root[n+1:]
                                    wav = os.path.join(root,filename)
                                    if speaker in Testing_women:
                                        PATH_TO = str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "\\TESTING\\" + mics[i] + "\\" + workouts[j] + "\\Nodes\\" + str(self.textEdit_3.toPlainText()) + "\\REC_16K\\" + gender[k] + "\\" + speaker)
                                        if not os.path.exists(PATH_TO + "\\empty" + str(g+1) + ".wav"):
                                            shutil.copy2(wav,PATH_TO)
                                            os.rename(PATH_TO + "\\" + filename,PATH_TO + "\\empty" + str(g+1) + ".wav")
                                    elif speaker in Training_women:
                                        PATH_TO = str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "\\TRAINING\\" + mics[i] + "\\" + workouts[j] + "\\Nodes\\" + str(self.textEdit_3.toPlainText()) + "\\REC_16K\\" + gender[k] + "\\" + speaker)
                                        if not os.path.exists(PATH_TO + "\\empty" + str(g+1) + ".wav"):
                                            shutil.copy2(wav,PATH_TO)
                                            os.rename(PATH_TO + "\\" + filename,PATH_TO + "\\empty" + str(g+1) + ".wav")

                            for root, dirnames, filenames in os.walk(PATH):
                                for filename in fnmatch.filter(filenames, '*[0-9]_' + str(item.text()) + '.wav'):
                                    n = root.rfind("\\")
                                    speaker = root[n+1:]
                                    wav = os.path.join(root,filename)
                                    if speaker in Testing_women:
                                        PATH_TO = str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "\\TESTING\\" + mics[i] + "\\" + workouts[j] + "\\Nodes\\" + str(self.textEdit_3.toPlainText()) + "\\REC_16K\\" + gender[k] + "\\" + speaker)
                                        if not os.path.exists(PATH_TO + "\\empty" + str(g+1) + ".wav"):
                                            shutil.copy2(wav,PATH_TO)
                                            os.rename(PATH_TO + "\\" + filename,PATH_TO + "\\empty" + str(g+1) + ".wav")
                                    elif speaker in Training_women:
                                        PATH_TO = str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "\\TRAINING\\" + mics[i] + "\\" + workouts[j] + "\\Nodes\\" + str(self.textEdit_3.toPlainText()) + "\\REC_16K\\" + gender[k] + "\\" + speaker)
                                        if not os.path.exists(PATH_TO + "\\empty" + str(g+1) + ".wav"):
                                            shutil.copy2(wav,PATH_TO)
                                            os.rename(PATH_TO + "\\" + filename,PATH_TO + "\\empty" + str(g+1) + ".wav")
        print "DONE CREATING DB"
        self.pushButton_7.setEnabled(True)
        self.pushButton_4.setEnabled(True)
        self.label_19.hide()
        #self.movie.stop()
        #self.player.close()

    def Create_Noise_clicked(self):
        if str(self.textEdit_2.toPlainText()) == "":
            msgBox = QMessageBox()
            msgBox.setText('ERROR - You must enter the destination path')
            msgBox.StandardButton(QMessageBox.Ok)
            msgBox.setIcon(QMessageBox.Critical)
            msgBox.exec_()
            return
        PATH = str(self.textEdit_2.toPlainText())
        if not os.path.exists(os.path.join(PATH,"TRIGGER")) and not os.path.exists(os.path.join(PATH,"ASR")):
            msgBox = QMessageBox()
            msgBox.setText('ERROR - You must  create DB first')
            msgBox.StandardButton(QMessageBox.Ok)
            msgBox.setIcon(QMessageBox.Critical)
            msgBox.exec_()
            return
        if not self.checkBox_PnkNoise.isChecked and not self.checkBox_babble.isChecked and not self.checkBox_cafeteria.isChecked and not\
		        self.checkBox_car80.isChecked and not self.checkBox_office.isChecked and not self.checkBox_street.isChecked and not \
		        self.checkBox_wind2.isChecked and not self.checkBox_wind3.isChecked and not self.checkBox_wind4.isChecked and not \
		        self.checkBox_wind5.isChecked and not self.checkBox_whiteNoise.isChecked and not self.checkBox_AmazonMusic.isChecked and not \
		        self.checkBox_Microwave.isChecked and not self.checkBox_crossroad.isChecked:
            msgBox = QMessageBox()
            msgBox.setText('ERROR - You must choose at least one noise')
            msgBox.StandardButton(QMessageBox.Ok)
            msgBox.setIcon(QMessageBox.Critical)
            msgBox.exec_()
            return
        self.pushButton_7.setEnabled(False)
        self.pushButton_4.setEnabled(False)
        #self.player.show()
        self.label_19.show()
        self.movie.start()
        go_noise_thread = threading.Thread(target=self.Go_noise)
        go_noise_thread.start()



    def Go_noise(self):
        mode = "TRIGGER"

        if self.radioButton_2.isChecked():
            mode = "ASR"

        start_dB = int(str(self.txt_FROM.toPlainText()))
        stop_dB = int(str(self.txt_TO.toPlainText()))
        step_increment = int(str(self.txt_STEP.toPlainText()))

        if self.checkBox_babble.isChecked():
            step = start_dB
            while (step <= stop_dB):
                copy_tree(str(self.textEdit_2.toPlainText()) + "\\" + str(mode),str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "_" + str(self.checkBox_babble.text()) + "\\" + str(self.checkBox_babble.text()) + str(step)))
                step = step + step_increment

        if self.checkBox_cafeteria.isChecked():
            step = start_dB
            while (step <= stop_dB):
                copy_tree(str(self.textEdit_2.toPlainText()) + "\\" + str(mode),str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "_" + str(self.checkBox_cafeteria.text()) + "\\" +  str(self.checkBox_cafeteria.text()) + str(step)))
                step = step + step_increment

        if self.checkBox_car80.isChecked():
            step = start_dB
            while (step <= stop_dB):
                copy_tree(str(self.textEdit_2.toPlainText()) + "\\" + str(mode),str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "_" + str(self.checkBox_car80.text()) + "\\" +  str(self.checkBox_car80.text()) + str(step)))
                step = step + step_increment


        if self.checkBox_office.isChecked():
            step = start_dB
            while (step <= stop_dB):
                copy_tree(str(self.textEdit_2.toPlainText()) + "\\" + str(mode),str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "_" + str(self.checkBox_office.text()) + "\\" +  str(self.checkBox_office.text()) + str(step)))
                step = step + step_increment



        if self.checkBox_street.isChecked():
            step = start_dB
            while (step <= stop_dB):
                copy_tree(str(self.textEdit_2.toPlainText()) + "\\" + str(mode),str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "_" + str(self.checkBox_street.text()) + "\\" +  str(self.checkBox_street.text()) + str(step)))
                step = step + step_increment

        if self.checkBox_wind2.isChecked():
            step = start_dB
            while (step <= stop_dB):
                copy_tree(str(self.textEdit_2.toPlainText()) + "\\" + str(mode),str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "_" + str(self.checkBox_wind2.text()) + "\\" +  str(self.checkBox_wind2.text()) + str(step)))
                step = step + step_increment


        if self.checkBox_wind3.isChecked():
            step = start_dB
            while (step <= stop_dB):
                copy_tree(str(self.textEdit_2.toPlainText()) + "\\" + str(mode),str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "_" + str(self.checkBox_wind3.text()) + "\\" +  str(self.checkBox_wind3.text()) + str(step)))
                step = step + step_increment


        if self.checkBox_wind4.isChecked():
            step = start_dB
            while (step <= stop_dB):
                copy_tree(str(self.textEdit_2.toPlainText()) + "\\" + str(mode),str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "_" + str(self.checkBox_wind4.text()) + "\\" +  str(self.checkBox_wind4.text()) + str(step)))
                step = step + step_increment


        if self.checkBox_wind5.isChecked():
            step = start_dB
            while (step <= stop_dB):
                copy_tree(str(self.textEdit_2.toPlainText()) + "\\" + str(mode),str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "_" + str(self.checkBox_wind5.text()) + "\\" +  str(self.checkBox_wind5.text()) + str(step)))
                step = step + step_increment


        if self.checkBox_crossroad.isChecked():
            step = start_dB
            while (step <= stop_dB):
                copy_tree(str(self.textEdit_2.toPlainText()) + "\\" + str(mode),str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "_" + str(self.checkBox_crossroad.text()) + "\\" +  str(self.checkBox_crossroad.text()) + str(step)))
                step = step + step_increment


        if self.checkBox_PnkNoise.isChecked():
            step = start_dB
            while (step <= stop_dB):
                copy_tree(str(self.textEdit_2.toPlainText()) + "\\" + str(mode),str(str(self.textEdit_2.toPlainText()) + "\\" + mode + "_" + str(self.checkBox_PnkNoise.text()) + "\\" +  str(self.checkBox_PnkNoise.text()) + str(step)))
                step = step + step_increment

        print "DONE CREATING NOISE DB"
        self.pushButton_7.setEnabled(True)
        self.pushButton_4.setEnabled(True)
        self.label_19.hide()
        #self.movie.stop()
        #self.player.close()

    def delete_item_clicked(self):
        for item in self.listWidget.selectedItems():
            self.listWidget.takeItem(self.listWidget.row(item))


    def startProcess_clicked(self):
        if str(self.textEdit_2.toPlainText()) == "":
            msgBox = QMessageBox()
            msgBox.setText('ERROR - You need to mention the path of the destination,\nplease go to the DB Creator TAB')
            msgBox.StandardButton(QMessageBox.Ok)
            msgBox.setIcon(QMessageBox.Critical)
            msgBox.exec_()
            return
        if str(self.textEdit_4.toPlainText()) == "" or str(self.textEdit_10.toPlainText()) == "" or str(self.textEdit_11.toPlainText()) == "" or str(self.textEdit_12.toPlainText()) == "":
            msgBox = QMessageBox()
            msgBox.setText('ERROR - at least one of the fields is empty')
            msgBox.StandardButton(QMessageBox.Ok)
            msgBox.setIcon(QMessageBox.Critical)
            msgBox.exec_()
            return

        processThread = threading.Thread(target=self.startProcess())
        processThread.start()

    def update(self, n):
        self.progressBar.setValue(n)

    def update2(self, n):
        self.progressBar_3.setValue(n)

    def startProcess(self):
        percent = str(self.textEdit_4.toPlainText())
        cut_off = str(self.textEdit_11.toPlainText())
        bits = str(self.textEdit_10.toPlainText())
        fs = str(self.textEdit_12.toPlainText())
        if self.radioButton.isChecked:
            PATH = str(self.textEdit_2.toPlainText()) + "\\TRIGGER"
        else:
            PATH = str(self.textEdit_2.toPlainText()) + "\\ASR"
        count = directory(PATH)
        self.progressBar.setMaximum(count)
        completed = 0;
        for root, dirnames, filenames in os.walk(PATH):
            for filename in fnmatch.filter(filenames, '*.wav'):
                wav = os.path.join(root, filename)
                n = filename.rfind(".")
                filename2 = filename[0:n]
                filename2 = filename2 + "a" + filename[n:]
                wav2 = os.path.join(root, filename2)
                os.system("sox.exe " + wav + " -b " +  bits  + " -r " +  fs +" " + wav2)
                os.remove(wav)
                os.system("sox.exe " + wav2 + " " + wav + " highpass " + cut_off)
                os.remove(wav2)
                os.system("normalize.exe -m " + percent + " " + wav)
                completed = completed + 1
                t = threading.Thread(target=self.update, args=(completed,))
                t.start()
                while t.is_alive():
                    pass
                #time.sleep(0.05)


    def startTweaking_clicked(self):
        if str(self.textEdit_2.toPlainText()) == "":
            msgBox = QMessageBox()
            msgBox.setText('ERROR - You need to mention the path of the destination,\nplease go to the DB Creator TAB')
            msgBox.StandardButton(QMessageBox.Ok)
            msgBox.setIcon(QMessageBox.Critical)
            msgBox.exec_()
            return

        TweakingThread = threading.Thread(target=self.startTweaking)
        TweakingThread.start()

    def startTweaking(self):
        if self.radioButton.isChecked:
            PATH = str(self.textEdit_2.toPlainText()) + "\\TRIGGER"
        else:
            PATH = str(self.textEdit_2.toPlainText()) + "\\ASR"
        count = directory(PATH)
        self.progressBar_3.setMaximum(count)
        completed = 0;
        for root, dirnames, filenames in os.walk(PATH):
            for filename in fnmatch.filter(filenames, '*.wav'):
                folder_PU = root + "_PU"
                folder_PD = root + "_PD"
                folder_SU = root + "_SU"
                folder_SD = root + "_SD"
                folder_PU_SU = root + "_PU_SU"
                folder_PU_SD = root + "_PU_SD"
                folder_PD_SU = root + "_PD_SU"
                folder_PD_SD = root + "_PD_SD"

                if not os.path.exists(folder_PU):
                    os.makedirs(folder_PU)

                if not os.path.exists(folder_PD):
                    os.makedirs(folder_PD)

                if not os.path.exists(folder_SU):
                    os.makedirs(folder_SU)

                if not os.path.exists(folder_SD):
                    os.makedirs(folder_SD)

                if not os.path.exists(folder_PU_SU):
                    os.makedirs(folder_PU_SU)

                if not os.path.exists(folder_PU_SD):
                    os.makedirs(folder_PU_SD)

                if not os.path.exists(folder_PD_SU):
                    os.makedirs(folder_PD_SU)

                if not os.path.exists(folder_PD_SD):
                    os.makedirs(folder_PD_SD)

                wav = os.path.join(root, filename)
                wav_PU = os.path.join(folder_PU, filename)
                wav_PD = os.path.join(folder_PD, filename)
                wav_SU = os.path.join(folder_SU, filename)
                wav_SD = os.path.join(folder_SD, filename)
                wav_PU_SU = os.path.join(folder_PU_SU, filename)
                wav_PU_SD = os.path.join(folder_PU_SD, filename)
                wav_PD_SU = os.path.join(folder_PD_SU, filename)
                wav_PD_SD = os.path.join(folder_PD_SD, filename)
                os.system("sox.exe " + wav + " " + wav_PD + " pitch -105.946")
                os.system("sox.exe " + wav + " " + wav_PU + " pitch 94.387")
                os.system("sox.exe " + wav + " " + wav_SU + " tempo 1.15")
                os.system("sox.exe " + wav + " " + wav_SD + " tempo 0.85")
                os.system("sox.exe " + wav + " " + wav_PU_SU + " pitch 94.387 tempo 1.15")
                os.system("sox.exe " + wav + " " + wav_PU_SD + " pitch 94.387 tempo 0.85")
                os.system("sox.exe " + wav + " " + wav_PD_SU + " pitch -105.946 tempo 1.15")
                os.system("sox.exe " + wav + " " + wav_PD_SD + " pitch -105.946 tempo 0.85")
                completed = completed + 1
                t = threading.Thread(target=self.update2, args=(completed,))
                t.start()
                while t.is_alive():
                    pass




app = QtGui.QApplication(sys.argv)
myWindow = MyWidget()
myWindow.show()
app.exec_()