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
set testname=HeyJabra_3649_Josh-PC_PBAP_A2DP
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
rem set Music=%noisefilespath%05_happy_(from_despicable_me_2)_16k16MonoNorm49.wav
set Music=%noisefilespath%Music_Amazon_Background-noise_-11dB.wav


REM REM REM testing noises
REM TESTING Car80 noise
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-15_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 -15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-10_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 -10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-5_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 -5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_5_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_15_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_25_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 25 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_30_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 30 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%

REM REM REM -20dB
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble-20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %BabbleNoise% 0 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria-20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %CafeteriaNoise% 0 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Office-20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %OfficeNoise% 0 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_street-20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %StreetNoise% 0 -20 6 0 EB Trig Alexa Model_09 Counter2 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %CrossroadsNoise% 0 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms-20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_5msNoise% 0 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms-20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_4msNoise% 0 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms-20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_3msNoise% 0 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms-20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music-20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 0 -20 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave-20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Microwave% 0 -20 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%




REM REM REM Noises -15dB
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 -15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble-15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %BabbleNoise% 0 -15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria-15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CafeteriaNoise% 0 -15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Office-15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %OfficeNoise% 0 -15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_street-15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %StreetNoise% 0 -15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CrossroadsNoise% 0 -15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms-15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_5msNoise% 0 -15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms-15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_4msNoise% 0 -15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms-15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_3msNoise% 0 -15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms-15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 -15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music-15_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 0 -15 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave-15_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Microwave% 0 -15 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%


REM Noises -10dB
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 -10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble-10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %BabbleNoise% 0 -10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria-10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CafeteriaNoise% 0 -10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office-10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %OfficeNoise% 0 -10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street-10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %StreetNoise% 0 -10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CrossroadsNoise% 0 -10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms-10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_5msNoise% 0 -10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms-10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_4msNoise% 0 -10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms-10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_3msNoise% 0 -10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms-10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 -10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music-10_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 0 -10 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave-10_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Microwave% 0 -10 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%


REM Noises -5dB
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 -5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble-5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %BabbleNoise% 0 -5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria-5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CafeteriaNoise% 0 -5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office-5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %OfficeNoise% 0 -5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street-5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %StreetNoise% 0 -5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CrossroadsNoise% 0 -5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms-5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_5msNoise% 0 -5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms-5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_4msNoise% 0 -5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms-5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_3msNoise% 0 -5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms-5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 -5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music-5_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 0 -5 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave-5_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Microwave% 0 -5 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%


REM REM REM Noises 0dB
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_0_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 0 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_0_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %BabbleNoise% 0 0 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria-0_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %CafeteriaNoise% 0 0 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office-0_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %OfficeNoise% 0 0 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street-0_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %StreetNoise% 0 0 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-0_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %CrossroadsNoise% 0 0 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms-0_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_5msNoise% 0 0 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms-0_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_4msNoise% 0 0 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms-0_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_3msNoise% 0 0 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms-0_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 0 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music_0_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 0 0 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave_0_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Microwave% 0 0 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%



REM REM Noises 5dB
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %BabbleNoise% 0 5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria_5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CafeteriaNoise% 0 5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office_5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %OfficeNoise% 0 5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street_5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %StreetNoise% 0 5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads_5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CrossroadsNoise% 0 5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms_5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_5msNoise% 0 5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms_5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_4msNoise% 0 5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms_5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_3msNoise% 0 5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms_5_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music_5_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 0 5 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave_5_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Microwave% 0 5 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%


REM REM Noises 10dB
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %BabbleNoise% 0 10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria_10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CafeteriaNoise% 0 10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office_10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %OfficeNoise% 0 10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street_10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %StreetNoise% 0 10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads_10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CrossroadsNoise% 0 10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms_10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_5msNoise% 0 10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms_10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_4msNoise% 0 10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms_10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_3msNoise% 0 10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms_10_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music_10_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 0 10 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave_10_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Microwave% 0 10 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%

REM REM Noises 15dB
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %BabbleNoise% 0 15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria_15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CafeteriaNoise% 0 15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office_15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %OfficeNoise% 0 15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street_15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %StreetNoise% 0 15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads_15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CrossroadsNoise% 0 15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms_15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_5msNoise% 0 15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms_15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_4msNoise% 0 15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms_15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_3msNoise% 0 15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms_15_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music_15_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 0 15 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave_15_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Microwave% 0 15 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%

REM REM Noises 20dB
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_20_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CarNoise% 0 20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_20_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %BabbleNoise% 0 20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_cafeteria_20_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CafeteriaNoise% 0 20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office_20_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %OfficeNoise% 0 20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street_20_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %StreetNoise% 0 20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads_20_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %CrossroadsNoise% 0 20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms_20_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_5msNoise% 0 20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms_20_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_4msNoise% 0 20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms_20_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_3msNoise% 0 20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms_20_%timestamp%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music_20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 0 20 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Microwave_20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Microwave% 0 20 10 0 EB Trig Alexa Rubidium None 2>>%ERRLOG%


REM REM REM WINDS
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms-15_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_5msNoise% 0 -15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms-10_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_5msNoise% 0 -10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms-5_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_5msNoise% 0 -5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms_5_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_5msNoise% 0 5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms_15_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_5msNoise% 0 15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%

REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms-15_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_4msNoise% 0 -15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms-10_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_4msNoise% 0 -10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms-5_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_4msNoise% 0 -5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms_5_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_4msNoise% 0 5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms_15_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_4msNoise% 0 15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms_20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_4msNoise% 0 20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms_25_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_4msNoise% 0 25 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%

REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms-15_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_3msNoise% 0 -15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms-10_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_3msNoise% 0 -10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms-5_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_3msNoise% 0 -5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms_5_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_3msNoise% 0 5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms_15_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_3msNoise% 0 15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms_20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_3msNoise% 0 20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms_25_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_3msNoise% 0 25 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%

REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms-15_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 -15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms-10_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 -10 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms-5_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 -5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms_5_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 5 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms_15_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 15 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms_20_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms_25_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 25 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms_30_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Winds_2msNoise% 0 30 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%


REM REM FA NOISES
REM Rem Car80

REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %Music% 0 -20 4 0 Listener Trig Jabra_old2 Trigger None 2>>%ERRLOG% 
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_3min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %Music% 0 -20 180 0 Listener Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify2_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %Music% 0 -20 4 0 Listener Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_5min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %Music% 0 -20 300 0 Listener Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify3_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %Music% 0 -20 4 0 Listener Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %Music% 0 -20 600 0 Listener Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify4_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %Music% 0 -20 4 0 Listener Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_15min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %Music% 0 -20 900 0 Listener Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify5_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %Music% 0 -20 4 0 Listener Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_20min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %Music% 0 -20 1200 0 Listener Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify6_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %Music% 0 -20 4 0 Listener Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_25min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %Music% 0 -20 1500 0 Listener Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify7_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %Music% 0 -20 4 0 Listener Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_30min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %Music% 0 -20 1800 0 Listener Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify8_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %Music% 0 -20 4 0 Listener Trig Jabra_old2 Trigger None 2>>%ERRLOG%

REM REM Dynamic Range
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-54_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% -54 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG% 
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-51_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% -51 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-48_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% -48 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-45_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% -45 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-42_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% -42 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-20-39_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% -33 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-30_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% -30 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-27_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% -27 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-24_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% -24 -30 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-21_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% -21 -30 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-18_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% -18 -30 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-15_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% -15 -30 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-12_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% -12 -30 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-9_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% -9 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-6_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% -6 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-3_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% -3 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_0_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 0 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_3_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 3 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_6_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 6 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_9_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 9 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_12_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 12 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_15_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 15 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_18_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 18 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_21_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 21 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
pYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_24_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 24 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_27_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 27 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_30_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 30 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_33_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 33 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_36_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 36 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_39_%TIMESTAMP%.txt %listpath%hey_jabra_amazon_X4.txt %Music% 39 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%


REM FA 2-Words
PYTHON %JukeBox20% %logpath%%testname%FA_2words_8213_Trig-ASR_%TIMESTAMP%.txt %listpath%FA_2Words_8213_ASR_With_TRIG-HeyJabra.txt %CarNoise% 0 -20 10 0 EB Trig Jabra_old2 Trigger None 2>>%ERRLOG%


