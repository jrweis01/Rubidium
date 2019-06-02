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
set testname=Grandsun_Revision-3547_SBC
REM set testname=CSR_Combined_A2DP_NOPre_NoPost_
REM set testname=grandson_28_9FT-distance_
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
set Winds_2msNoise=%noisefilespath%Wind_2ms.wav

PYTHON %JukeBox20% %logpath%%testname%CSR_Alexa_Car80-20_%TIMESTAMP%.txt %listpath%Amazon_Long_FA_File.txt %CarNoise% 0 -20 25 4 MP Trig/ASR Alexa Rubidium None "Amazon Listening" "Waiting for Trigger" 86500 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%CSR_Alexa_Car80-20_%TIMESTAMP%.txt %listpath%list_Alexa_network_WhatsTheTime_5files.txt %CarNoise% 0 -20 25 4 MP Trig/ASR Alexa Rubidium None "Amazon Listening" "Waiting for Trigger" 2>>%ERRLOG%
pause
REM PYTHON %JukeBox20% %logpath%%testname%_5_before_5-unrecognized_then_5_more_Car80-20_%TIMESTAMP%.txt %listpath%5_before_5-unrecognized_then_5_more.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%


REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 0 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%


REM PYTHON %JukeBox20% %logpath%%testname%_Babble-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 0 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble_10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%%testname%_LongTalks-Friends_%TIMESTAMP%.txt %listpath%FA_LongTalks12_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_SBC None 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%%testname%_5_before_5-unrecognized_then_5_more_Car80-20_%TIMESTAMP%.txt %listpath%5_before_5-unrecognized_then_5_more.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_(2nd-test)_5_before_5-unrecognized_then_5_more_Car80-20_%TIMESTAMP%.txt %listpath%5_before_5-unrecognized_then_5_more.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_(3rd-test)_5_before_5-unrecognized_then_5_more_Car80-20_%TIMESTAMP%.txt %listpath%5_before_5-unrecognized_then_5_more.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%


REM PYTHON %JukeBox20% %logpath%%testname%_5_before_5-unrecognized_then_10_more_Car80-20_%TIMESTAMP%.txt %listpath%5_before_5-unrecognized_then_10_more.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_10_before_5-unrecognized_then_10_more_Car80-20_%TIMESTAMP%.txt %listpath%10_before_5-unrecognized_then_10_more.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_20_before_5-unrecognized_then_10_more_Car80-20_%TIMESTAMP%.txt %listpath%20_before_5-unrecognized_then_10_more.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%




REM REM Test 28 files
REM Python %JukeBox20% %logpath%%testname%Car-20_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 0 -20 0 0 Listener TRIG Alexa RightChip None "" "" "" "" 300 2>>%ERRLOG%
REM Python %JukeBox20% %logpath%%testname%Car0_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 0 0 0 0 Listener TRIG Alexa RightChip None "" "" "" "" 300 2>>%ERRLOG%
REM Python %JukeBox20% %logpath%%testname%Babble0_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %BabbleNoise% 0 0 0 0 Listener TRIG Alexa RightChip None "" "" "" "" 300 2>>%ERRLOG%


REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%


REM REM PYTHON %JukeBox20% %logpath%%testname%LongTalks-Friends_%TIMESTAMP%.txt %listpath%FA_LongTalks12_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_aptX Long_Talks_Standby 2>>%ERRLOG%
REM REM pause
REM REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%






REM testing noises

REM -20dB
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 -20 6 0 EB TRIG Alexa Model_09 Counter2 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%


REM Noises 0dB
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 0 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble_0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 0 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 0 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 0 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 0 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 0 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 0 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 0 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 0 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 0 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%

REM Noises 10dB
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%



REM STREET
PYTHON %JukeBox20% %logpath%%testname%_street-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 -15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_street-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 -10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_street-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 -5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_street_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street_10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_street_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_street_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street_25_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 25 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%

REM OFFICE
PYTHON %JukeBox20% %logpath%%testname%_Office-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 -15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Office-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 -10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Office-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 -5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Office_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Office_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Office_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Office_25_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 25 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 30 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%

REM CAR80
PYTHON %JukeBox20% %logpath%%testname%_Car80-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 0 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_25_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 25 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 30 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%



REM  BABBLE
PYTHON %JukeBox20% %logpath%%testname%_Babble-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 -15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 -10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 -5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%

REM Cafeteria
PYTHON %JukeBox20% %logpath%%testname%_cafeteria-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 -15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 -10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 -5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria_25_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 25 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 30 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%

REM crossroads
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 -15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 -10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 -5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%


REM WINDS
PYTHON %JukeBox20% %logpath%%testname%_5ms-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 -15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_5ms-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 -10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_5ms-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 -5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_5ms_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%

PYTHON %JukeBox20% %logpath%%testname%_4ms-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 -15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_4ms-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 -10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_4ms-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 -5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_4ms_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_4ms_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_4ms_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_4ms_25_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 25 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%

PYTHON %JukeBox20% %logpath%%testname%_3ms-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 -15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_3ms-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 -10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_3ms-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 -5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_3ms_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_3ms_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_3ms_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_3ms_25_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 25 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%

PYTHON %JukeBox20% %logpath%%testname%_2ms-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 -15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_2ms-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 -10 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_2ms-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 -5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_2ms_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 5 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_2ms_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 15 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_2ms_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_2ms_25_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 25 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_2ms_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 30 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%


REM REM Silence
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG% 
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_3min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 180 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify2_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_5min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 300 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify3_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 600 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify4_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_15min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 900 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify5_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_20min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 1200 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify6_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_25min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 1500 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify7_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_30min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 1800 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify8_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%

PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa SBC None 2>>%ERRLOG% 
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_3min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 180 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify2_4SEC-DELAY_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify2_8SEC-DELAY_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_5min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 300 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify3_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 600 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify4_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_15min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 900 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify5_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_20min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 1200 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify6_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_25min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 1500 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify7_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_30min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 1800 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify8_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%




REM FA
REM FA 2-Words
REM PYTHON %JukeBox20% %logpath%%testname%FA_2words_8213_Trig_%TIMESTAMP%.txt %listpath%FA_2words_8213_Trig_Alexa.txt %CarNoise% 0 -20 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%

PYTHON %JukeBox20% %logpath%%testname%FA_2words_8213_Trig_PART1_%TIMESTAMP%.txt %listpath%FA_2words_8213_Trig_Alexa_PART1.txt %CarNoise% 0 -20 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%FA_2words_8213_Trig_PART2_%TIMESTAMP%.txt %listpath%FA_2words_8213_Trig_Alexa_PART2.txt %CarNoise% 0 -20 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%FA_2words_8213_Trig_PART3_%TIMESTAMP%.txt %listpath%FA_2words_8213_Trig_Alexa_PART3.txt %CarNoise% 0 -20 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%FA_2words_8213_Trig_PART4_%TIMESTAMP%.txt %listpath%FA_2words_8213_Trig_Alexa_PART4.txt %CarNoise% 0 -20 9 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%

REM Long Talks
PYTHON %JukeBox20% %logpath%%testname%LongTalks1_%TIMESTAMP%.txt %listpath%FA_LongTalks1_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks2_%TIMESTAMP%.txt %listpath%FA_LongTalks2_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks3_%TIMESTAMP%.txt %listpath%FA_LongTalks3_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks4_%TIMESTAMP%.txt %listpath%FA_LongTalks4_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks5_%TIMESTAMP%.txt %listpath%FA_LongTalks5_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks6_%TIMESTAMP%.txt %listpath%FA_LongTalks6_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks7_%TIMESTAMP%.txt %listpath%FA_LongTalks7_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks8_%TIMESTAMP%.txt %listpath%FA_LongTalks8_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks9_%TIMESTAMP%.txt %listpath%FA_LongTalks9_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks10_%TIMESTAMP%.txt %listpath%FA_LongTalks10_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks11_%TIMESTAMP%.txt %listpath%FA_LongTalks11_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_SBC None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%LongTalks-Friends_%TIMESTAMP%.txt %listpath%FA_LongTalks12_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_SBC None 2>>%ERRLOG%

REM FA NOISES
REM BABBLE
PYTHON %JukeBox20% %logpath%%testname%_Babble_0_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %BabbleNoise% 0 0 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_0_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %BabbleNoise% 0 0 600 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_0_Verify2_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %BabbleNoise% 0 0 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_10_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %BabbleNoise% 0 10 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_10_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %BabbleNoise% 0 10 600 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_10_Verify2_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %BabbleNoise% 0 10 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
REM CAR80
PYTHON %JukeBox20% %logpath%%testname%_Car80_0_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 0 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_0_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 0 600 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_0_Verify2_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 0 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_10_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 10 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_10_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 10 600 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_10_Verify2_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 10 8 0 Listener TRIG Alexa SBC None 2>>%ERRLOG%


REM REM Dynamic Range
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-54_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -54 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG% 
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-51_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -51 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-48_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -48 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-45_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -45 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-42_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -42 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-39_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -33 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -30 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-27_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -27 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-24_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -24 -30 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-21_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -21 -30 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-18_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -18 -30 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -15 -30 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-12_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -12 -30 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-9_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -9 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-6_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -6 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-3_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -3 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_3_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 3 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_6_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 6 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_9_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 9 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_12_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 12 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 15 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_18_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 18 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_21_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 21 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
pYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_24_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 24 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_27_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 27 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 30 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_33_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 33 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_36_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 36 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_39_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 39 -20 4 0 EB TRIG Alexa SBC None 2>>%ERRLOG%

