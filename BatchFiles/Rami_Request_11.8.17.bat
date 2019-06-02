Rem Setting up Error log
set TIMESTAMP=%DATE:/=-%@%TIME::=-%
set TIMESTAMP=%TIMESTAMP: =%
set ERRLOG=%TIMESTAMP:,=.%.txt
set logpath=C:\AUTOMATIONENVIRONMENT\logs\
set ERRLOG=%logpath%%ERRLOG%
echo 'CMD Error Log'>%ERRLOG%
REM Setting up variables to be Re-used latter
set JukeBox20=C:\AutomationEnvironment\Jukebox\JukeBox_main.py
set JukeBox15=C:\AutomationEnvironment\JukeBox_V1\JukeboxAuto.py
set testname=CSR_Combined_StandBy_NoPRE_NoPost_
set listpath=C:\AutomationEnvironment\lists\
set noisefilespath=C:\AutomationEnvironment\NoiseFiles\
set CarNoise=%noisefilespath%Headset_Car80_Noise.wav
set BabbleNoise=%noisefilespath%Babble-20kHz-2min-11dB.wav
set CafeteriaNoise=%noisefilespath%cafeteria_mono_150s.wav
set OfficeNoise=%noisefilespath%Headset_Office_Noise.wav
set StreetNoise=%noisefilespath%street_mono_193s.wav
set CrossroadsNoise=%noisefilespath%Crossroads.wav
set Winds_5msNoise=%noisefilespath%Wind_5ms.wav
set Winds_4msNoise=%noisefilespath%Wind_4ms.wav
set Winds_3msNoise=%noisefilespath%Wind_3ms.wav


PYTHON %JukeBox15% %logpath%%testname%Rubidium_files_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 0 -20 4 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG%
REM Friends - 22 minutes
PYTHON %JukeBox15% %logpath%%testname%LongTalks-Friends_%TIMESTAMP%.txt %listpath%FA_LongTalks12_Alexa.txt None 0 0 9 0 Listener TRIG Alexa Long_Talks_Model_08 None 2>>%ERRLOG%
pause
PYTHON %JukeBox15% %logpath%%testname%Street-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 0 9 0 EB TRIG Alexa Model_09 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -20 9 0 EB TRIG Aexa Model_09 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%_Babble-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 -20 4 0 EB TRIG Model_09 None 2>>%ERRLOG%
pause

REM Sanity
PYTHON %JukeBox15% %logpath%%testname%_25_files_Babble-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_25.txt %BabbleNoise% 0 0 9 0 EB TRIG Alexa Right None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%LongTalks2_Part1_%TIMESTAMP%.txt %listpath%FA_LongTalks2_Part1_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_Right None 2>>%ERRLOG%


REM Noises
PYTHON %JukeBox15% %logpath%%testname%Babble-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 0 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%Cafeteria_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 5 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%Car80-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 0 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%Office_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 5 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%Street-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 0 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%Crossroads-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 -10 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%Wind_5ms-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 -5 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%Wind_4ms-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 0 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%Wind_3ms_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 5 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%


REM FA 2-Words
PYTHON %JukeBox15% %logpath%%testname%FA_2words_8213_Trig_%TIMESTAMP%.txt %listpath%FA_2words_8213_Trig_Alexa.txt %CarNoise% 0 -20 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%

REM Long Talks
PYTHON %JukeBox15% %logpath%%testname%LongTalks1_%TIMESTAMP%.txt %listpath%FA_LongTalks1_Alexa.txt None 0 0 9 0 Listener TRIG Alexa Long_Talks_Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%LongTalks2_%TIMESTAMP%.txt %listpath%FA_LongTalks2_Alexa.txt None 0 0 9 0 Listener TRIG Alexa Long_Talks_Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%LongTalks3_%TIMESTAMP%.txt %listpath%FA_LongTalks3_Alexa.txt None 0 0 9 0 Listener TRIG Alexa Long_Talks_Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%LongTalks4_%TIMESTAMP%.txt %listpath%FA_LongTalks4_Alexa.txt None 0 0 9 0 Listener TRIG Alexa Long_Talks_Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%LongTalks5_%TIMESTAMP%.txt %listpath%FA_LongTalks5_Alexa.txt None 0 0 9 0 Listener TRIG Alexa Long_Talks_Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%LongTalks6_%TIMESTAMP%.txt %listpath%FA_LongTalks6_Alexa.txt None 0 0 9 0 Listener TRIG Alexa Long_Talks_Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%LongTalks7_%TIMESTAMP%.txt %listpath%FA_LongTalks7_Alexa.txt None 0 0 9 0 Listener TRIG Alexa Long_Talks_Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%LongTalks8_%TIMESTAMP%.txt %listpath%FA_LongTalks8_Alexa.txt None 0 0 9 0 Listener TRIG Alexa Long_Talks_Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%LongTalks9_%TIMESTAMP%.txt %listpath%FA_LongTalks9_Alexa.txt None 0 0 9 0 Listener TRIG Alexa Long_Talks_Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%LongTalks10_%TIMESTAMP%.txt %listpath%FA_LongTalks10_Alexa.txt None 0 0 9 0 Listener TRIG Alexa Long_Talks_Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%LongTalks11_%TIMESTAMP%.txt %listpath%FA_LongTalks11_Alexa.txt None 0 0 9 0 Listener TRIG Alexa Long_Talks_Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%LongTalks-Friends_%TIMESTAMP%.txt %listpath%FA_LongTalks12_Alexa.txt None 0 0 9 0 Listener TRIG Alexa Long_Talks_Model_08 None 2>>%ERRLOG%

REM Noises
PYTHON %JukeBox15% %logpath%%testname%Babble--5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 -5 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%Cafeteria_0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 0 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%Car80--5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -5 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%Office_0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 0 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%Street--5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 -5 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%Crossroads-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 -15 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%Wind_5ms-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 -10 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%Wind_4ms--5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 -5 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox15% %logpath%%testname%Wind_3ms_0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 0 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
