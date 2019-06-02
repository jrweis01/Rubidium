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
set testname=Bluedio_(Branch_rev-278)_Music-ASR_A2DP_Fitness-Model_MyMano-WAVs_QA-PC
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

REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_%TIMESTAMP%.txt %listpath%MyMano_Music_ONLY-SHARED-COMAANDS-WITH-FITNESS-MODEL.txt %CarNoise% 0 -20 5 2 Listener Trig\ASR MyMano SNR Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_1sec-delay_%TIMESTAMP%.txt %listpath%ASR_TRIG_Bluedio_FITNNESS_Without_Resume_and_Distance.txt %CarNoise% 0 -20 5 2 Serial Trig\ASR MyMano SNR com9 None 2>>%ERRLOG%
pause
PYTHON %JukeBox20% %logpath%%testname%_Music-5_1-delay_%TIMESTAMP%.txt %listpath%MyMano_Music_ONLY-SHARED-COMAANDS-WITH-FITNESS-MODEL.txt %Music% 0 -5 5 1 Listener Trig\ASR MyMano SNR Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-0_1-delay_%TIMESTAMP%.txt %listpath%MyMano_Music_ONLY-SHARED-COMAANDS-WITH-FITNESS-MODEL.txt %CrossroadsNoise% 0 0 5 1 Listener Trig\ASR MyMano SNR Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music-5_1-delay_Fitness-WAVS_%TIMESTAMP%.txt %listpath%Fitness_list_ONLY-SHARED-COMAANDS-WITH-MYMANO-MODEL.txt %Music% 0 -5 5 1 Listener Trig\ASR Jabra_old2 SNR Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-0_1-delay_Fitness-WAVS_%TIMESTAMP%.txt %listpath%Fitness_list_ONLY-SHARED-COMAANDS-WITH-MYMANO-MODEL.txt %CrossroadsNoise% 0 -5 5 1 Listener Trig\ASR Jabra_old2 SNR Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music-5_0-delay_Fitness-WAVS_%TIMESTAMP%.txt %listpath%Fitness_list_ONLY-SHARED-COMAANDS-WITH-MYMANO-MODEL.txt %Music% 0 -5 5 0 Listener Trig\ASR Jabra_old2 SNR Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-0_0-delay_Fitness-WAVS_%TIMESTAMP%.txt %listpath%Fitness_list_ONLY-SHARED-COMAANDS-WITH-MYMANO-MODEL.txt %CrossroadsNoise% 0 -5 5 0 Listener Trig\ASR Jabra_old2 SNR Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music-5_0-delay_%TIMESTAMP%.txt %listpath%MyMano_Music_ONLY-SHARED-COMAANDS-WITH-FITNESS-MODEL.txt %Music% 0 -5 5 0 Listener Trig\ASR MyMano SNR Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-0_0-delay_%TIMESTAMP%.txt %listpath%MyMano_Music_ONLY-SHARED-COMAANDS-WITH-FITNESS-MODEL.txt %CrossroadsNoise% 0 0 5 0 Listener Trig\ASR MyMano SNR Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Music-5_2-delay_%TIMESTAMP%.txt %listpath%MyMano_Music_ONLY-SHARED-COMAANDS-WITH-FITNESS-MODEL.txt %Music% 0 -5 5 2 Listener Trig\ASR MyMano SNR Rubidium None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-0_2-delay_%TIMESTAMP%.txt %listpath%MyMano_Music_ONLY-SHARED-COMAANDS-WITH-FITNESS-MODEL.txt %CrossroadsNoise% 0 0 5 2 Listener Trig\ASR MyMano SNR Trigger None 2>>%ERRLOG%
pause
REM REM REM testing noises

REM REM REM REM -20dB
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble-20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %BabbleNoise% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria-20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CafeteriaNoise% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office-20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %OfficeNoise% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street-20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %StreetNoise% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads-20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CrossroadsNoise% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms-20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_5msNoise% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms-20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_4msNoise% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms-20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_3msNoise% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms-20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Music-20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Music% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Microwave-20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Microwave% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%

REM REM Car80
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_0_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 0 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80_20_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%



REM REM REM REM Noises -15dB
REM REM PYTHON %JukeBox20% %logpath%%testname%_Car80-15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble-15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %BabbleNoise% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria-15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CafeteriaNoise% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office-15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %OfficeNoise% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street-15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %StreetNoise% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads-15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CrossroadsNoise% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms-15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_5msNoise% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms-15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_4msNoise% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms-15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_3msNoise% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms-15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Music-15_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Music% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Microwave-15_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Microwave% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%


REM REM Noises -10dB
REM REM PYTHON %JukeBox20% %logpath%%testname%_Car80-10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble-10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %BabbleNoise% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria-10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CafeteriaNoise% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office-10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %OfficeNoise% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street-10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %StreetNoise% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads-10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CrossroadsNoise% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms-10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_5msNoise% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms-10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_4msNoise% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms-10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_3msNoise% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms-10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Music-10_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Music% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Microwave-10_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Microwave% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%


REM REM REM Noises -5dB
REM REM REM PYTHON %JukeBox20% %logpath%%testname%_Car80-5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Babble-5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %BabbleNoise% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria-5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CafeteriaNoise% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Office-5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %OfficeNoise% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street-5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %StreetNoise% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads-5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CrossroadsNoise% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms-5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_5msNoise% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms-5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_4msNoise% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms-5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_3msNoise% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms-5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Music-5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Music% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Microwave-5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Microwave% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%


REM REM REM REM Noises 0dB
REM REM PYTHON %JukeBox20% %logpath%%testname%_Car80_0_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 0 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Babble_0_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %BabbleNoise% 0 0 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria-0_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CafeteriaNoise% 0 0 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office-0_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %OfficeNoise% 0 0 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street-0_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %StreetNoise% 0 0 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads-0_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CrossroadsNoise% 0 0 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_5ms-0_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_5msNoise% 0 0 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms-0_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_4msNoise% 0 0 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms-0_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_3msNoise% 0 0 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms-0_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 0 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Music_0_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Music% 0 0 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Microwave_0_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Microwave% 0 0 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%



REM REM REM Noises 5dB
REM REM PYTHON %JukeBox20% %logpath%%testname%_Car80_5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Babble_5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %BabbleNoise% 0 5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria_5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CafeteriaNoise% 0 5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office_5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %OfficeNoise% 0 5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street_5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %StreetNoise% 0 5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads_5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CrossroadsNoise% 0 5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms_5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_5msNoise% 0 5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms_5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_4msNoise% 0 5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms_5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_3msNoise% 0 5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms_5_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Music_5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Music% 0 5 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Microwave_5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Microwave% 0 5 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%


REM REM REM Noises 10dB
REM REM PYTHON %JukeBox20% %logpath%%testname%_Car80_10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Babble_10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %BabbleNoise% 0 10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria_10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CafeteriaNoise% 0 10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office_10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %OfficeNoise% 0 10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street_10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %StreetNoise% 0 10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads_10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CrossroadsNoise% 0 10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms_10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_5msNoise% 0 10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_4ms_10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_4msNoise% 0 10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms_10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_3msNoise% 0 10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms_10_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Music_10_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Music% 0 10 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Microwave_10_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Microwave% 0 10 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%

REM REM REM Noises 15dB
REM REM PYTHON %JukeBox20% %logpath%%testname%_Car80_15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Babble_15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %BabbleNoise% 0 15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria_15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CafeteriaNoise% 0 15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office_15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %OfficeNoise% 0 15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street_15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %StreetNoise% 0 15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads_15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CrossroadsNoise% 0 15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms_15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_5msNoise% 0 15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms_15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_4msNoise% 0 15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms_15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_3msNoise% 0 15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms_15_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Music_15_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Music% 0 15 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Microwave_15_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Microwave% 0 15 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%

REM REM REM Noises 20dB
REM REM PYTHON %JukeBox20% %logpath%%testname%_Car80_20_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Babble_20_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %BabbleNoise% 0 20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_cafeteria_20_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CafeteriaNoise% 0 20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Office_20_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %OfficeNoise% 0 20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_street_20_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %StreetNoise% 0 20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Crossroads_20_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CrossroadsNoise% 0 20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms_20_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_5msNoise% 0 20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms_20_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_4msNoise% 0 20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_3ms_20_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_3msNoise% 0 20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_2ms_20_%timestamp%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Music_20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Music% 0 20 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_Microwave_20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Microwave% 0 20 5 3 Listener Trig\ASR Jabra_old2 Rubidium None 2>>%ERRLOG%


REM REM REM WINDS
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms-15_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_5msNoise% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms-10_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_5msNoise% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms-5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_5msNoise% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms_5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_5msNoise% 0 5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM REM PYTHON %JukeBox20% %logpath%%testname%_5ms_15_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_5msNoise% 0 15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%

REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms-15_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_4msNoise% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms-10_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_4msNoise% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms-5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_4msNoise% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms_5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_4msNoise% 0 5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms_15_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_4msNoise% 0 15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms_20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_4msNoise% 0 20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_4ms_25_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_4msNoise% 0 25 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%

REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms-15_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_3msNoise% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms-10_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_3msNoise% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms-5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_3msNoise% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms_5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_3msNoise% 0 5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms_15_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_3msNoise% 0 15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms_20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_3msNoise% 0 20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_3ms_25_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_3msNoise% 0 25 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%

REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms-15_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 -15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms-10_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 -10 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms-5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 -5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms_5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 5 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms_15_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 15 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms_20_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms_25_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 25 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM REM PYTHON %JukeBox20% %logpath%%testname%_2ms_30_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %Winds_2msNoise% 0 30 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%


REM REM FA NOISES
REM Rem Car80

REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify1_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %Music% 0 -20 4 0 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG% 
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_3min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %Music% 0 -20 180 0 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify2_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %Music% 0 -20 4 0 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_5min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %Music% 0 -20 300 0 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify3_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %Music% 0 -20 4 0 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_10min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %Music% 0 -20 600 0 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify4_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %Music% 0 -20 4 0 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_15min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %Music% 0 -20 900 0 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify5_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %Music% 0 -20 4 0 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_20min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %Music% 0 -20 1200 0 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify6_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %Music% 0 -20 4 0 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_25min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %Music% 0 -20 1500 0 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify7_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %Music% 0 -20 4 0 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_30min_%TIMESTAMP%.txt %listpath%Alexa_trigger_X1.txt %Music% 0 -20 1800 0 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_Verify8_%TIMESTAMP%.txt %listpath%Alexa_trigger_X10.txt %Music% 0 -20 4 0 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%

REM REM REM Dynamic Range
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-30_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa_9db.txt %CarNoise% -30 -30 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-27_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa_9db.txt %CarNoise% -27 -30 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-24_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa_9db.txt %CarNoise% -24 -30 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-21_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa_9db.txt %CarNoise% -21 -30 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-18_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa_9db.txt %CarNoise% -18 -30 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-15_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa_9db.txt %CarNoise% -15 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-12_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa_9db.txt %CarNoise% -12 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-9_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa_9db.txt %CarNoise% -9 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-6_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% -6 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80-3_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% -3 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_0_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_3_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa.txt %CarNoise% 3 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_6_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa-15db.txt %CarNoise% 6 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_9_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa-15db.txt %CarNoise% 9 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_12_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa-15db.txt %CarNoise% 12 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_15_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa-15db.txt %CarNoise% 15 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_18_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa-15db.txt %CarNoise% 18 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_21_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa-27db.txt %CarNoise% 21 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM pYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_24_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa-27db.txt %CarNoise% 24 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_27_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa-27db.txt %CarNoise% 27 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_30_%TIMESTAMP%.txt %listpath%Bluedio_Ringing(combined_GN_and_MyMano_wavs)_with-Alexa-27db.txt %CarNoise% 30 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%


REM REM FA 2-Words

REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_ASR-Verify_2WORDS-FA_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%FA_2words_8213_Trig-ASR_Part1_%TIMESTAMP%.txt %listpath%FA_2words_8213_ASR_Alexa_PART1.txt %CarNoise% 0 -20 5 3 Listener Trig/ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_ASR-Verify2_2WORDS-FA_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%FA_2words_8213_Trig-ASR_Part2_%TIMESTAMP%.txt %listpath%FA_2words_8213_ASR_Alexa_PART2.txt %CarNoise% 0 -20 5 3 Listener Trig/ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_ASR-Verify3_2WORDS-FA_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%FA_2words_8213_Trig-ASR_Part3_%TIMESTAMP%.txt %listpath%FA_2words_8213_ASR_Alexa_PART3.txt %CarNoise% 0 -20 5 3 Listener Trig/ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_ASR-Verify4_2WORDS-FA_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%FA_2words_8213_Trig-ASR_Part4_%TIMESTAMP%.txt %listpath%FA_2words_8213_ASR_Alexa_PART4.txt %CarNoise% 0 -20 5 3 Listener Trig/ASR Jabra_old2 Trigger None 2>>%ERRLOG%
REM PYTHON %JukeBox20% %logpath%%testname%_Car80-20_ASR-Verify5_2WORDS-FA_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 5 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%

REM REM PYTHON %JukeBox20% %logpath%%testname%FA_2words_8213_Trig-ASR_%TIMESTAMP%.txt %listpath%FA_2Words_8213_ASR_With_TRIG-HeyJabra.txt %CarNoise% 0 -20 5 3 Listener Trig/ASR Jabra_old2 Trigger None 2>>%ERRLOG%

REM REM Noises w/o speech - 10Min Noise only (no trigs)
REM REM Car80
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_ASR-Verify_Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CarNoise% 0 -20 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_ASR-Verify_Silence2_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-10_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CarNoise% 0 -10 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_ASR-Verify_Silence3_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-0_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CarNoise% 0 0 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_ASR-Verify_Silence4_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_5_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CarNoise% 0 5 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_ASR-Verify_Silence5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_10_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CarNoise% 0 10 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_ASR-Verify_Silence6_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80_20_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CarNoise% 0 20 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Car80-20_ASR-Verify_Silence7_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%

REM Babble
PYTHON %JukeBox20% %logpath%%testname%_BabbleSilence_Car80-20_ASR-Verify_Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble-20_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %BabbleNoise% 0 -20 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_BabbleSilence_Car80-20_ASR-Verify_Silence2_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble-10_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %BabbleNoise% 0 -10 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_BabbleSilence_Car80-20_ASR-Verify_Silence3_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble-0_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %BabbleNoise% 0 0 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_BabbleSilence_Car80-20_ASR-Verify_Silence4_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_5_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %BabbleNoise% 0 5 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_BabbleSilence_Car80-20_ASR-Verify_Silence5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_10_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %BabbleNoise% 0 10 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_BabbleSilence_Car80-20_ASR-Verify_Silence6_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Babble_20_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %BabbleNoise% 0 20 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_BabbleSilence_Car80-20_ASR-Verify_Silence7_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%

Cafeteria
PYTHON %JukeBox20% %logpath%%testname%_CafeteriaSilence_Car80-20_ASR-Verify_Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Cafeteria-20_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CafeteriaNoise% 0 -20 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_CafeteriaSilence_Car80-20_ASR-Verify_Silence2_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Cafeteria-10_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CafeteriaNoise% 0 -10 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_CafeteriaSilence_Car80-20_ASR-Verify_Silence3_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Cafeteria-0_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CafeteriaNoise% 0 0 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_CafeteriaSilence_Car80-20_ASR-Verify_Silence4_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Cafeteria_5_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CafeteriaNoise% 0 5 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_CafeteriaSilence_Car80-20_ASR-Verify_Silence5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Cafeteria_10_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CafeteriaNoise% 0 10 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_CafeteriaSilence_Car80-20_ASR-Verify_Silence6_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Cafeteria_20_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CafeteriaNoise% 0 20 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_CafeteriaSilence_Car80-20_ASR-Verify_Silence7_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%

REM Crossroads
PYTHON %JukeBox20% %logpath%%testname%_CrossroadsSilence_Car80-20_ASR-Verify_Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-20_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CrossroadsNoise% 0 -20 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_CrossroadsSilence_Car80-20_ASR-Verify_Silence2_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-10_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CrossroadsNoise% 0 -10 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_CrossroadsSilence_Car80-20_ASR-Verify_Silence3_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads-0_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CrossroadsNoise% 0 0 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_CrossroadsSilence_Car80-20_ASR-Verify_Silence4_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads_5_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CrossroadsNoise% 0 5 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_CrossroadsSilence_Car80-20_ASR-Verify_Silence5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads_10_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CrossroadsNoise% 0 10 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_CrossroadsSilence_Car80-20_ASR-Verify_Silence6_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Crossroads_20_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %CrossroadsNoise% 0 20 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_CrossroadsSilence_Car80-20_ASR-Verify_Silence7_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%

REM Winds 4ms
PYTHON %JukeBox20% %logpath%%testname%_Winds-4ms_Silence_Car80-20_ASR-Verify_Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Winds-4ms-20_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %Winds_4msNoise% 0 -20 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Winds-4ms_Silence_Car80-20_ASR-Verify_Silence2_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Winds-4ms-10_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %Winds_4msNoise% 0 -10 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Winds-4ms_Silence_Car80-20_ASR-Verify_Silence3_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Winds-4ms-0_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %Winds_4msNoise% 0 0 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Winds-4ms_Silence_Car80-20_ASR-Verify_Silence4_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Winds-4ms_5_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %Winds_4msNoise% 0 5 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Winds-4ms_Silence_Car80-20_ASR-Verify_Silence5_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Winds-4ms_10_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %Winds_4msNoise% 0 10 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Winds-4ms_Silence_Car80-20_ASR-Verify_Silence6_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Winds-4ms_20_10Min-Silence_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify.txt %Winds_4msNoise% 0 20 600 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Winds-4ms_Silence_Car80-20_ASR-Verify_Silence7_%TIMESTAMP%.txt %listpath%Bluedio_Ringing_ASR_Verify_X5.txt %CarNoise% 0 -20 8 3 Listener Trig\ASR Jabra_old2 Trigger None 2>>%ERRLOG%
