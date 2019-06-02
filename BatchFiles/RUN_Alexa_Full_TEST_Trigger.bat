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
set testname=Trunk_Revision-3591_Standby_
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
set Microwave=%noisefilespath%Microwave_Sound_Effect_30_sec_White_Noise_16k16bMonoNorm49.wav
set Music=%noisefilespath%05_happy_(from_despicable_me_2)_16k16MonoNorm49.wav

Python %JukeBox20% %logpath%%testname%Car-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X30.txt %CarNoise% 0 -20 3 0 LJ TRIG Alexa "Long_Talks" COM21 None "" "" "" "" 300 2>>%ERRLOG%
pause


PYTHON %JukeBox20% %logpath%%testname%Car-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X30.txt %CarNoise% 0 -20 8 0 Listener TRIG Alexa SNR Trigger None 2>>%ERRLOG%

PYTHON %JukeBox20% %logpath%%testname%_Babble-0_%TIMESTAMP%.txt %listpath%Alexa_trigger_X30.txt %BabbleNoise% 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X30.txt %BabbleNoise% 0 -20 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%

Pause
REM PYTHON %JukeBox20% %logpath%%testname%_Music-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Music% 0 -20 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Music-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Music% 0 -15 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Music-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Music% 0 -10 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Music-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Music% 0 -5 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%


PYTHON %JukeBox20% %logpath%%testname%_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 0 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Babble-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 0 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%%testname%_LongTalks-Friends_%TIMESTAMP%.txt %listpath%FA_LongTalks12_Alexa.txt None 0 0 6 0 Listener TRIG Alexa Long_Talks_SBC None "" "" "" "" 1640 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%%testname%_Babble_0_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %BabbleNoise% 0 0 600 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
REM pause

REM REM REM Test 28 files
REM REM Python %JukeBox20% %logpath%%testname%Car-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X30.txt %CarNoise% 0 -20 8 0 Listener TRIG Alexa RightChip None "" "" "" "" 300 2>>%ERRLOG%
REM REM Python %JukeBox20% %logpath%%testname%Car0_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 0 0 0 0 Listener TRIG Alexa RightChip None "" "" "" "" 300 2>>%ERRLOG%
REM REM Python %JukeBox20% %logpath%%testname%Babble0_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %BabbleNoise% 0 0 0 0 Listener TRIG Alexa RightChip None "" "" "" "" 300 2>>%ERRLOG%

REM REM Dynamic Range
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-54_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -54 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG% 
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-51_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -51 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-48_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -48 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-45_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -45 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-42_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -42 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-39_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -33 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -30 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-27_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -27 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-24_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -24 -30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-21_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -21 -30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-18_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -18 -30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -15 -30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-12_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -12 -30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-9_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -9 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-6_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -6 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-3_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -3 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_3_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 3 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_6_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 6 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_9_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 9 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_12_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 12 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 15 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_18_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 18 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_21_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 21 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
pYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_24_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 24 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_27_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 27 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 30 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_33_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 33 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_36_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 36 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_39_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 39 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%

REM FA NOISES
Rem Car80

PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG% 
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_3min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 180 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify2_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_5min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 300 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify3_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 600 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify4_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_15min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 900 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify5_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_20min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 1200 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify6_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_25min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 1500 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify7_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_30min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 1800 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify8_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM testing noises

REM REM -20dB
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Office-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_street-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 -20 6 0 EB TRIG Alexa Model_09 Counter2 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_5ms-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_4ms-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_3ms-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_2ms-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Music% 0 -20 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave-20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Microwave% 0 -20 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%




REM Noises -15dB
PYTHON %JukeBox20% %logpath%%testname%_Car80-15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble-15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria-15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Office-15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_street-15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms-15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms-15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms-15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms-15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Music% 0 -15 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Microwave% 0 -15 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%


REM Noises -10dB
PYTHON %JukeBox20% %logpath%%testname%_Car80-10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble-10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria-10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Office-10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_street-10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms-10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms-10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms-10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms-10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Music% 0 -10 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Microwave% 0 -10 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%


REM Noises -5dB
PYTHON %JukeBox20% %logpath%%testname%_Car80-5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble-5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria-5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Office-5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_street-5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms-5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms-5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms-5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms-5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Music% 0 -5 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Microwave% 0 -5 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%


REM REM Noises 0dB
REM REM PYTHON %JukeBox20% %logpath%%testname%_Car80_0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 0 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Babble_0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 0 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 0 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Office-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 0 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_street-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 0 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 0 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 0 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 0 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 0 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 0 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music_0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Music% 0 0 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave_0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Microwave% 0 0 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%



REM Noises 5dB
PYTHON %JukeBox20% %logpath%%testname%_Car80_5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria_5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Office_5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_street_5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads_5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms_5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms_5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms_5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms_5_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Music% 0 5 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Microwave% 0 5 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%


REM Noises 10dB
PYTHON %JukeBox20% %logpath%%testname%_Car80_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Office_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_street_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms_10_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music_10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Music% 0 10 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave_10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Microwave% 0 10 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%

REM Noises 15dB
PYTHON %JukeBox20% %logpath%%testname%_Car80_15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria_15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Office_15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_street_15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads_15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms_15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms_15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms_15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms_15_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Music% 0 15 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Microwave% 0 15 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%

REM Noises 20dB
PYTHON %JukeBox20% %logpath%%testname%_Car80_20_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_20_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria_20_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Office_20_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_street_20_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads_20_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms_20_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms_20_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms_20_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms_20_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Music% 0 20 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Microwave% 0 20 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%

REM Noises 25dB
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_25_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble_25_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria_25_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Office_25_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street_25_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads_25_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms_25_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms_25_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms_25_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms_25_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Music_25_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Music% 0 25 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave_25_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Microwave% 0 25 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%

REM Noises 30dB
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_30_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble_30_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria_30_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office_30_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street_30_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads_30_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms_30_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms_30_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms_30_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms_30_%timestamp%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Music_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Music% 0 30 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Microwave_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Microwave% 0 30 8 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%



REM REM STREET
REM REM PYTHON %JukeBox20% %logpath%%testname%_street-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_street_10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_street_25_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %StreetNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%

REM REM OFFICE
REM PYTHON %JukeBox20% %logpath%%testname%_Office-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office_25_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Office_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %OfficeNoise% 0 30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%

REM REM CAR80
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Car80_0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 0 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Car80_25_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Car80_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%



REM REM  BABBLE
REM PYTHON %JukeBox20% %logpath%%testname%_Babble-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %BabbleNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%

REM REM Cafeteria
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria_25_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CafeteriaNoise% 0 30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%

REM REM crossroads
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CrossroadsNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%


REM REM WINDS
REM PYTHON %JukeBox20% %logpath%%testname%_5ms-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_5msNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%%testname%_4ms-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms_25_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_4msNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%%testname%_3ms-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms_25_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_3msNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%%testname%_2ms-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 -15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms-10_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 -10 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms-5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 -5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms_5_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 5 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 15 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms_20_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms_25_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 25 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %Winds_2msNoise% 0 30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%


REM REM Silence
PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG% 
PYTHON %JukeBox20% %logpath%%testname%_Silence_3min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 180 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify2_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_5min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 300 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify3_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 600 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify4_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_15min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 900 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify5_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_20min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 1200 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify6_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_25min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 1500 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify7_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_30min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 1800 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify8_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%


REM FA NOISES
Rem Car80

PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG% 
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_3min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 180 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify2_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_5min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 300 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify3_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 600 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify4_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_15min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 900 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify5_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_20min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 1200 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify6_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_25min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 1500 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify7_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_30min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 1800 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify8_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 4 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%


REM CAR80 0, 10
PYTHON %JukeBox20% %logpath%%testname%_Car80_0_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_0_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 0 600 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_0_Verify2_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_10_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 10 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_10_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 10 600 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_10_Verify2_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 10 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%

REM BABBLE 0, 10

PYTHON %JukeBox20% %logpath%%testname%_Babble-20_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %BabbleNoise% 0 -20 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble-20_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %BabbleNoise% 0 -20 600 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble-20_Verify2_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %BabbleNoise% 0 -20 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_0_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %BabbleNoise% 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_0_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %BabbleNoise% 0 0 600 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_0_Verify2_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %BabbleNoise% 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_10_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %BabbleNoise% 0 10 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_10_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %BabbleNoise% 0 10 600 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_10_Verify2_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %BabbleNoise% 0 10 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%


REM FA
REM FA 2-Words
REM PYTHON %JukeBox20% %logpath%%testname%FA_2words_8213_Trig_%TIMESTAMP%.txt %listpath%FA_2words_8213_Trig_Alexa.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%

PYTHON %JukeBox20% %logpath%%testname%FA_2words_8213_Trig_PART1_%TIMESTAMP%.txt %listpath%FA_2words_8213_Trig_Alexa_PART1.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%FA_2words_8213_Trig_PART2_%TIMESTAMP%.txt %listpath%FA_2words_8213_Trig_Alexa_PART2.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%FA_2words_8213_Trig_PART3_%TIMESTAMP%.txt %listpath%FA_2words_8213_Trig_Alexa_PART3.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%FA_2words_8213_Trig_PART4_%TIMESTAMP%.txt %listpath%FA_2words_8213_Trig_Alexa_PART4.txt %CarNoise% 0 -20 4 0 EB TRIG Alexa Model_08 None 2>>%ERRLOG%




REM REM Long Talks
PYTHON %JukeBox20% %logpath%%testname%LongTalks1_%TIMESTAMP%.txt %listpath%FA_LongTalks1_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_Standby None "" "" "" "" 1200 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks2_%TIMESTAMP%.txt %listpath%FA_LongTalks2_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_Standby None "" "" "" "" 8500 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks3_%TIMESTAMP%.txt %listpath%FA_LongTalks3_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_Standby None "" "" "" "" 6500 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks4_%TIMESTAMP%.txt %listpath%FA_LongTalks4_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_Standby None "" "" "" "" 6500 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks5_%TIMESTAMP%.txt %listpath%FA_LongTalks5_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_Standby None "" "" "" "" 4450 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks6_%TIMESTAMP%.txt %listpath%FA_LongTalks6_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_Standby None "" "" "" "" 1100 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks7_%TIMESTAMP%.txt %listpath%FA_LongTalks7_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_Standby None "" "" "" "" 5500 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks8_%TIMESTAMP%.txt %listpath%FA_LongTalks8_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_Standby None "" "" "" "" 6300 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks9_%TIMESTAMP%.txt %listpath%FA_LongTalks9_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_Standby None "" "" "" "" 5500 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks10_%TIMESTAMP%.txt %listpath%FA_LongTalks10_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_Standby None "" "" "" "" 2800 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks11_%TIMESTAMP%.txt %listpath%FA_LongTalks11_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_Standby None "" "" "" "" 3500 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%LongTalks-Friends_%TIMESTAMP%.txt %listpath%FA_LongTalks12_Alexa.txt None 0 0 4 0 Listener TRIG Alexa Long_Talks_Standby None "" "" "" "" 1640 2>>%ERRLOG%


REM Amazon 24Hr FA
PYTHON %JukeBox20% %logpath%%testname%_FARTestRecording_24_hrs_16kHz_Norm49_0_%TIMESTAMP%.txt %listpath%24-Hours-FA_from_Amazon.txt None 0 0 6 0 EB TRIG Alexa Standby None "" "" "" "" 86700 2>>%ERRLOG%



REM REM Dynamic Range
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-54_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -54 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG% 
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-51_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -51 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-48_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -48 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-45_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -45 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-42_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -42 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-39_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -33 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -30 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-27_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -27 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-24_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -24 -30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-21_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -21 -30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-18_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -18 -30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -15 -30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-12_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -12 -30 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-9_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -9 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-6_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -6 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-3_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% -3 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 0 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_3_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 3 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_6_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 6 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_9_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 9 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_12_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 12 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 15 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_18_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 18 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_21_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 21 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
pYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_24_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 24 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_27_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 27 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 30 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_33_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 33 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_36_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 36 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20_39_%TIMESTAMP%.txt %listpath%Alexa_Amazon_419.txt %CarNoise% 39 -20 8 0 EB TRIG Alexa Trigger None 2>>%ERRLOG%

REM REM Silence
PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG% 
PYTHON %JukeBox20% %logpath%%testname%_Silence_3min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 180 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify2_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_5min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 300 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify3_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 600 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify4_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_15min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 900 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify5_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_20min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 1200 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify6_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_25min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 1500 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify7_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_30min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt None 0 0 1800 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify8_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt None 0 0 8 0 Listener TRIG Alexa Trigger None 2>>%ERRLOG%