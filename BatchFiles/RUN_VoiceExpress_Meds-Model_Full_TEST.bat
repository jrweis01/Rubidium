Rem Setting up Error log
set TIMESTAMP=%DATE:/=-%@%TIME::=-%
set TIMESTAMP=%TIMESTAMP: =%
set ERRLOG=%TIMESTAMP:,=.%.txt
set ERRLOG=C:\AutomationEnvironment\Logs\%ERRLOG%
echo %ERRLOG%
ECHO %TIMESTAMP%
echo 'CMD Error Log'>%ERRLOG%
REM Setting paths to be re-used
set JukeBox20=C:\AutomationEnvironment\Jukebox\JukeBox_main.py
set JukeBox15=C:\AutomationEnvironment\JukeBox_V1\JukeboxAuto.py
set logpath=C:\AUTOMATIONENVIRONMENT\logs\
set listpath=C:\AutomationEnvironment\lists\
set noisefilespath=C:\AutomationEnvironment\NoiseFiles\
set CarNoise=%noisefilespath%Headset_Car80_Noise.wav
set BabbleNoise=%noisefilespath%Babble-20kH.wav-2min-11dB.wav

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80_0_delay12_EB_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 0 12 0 EB TRIG/ASR VE-Meds Without_PS With_PS 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80_0_delay12_LJ_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 0 12 0 EB TRIG/ASR VE-Meds Without_PS With_PS 2>>%ERRLOG%
REM pause

REM -20dB
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Crossroads-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Crossroads.wav 0 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__5ms-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__4ms-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__3ms-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__2ms-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%


REM Noises 10dB
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Crossroads_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Crossroads.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__5ms_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__4ms_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__3ms_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__2ms_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%

REM REM Noises 0dB
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble_0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 0 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 0 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 0 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 0 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 0 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Crossroads-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Crossroads.wav 0 0 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__5ms-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 0 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__4ms-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 0 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__3ms-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 0 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__2ms-0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 0 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%


rem 
rem PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80_10_no_signal_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -36 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%

REM REM FA
REM REM REM 2words
PYTHON %JukeBox20% %logpath%list_FA_2words_%TIMESTAMP%.txt %listpath%FA_2Words_8213_ASR_With_TRIG-HeyJabra.txt %CarNoise% 0 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%

Rem FA LongTalksPYTHON %JukeBox20% %logpath%LongTalks1_%TIMESTAMP%.txt %listpath%FA_LongTalks1.txt None 0 -20 2 0 EB TRIG/ASR VE-Meds Rubidium Rubidium 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%LongTalks1_%TIMESTAMP%.txt %listpath%FA_LongTalks1.txt None 0 -20 2 0 EB TRIG/ASR VE-Meds Rubidium Rubidium 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%LongTalks2_%TIMESTAMP%.txt %listpath%FA_LongTalks2.txt None 0 -20 2 0 EB TRIG/ASR VE-Meds Rubidium Rubidium 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%LongTalks3_%TIMESTAMP%.txt %listpath%FA_LongTalks3.txt None 0 -20 2 0 EB TRIG/ASR VE-Meds Rubidium Rubidium 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%LongTalks4_%TIMESTAMP%.txt %listpath%FA_LongTalks4.txt None 0 -20 2 0 EB TRIG/ASR VE-Meds Rubidium Rubidium 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%LongTalks5_%TIMESTAMP%.txt %listpath%FA_LongTalks5.txt None 0 -20 2 0 EB TRIG/ASR VE-Meds Rubidium Rubidium 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%LongTalks6_%TIMESTAMP%.txt %listpath%FA_LongTalks6.txt None 0 -20 2 0 EB TRIG/ASR VE-Meds Rubidium Rubidium 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%LongTalks7_%TIMESTAMP%.txt %listpath%FA_LongTalks7.txt None 0 -20 2 0 EB TRIG/ASR VE-Meds Rubidium Rubidium 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%LongTalks8_%TIMESTAMP%.txt %listpath%FA_LongTalks8.txt None 0 -20 2 0 EB TRIG/ASR VE-Meds Rubidium Rubidium 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%LongTalks9_%TIMESTAMP%.txt %listpath%FA_LongTalks9.txt None 0 -20 2 0 EB TRIG/ASR VE-Meds Rubidium Rubidium 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%LongTalks10_%TIMESTAMP%.txt %listpath%FA_LongTalks10.txt None 0 -20 2 0 EB TRIG/ASR VE-Meds Rubidium Rubidium 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%LongTalks11_%TIMESTAMP%.txt %listpath%FA_LongTalks11.txt None 0 -20 2 0 EB TRIG/ASR VE-Meds Rubidium Rubidium 2>>%ERRLOG%
 
REM Car80 noise
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 -15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 -10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 -5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80_5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80_15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
rem PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80_20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
rem PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80_25_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 25 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
rem PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80_30_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 30 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%

REM BABBLE
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 -15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 -10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 -5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble_5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble_15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
rem PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble_20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%

REM Cafeteria
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 -15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 -10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 -5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria_5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria_15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria_20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
rem PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria_25_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 25 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
rem PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria_30_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 30 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%

REM OFFICE
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 -15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 -10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 -5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office_5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office_15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office_20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office_25_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 25 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office_30_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 30 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%


REM STREET
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 -15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 -10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 -5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street_5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street_15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street_20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
rem PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street_25_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 25 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%



REM Sanity
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble-20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%



REM REM Noises 10dB
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Car80_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Crossroads_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Crossroads.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__5ms_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__4ms_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__3ms_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__2ms_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%


REM REM REM Long Talks
REM PYTHON %JukeBox20% %logpath%CSR_Production_Stand_By_FA_longTalks_%TIMESTAMP%.txt %listpath%FA_LongTalks.txt %CarNoise% 0 -20 20 20 LJ-MP TRIG/ASR Alexa Rubidium None "lj- trigger" "MP- Waiting for Trigger" 2>>%ERRLOG%
REM "C:\AutomationEnvironment\WinAutomation_Executables\Run_Long_Files_With_EB_CSV.exe" C:\\AutomationEnvironment\\lists\\FA_LongTalks_with_Times.csv "Time per wav in the list (csv)" 0 Google EB Rubidium-Alexa Rubidium-Google



REM REM Dynamic Range
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20-54_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -54 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG% 
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20-51_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -51 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20-48_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -48 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20-45_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -45 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20-42_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -42 -20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20-39_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -33 -50 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20-30_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -30 -50 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20-27_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -27 -50 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20-24_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -24 -50 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20-21_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -21 -50 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20_24_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 24 -50 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20_27_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 27 -50 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20_30_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 30 -50 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20_33_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 33 -50 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
rem PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20_36_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 36 -50 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
rem PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20_39_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 39 -50 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20-18_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -18 -60 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -15 -60 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20-12_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -12 -60 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20-9_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -9 -60 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20-6_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -6 -60 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20-3_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% -3 -60 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20_0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 0 -60 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20_3_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 3 -60 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20_6_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 6 -60 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20_9_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 9 -60 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20_12_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 12 -60 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20_15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 15 -60 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20_18_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 18 -60 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Dynamic_Range_8sec_Car80-20_21_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %CarNoise% 21 -60 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%






REM FA
REM short 2words
REM PYTHON %JukeBox20% %logpath%CSR_Production_Stand_By_FA_2Words_1000_Trig_With_WhatsTheTime-ASR_%TIMESTAMP%.txt %listpath%FA_2Words_1000_Trig_With_WhatsTheTime-ASR.txt %CarNoise% 0 -20 8 2 EB TRIG/ASR VE-Meds Alexa_Model_04 Alexa_Model_03 "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%list_FA_2words_Alexa_verification_1_%TIMESTAMP%.txt %listpath%list_FA_2words_Alexa_verification_1.txt %CarNoise% 0 -20 8 2 EB TRIG/ASR VE-Meds Alexa_Model_04 Alexa_Model_03 "" "" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%list_FA_2words_Alexa_verification_2_%TIMESTAMP%.txt %listpath%list_FA_2words_Alexa_verification_2.txt %CarNoise% 0 -20 8 2 EB TRIG/ASR VE-Meds Alexa_Model_04 Alexa_Model_03 "" "" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%list_FA_2words_Alexa_verification_3_%TIMESTAMP%.txt %listpath%list_FA_2words_Alexa_verification_3.txt %CarNoise% 0 -20 8 2 EB TRIG/ASR VE-Meds Alexa_Model_04 Alexa_Model_03 "" "" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%list_FA_2words_Alexa_verification_4_%TIMESTAMP%.txt %listpath%list_FA_2words_Alexa_verification_4.txt %CarNoise% 0 -20 8 2 EB TRIG/ASR VE-Meds Alexa_Model_04 Alexa_Model_03 "" "" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%list_FA_2words_Alexa_verification_5_%TIMESTAMP%.txt %listpath%list_FA_2words_Alexa_verification_5.txt %CarNoise% 0 -20 8 2 EB TRIG/ASR VE-Meds Alexa_Model_04 Alexa_Model_03 "" "" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%list_FA_2words_Alexa_verification_6_%TIMESTAMP%.txt %listpath%list_FA_2words_Alexa_verification_6.txt %CarNoise% 0 -20 8 2 EB TRIG/ASR VE-Meds Alexa_Model_04 Alexa_Model_03 "" "" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%list_FA_2words_Alexa_verification_7_%TIMESTAMP%.txt %listpath%list_FA_2words_Alexa_verification_7.txt %CarNoise% 0 -20 8 2 EB TRIG/ASR VE-Meds Alexa_Model_04 Alexa_Model_03 "" "" 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%list_FA_2words_Alexa_verification_8_%TIMESTAMP%.txt %listpath%list_FA_2words_Alexa_verification_8.txt %CarNoise% 0 -20 8 2 EB TRIG/ASR VE-Meds Alexa_Model_04 Alexa_Model_03 "" "" 2>>%ERRLOG%


REM BABBLE
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 -15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 -10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 -5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble_0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 0 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble_5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble_15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Babble_20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt %BabbleNoise% 0 20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%

REM Cafeteria
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 -15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 -10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 -5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria_5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria_15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria_20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria_25_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 25 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__cafeteria_30_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 30 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%

REM OFFICE
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 -15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 -10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 -5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office_5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office_15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office_20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office_25_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 25 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Office_30_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 30 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%


REM STREET
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 -15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 -10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 -5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street_5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street_15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street_20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__street_25_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 25 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%


REM crossroads
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Crossroads-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Crossroads.wav 0 -15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Crossroads-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Crossroads.wav 0 -10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Crossroads-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Crossroads.wav 0 -5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Crossroads_0_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Crossroads.wav 0 0 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__Crossroads_5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Crossroads.wav 0 5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%


REM WINDS
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__5ms-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 -15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__5ms-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 -10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__5ms-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 -5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__5ms_5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__5ms_15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%

REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__4ms-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 -15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__4ms-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 -10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__4ms-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 -5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__4ms_5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__4ms_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__4ms_15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__4ms_20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__4ms_25_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 25 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
 
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__3ms-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 -15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__3ms-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 -10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__3ms-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 -5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__3ms_5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__3ms_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__3ms_15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__3ms_20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__3ms_25_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 25 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM 
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__2ms-15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 -15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__2ms-10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 -10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__2ms-5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 -5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__2ms_5_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 5 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__2ms_10_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 10 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__2ms_15_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 15 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__2ms_20_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 20 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__2ms_25_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 25 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%ST_VoiceExpress_VE-Meds__2ms_30_%TIMESTAMP%.txt %listpath%VoiceExpress_MEDICATION.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 30 8 2 EB TRIG/ASR VE-Meds ST_VE-Meds None 2>>%ERRLOG%
