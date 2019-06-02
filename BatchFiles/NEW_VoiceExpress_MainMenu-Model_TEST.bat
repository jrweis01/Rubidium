Rem Setting up Error log
set TIMESTAMP=%DATE:/=-%@%TIME::=-%
set TIMESTAMP=%TIMESTAMP: =%
set ERRLOG=%TIMESTAMP:,=.%.txt
set ERRLOG=C:\AutomationEnvironment\Logs\%ERRLOG%
echo %ERRLOG%
ECHO %TIMESTAMP%
echo 'CMD Error Log'>%ERRLOG%


REM Car80

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Car80-20_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Car80-15_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -15 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Car80-10_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -10 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Car80-5_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -5 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Car80_0_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 0 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%


REM Cafeteria

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Cafeteria-20_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Cafeteria-15_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 -15 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Cafeteria-10_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 -10 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Cafeteria-5_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 -5 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Cafeteria_0_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 0 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%


REM Office

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Office-20_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Office-15_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 -15 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Office-10_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 -10 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Office-5_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 -5 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Office_0_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 0 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%


REM Babble

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Babble-20_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Babble-15_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 -15 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Babble-10_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 -10 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Babble-5_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 -5 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Babble_0_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 0 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%



REM FA

REM 2words
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AutomationEnvironment\logs\ST_VoiceExpress-MainMenu_FA_2words_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\FA_2Words_8213_ASR_With_TRIG-HeyJabra.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%


REM Dynamic Range
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20-33.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -33 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20-30.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -30 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20-27.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -27 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20-24.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -24 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20-21.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -21 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20-18.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -18 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20-15.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -15 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20-12.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -12 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20-9.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -9 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20-6.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -6 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20-3.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav -3 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20_0.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20_3.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 3 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20_6.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 6 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20_9.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 9 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20_12.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 12 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20_15.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 15 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20_18.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 18 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20_21.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 21 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
pYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20_24.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 24 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20_27.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 27 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\Jukebox_main.py C:\AUTOMATIONENVIRONMENT\logs\ST_VoiceExpress-MainMenu_Dynamic_Range_Car80-20_30.txt C:\AutomationEnvironment\lists\VoiceExpress_MAIN_MENU.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 30 -20 8 1 EB TRIG/ASR General ST_VE-Meds None 2>>%ERRLOG%
