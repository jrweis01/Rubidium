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
set testname=CSR_Combined_SBC_without_Preceding_Silence_NoPost_
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

REM Car80 -20

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds1_Car80-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION1.txt %CarNoise% 0 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds2_Car80-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION2.txt %CarNoise% 0 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds3_Car80-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION3.txt %CarNoise% 0 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds4_Car80-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION4.txt %CarNoise% 0 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM Car80 -15


REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds1_Car80-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION1.txt %CarNoise% 0 -15 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds2_Car80-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION2.txt %CarNoise% 0 -15 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds3_Car80-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION3.txt %CarNoise% 0 -15 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds4_Car80-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION4.txt %CarNoise% 0 -15 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%


REM Car80 -10

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds1_Car80-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION1.txt %CarNoise% 0 -10 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds2_Car80-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION2.txt %CarNoise% 0 -10 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds3_Car80-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION3.txt %CarNoise% 0 -10 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds4_Car80-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION4.txt %CarNoise% 0 -10 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM Car80 -5

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds1_Car80-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION1.txt %CarNoise% 0 -5 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds2_Car80-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION2.txt %CarNoise% 0 -5 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds3_Car80-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION3.txt %CarNoise% 0 -5 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds4_Car80-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION4.txt %CarNoise% 0 -5 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM Car80 0

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds1_Car80-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION1.txt %CarNoise% 0 0 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds2_Car80-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION2.txt %CarNoise% 0 0 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds3_Car80-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION3.txt %CarNoise% 0 0 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds4_Car80-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION4.txt %CarNoise% 0 0 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%


REM REM Car 80 -20  - testing again to compare with old results (from full list test)

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds1_Car80-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION1.txt %CarNoise% 0 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds2_Car80-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION2.txt %CarNoise% 0 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds3_Car80-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION3.txt %CarNoise% 0 -20 15 4 LJ TRIG/ASR General ST_VE-Meds1 ST_VE-Meds2 "Trigger" "empty" 2>>%ERRLOG%

PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds4_Car80-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION4.txt %CarNoise% 0 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%


REM Cafeteria -5

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds1_Cafeteria-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION1.txt %CafeteriaNoise% 0 -5 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds2_Cafeteria-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION2.txt %CafeteriaNoise% 0 -5 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds3_Cafeteria-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION3.txt %CafeteriaNoise% 0 -5 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds4_Cafeteria-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION4.txt %CafeteriaNoise% 0 -5 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM Cafeteria 0

PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds1_Cafeteria-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION1.txt %CafeteriaNoise% 0 0 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds2_Cafeteria-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION2.txt %CafeteriaNoise% 0 0 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds3_Cafeteria-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION3.txt %CafeteriaNoise% 0 0 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds4_Cafeteria-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION4.txt %CafeteriaNoise% 0 0 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM Office -5

Python %JukeBox20% %logpath%ST_VoiceExpress-Meds1_Office-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION1.txt %OfficeNoise% 0 -5 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

Python %JukeBox20% %logpath%ST_VoiceExpress-Meds2_Office-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION2.txt %OfficeNoise% 0 -5 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

Python %JukeBox20% %logpath%ST_VoiceExpress-Meds3_Office-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION3.txt %OfficeNoise% 0 -5 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

Python %JukeBox20% %logpath%ST_VoiceExpress-Meds4_Office-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION4.txt %OfficeNoise% 0 -5 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%


REM Office 0

PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds1_Office-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION1.txt %OfficeNoise% 0 0 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds2_Office-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION2.txt %OfficeNoise% 0 0 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds3_Office-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION3.txt %OfficeNoise% 0 0 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds4_Office-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION4.txt %OfficeNoise% 0 0 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%


REM Babble -5

Python %JukeBox20% %logpath%ST_VoiceExpress-Meds1_Babble-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION1.txt %BabbleNoise% 0 -5 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

Python %JukeBox20% %logpath%ST_VoiceExpress-Meds2_Babble-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION2.txt %BabbleNoise% 0 -5 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

Python %JukeBox20% %logpath%ST_VoiceExpress-Meds3_Babble-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION3.txt %BabbleNoise% 0 -5 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

Python %JukeBox20% %logpath%ST_VoiceExpress-Meds4_Babble-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION4.txt %BabbleNoise% 0 -5 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

REM Babble 0

Python %JukeBox20% %logpath%ST_VoiceExpress-Meds1_Babble-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION1.txt %BabbleNoise% 0 0 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

Python %JukeBox20% %logpath%ST_VoiceExpress-Meds2_Babble-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION2.txt %BabbleNoise% 0 0 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

Python %JukeBox20% %logpath%ST_VoiceExpress-Meds3_Babble-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION3.txt %BabbleNoise% 0 0 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%

Python %JukeBox20% %logpath%ST_VoiceExpress-Meds4_Babble-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION4.txt %BabbleNoise% 0 0 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%



REM FA

REM 2words
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_FA_2words_%TIMESTAMP%.txt %listpath%FA_2Words_8213_ASR_With_TRIG-HeyJabra.txt %CarNoise% 0 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%


REM REM Dynamic Range
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20-33.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -33 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20-30.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -30 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20-27.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -27 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20-24.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -24 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20-21.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -21 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20-18.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -18 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20-15.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -15 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20-12.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -12 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20-9.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -9 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20-6.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -6 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20-3.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -3 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20_0.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20_3.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 3 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20_6.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 6 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20_9.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 9 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20_12.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 12 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20_15.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 15 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20_18.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 18 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20_21.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 21 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
pYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20_24.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 24 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20_27.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 27 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress-Meds_Dynamic_Range_Car80-20_30.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 30 -20 10 4 LJ TRIG/ASR General ST_VE-Meds None "Trigger" "empty" 2>>%ERRLOG%
