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

REM Sanity
REM testing QUITE
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Car80-20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -20 4 0 EB TRIG Alexa Rubidium None "" "" 2>>%ERRLOG%


REM FA
REM short 2words
REM PYTHON %JukeBox20% C:\AutomationEnvironment\logs\CSR_Production_standby_Without_Cloud_FA_2Words_8213_Trig_With_WhatsTheTime-ASR.txt C:\AutomationEnvironment\lists\FA_2words_1000_Women.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AutomationEnvironment\logs\CSR_A2DP_Alexa_FA_1000X2words_noisy.txt C:\AutomationEnvironment\lists\FA_2words_1000_Women.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 0 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM testing noises
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Car80-0.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 0 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Babble_0.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 0 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%


REM Dynamic Range
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20-54.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -54 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG% 
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20-51.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -51 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20-48.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -48 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20-45.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -45 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20-42.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -42 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20-39.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -33 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20-30.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -30 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20-27.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -27 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20-24.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -24 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20-21.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -21 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20_18.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 18 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20_21.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 21 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM pYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20_24.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 24 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20_27.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 27 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20_30.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 30 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20_33.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 33 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20_36.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 36 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20_39.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 39 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20-15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -15 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20_6.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 6 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20-12.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -12 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20_3.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 3 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20-9.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -9 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20-6.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -6 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20-3.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -3 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20-18.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -18 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20_0.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20_9.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 9 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20_12.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 12 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Dynamic_Range_Car80-20_15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 15 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%



REM -20dB
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_cafeteria-20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Office-20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_street-20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Crossroads-20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Crossroads.wav 0 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_5ms-20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_4ms-20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_3ms-20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_2ms-20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%


REM Noises 0dB
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_cafeteria-0.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 0 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Office-0.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 0 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_street-0.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 0 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Crossroads-0.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Crossroads.wav 0 0 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_5ms-0.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 0 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_4ms-0.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 0 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_3ms-0.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 0 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_2ms-0.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 0 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%

REM Noises 10dB
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Car80_10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Babble_10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_cafeteria_10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Office_10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_street_10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Crossroads_10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Crossroads.wav 0 10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_5ms_10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_4ms_10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_3ms_10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_2ms_10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%

REM TESTING Car80 noise
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Car80-15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Car80-10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Car80-5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Car80_5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Car80_15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Car80_20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Car80_25.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 25 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Car80_30.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 30 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%


REM FA
REM 2words
PYTHON %JukeBox20% C:\AutomationEnvironment\logs\CSR_Fitness_A2DP_Fixed-freeze_No-reset_FA_2words.txt C:\AutomationEnvironment\lists\list_FA_2words_Google_verification.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
REM Long Talks
REM "C:\AutomationEnvironment\WinAutomation_Executables\Run_Long_Files_With_Listener_CSV.exe" C:\\AutomationEnvironment\\lists\\FA_LongTalks_with_Times.csv "Time per wav in the list (csv)" 0 Google listener Hey-Jabra None


REM BABBLE
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Babble-15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 -15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Babble-10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 -10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Babble-5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 -5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Babble_5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Babble_15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Babble_20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%

REM Cafeteria
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_cafeteria-15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 -15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_cafeteria-10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 -10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_cafeteria-5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 -5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_cafeteria_5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_cafeteria_15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_cafeteria_20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_cafeteria_25.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 25 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_cafeteria_30.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 30 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%

REM OFFICE
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Office-15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 -15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Office-10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 -10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Office-5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 -5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Office_5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Office_15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_cafeteria_30.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 30 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Office_20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Office_25.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 25 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Office_30.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 30 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%


REM STREET
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_street-15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 -15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_street-10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 -10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_street-5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 -5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_street_5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_street_15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_street_20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_street_25.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\street_mono_193s.wav 0 25 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%


REM crossroads
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Crossroads-15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Crossroads.wav 0 -15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Crossroads-10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Crossroads.wav 0 -10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Crossroads-5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Crossroads.wav 0 -5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_Crossroads_5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Crossroads.wav 0 5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%

C:\AutomationEnvironment\BatchFiles\RUN_Hey-Jabra_Full_TEST_ASR.bat
REM "C:\AutomationEnvironment\WinAutomation_Executables\Run_Long_Files_With_Listener_CSV.exe" C:\\AutomationEnvironment\\lists\\FA_LongTalks_with_Times.csv "Time per wav in the list (csv)" 0 Google listener Hey-Jabra None


REM WINDS
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_5ms-15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 -15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_5ms-10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 -10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_5ms-5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 -5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_5ms_5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_5ms_15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_5ms.wav 0 15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%

PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_4ms-15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 -15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_4ms-10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 -10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_4ms-5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 -5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_4ms_5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_4ms_15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_4ms_20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_4ms_25.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_4ms.wav 0 25 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%

PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_3ms-15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 -15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_3ms-10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 -10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_3ms-5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 -5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_3ms_5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_3ms_15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_3ms_20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_3ms_25.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_3ms.wav 0 25 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%

PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_2ms-15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 -15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_2ms-10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 -10 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_2ms-5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 -5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_2ms_5.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 5 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_2ms_15.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 15 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_2ms_20.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 20 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_2ms_25.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 25 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%
PYTHON %JukeBox20% C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_standby_Without_Cloud_2ms_30.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Wind_2ms.wav 0 30 4 0 EB TRIG Alexa Rubidium None "lj- trigger" "" 2>>%ERRLOG%

C:\AutomationEnvironment\BatchFiles\RUN_Hey-Jabra_Full_TEST_ASR.bat