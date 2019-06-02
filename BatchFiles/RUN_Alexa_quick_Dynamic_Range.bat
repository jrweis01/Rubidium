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
set testname=CSR_Combined_Standby_rev-3585_Dynamic_Range_A2DP_
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

PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20_Sanity_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 0 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%


REM Silence
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify1_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 6 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG% 
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_3min_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 180 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify2_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 6 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_5min_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 300 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify3_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 6 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_10min_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 600 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify4_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 6 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_15min_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 900 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify5_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 6 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_20min_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 1200 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify6_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 6 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_25min_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 1500 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify7_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 6 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_30min_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %CarNoise% 0 -20 1800 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Silence_Verify8_Car80-20_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %CarNoise% 0 -20 6 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG%



REM REM Dynamic Range
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20_Sanity_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 0 -20 4 0 Listener TRIG Aexa Model_09 None 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-54_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -54 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG% 
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-51_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -51 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-48_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -48 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-45_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -45 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-42_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -42 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-39_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -33 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-30_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -30 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-27_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -27 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-24_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -24 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-21_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -21 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-18_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -18 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-15_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -15 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-12_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -12 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-9_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -9 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-6_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -6 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-3_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -3 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20_0_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 0 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20_3_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 3 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20_6_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 6 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20_9_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 9 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_A2DP_Dynamic_Range_Car80-20_12_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 12 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_A2DP_Dynamic_Range_Car80-20_15_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 15 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_A2DP_Dynamic_Range_Car80-20_18_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 18 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20_21_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 21 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM pYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20_24_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 24 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20_27_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 27 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20-6_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% -6 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20_30_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 30 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20_33_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 33 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20_36_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 36 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Standby_Dynamic_Range_Car80-20_39_%TIMESTAMP%.txt %listpath%Alexa_Rubidium_28_files.txt %CarNoise% 39 -20 4 0 Listener TRIG Aexa Model_09 None "" "" "" "" 300 2>>%ERRLOG%


