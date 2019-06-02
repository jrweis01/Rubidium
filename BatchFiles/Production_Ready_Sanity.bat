Rem Setting up Error log
set TIMESTAMP=C:\AutomationEnvironment\Logs\%DATE:/=-%@%TIME::=-%
set ERRLOG=%TIMESTAMP: =%
set ERRLOG=%ERRLOG:,=.%.txt
echo 'CMD Error Log'>%ERRLOG%

PYTHON C:\AutomationEnvironment\JukeBox_V1\JukeboxAuto.py C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_Stand_By_Car80_10.txt C:\AutomationEnvironment\lists\Alexa_Amazon_419.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 10 6 0 EB TRIG Alexa Rubidium None 2>>%ERRLOG%
pause

PYTHON C:\AutomationEnvironment\JukeBox\JukeBox_main.py C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_A2DP_Car80-20.txt C:\AutomationEnvironment\lists\Alexa_network_WhatsTheTime.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -20 4 4 LJ TRIG/ASR Alexa Rubidium None "lj- trigger" "MP- Waiting for Trigger" 2>>%ERRLOG%


REM FA
REM Long Talks
PYTHON C:\AutomationEnvironment\JukeBox\JukeBox_main.py C:\AutomationEnvironment\logs\CSR_Production_Stand_By_FA_longTalks_%TIMESTAMP%.txt C:\AutomationEnvironment\lists\FA_LongTalks.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -20 20 20 LJ-MP TRIG/ASR Alexa Rubidium None "lj- trigger" "MP- Waiting for Trigger" 2>>%ERRLOG%
REM short 2words
REM PYTHON C:\AutomationEnvironment\JukeBox\JukeBox_main.py C:\AutomationEnvironment\logs\CSR_Production_Stand_By_FA_2Words_1000_Trig_With_WhatsTheTime-ASR.txt C:\AutomationEnvironment\lists\FA_2Words_1000_Trig_With_WhatsTheTime-ASR.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -20 20 20 LJ-MP TRIG/ASR Alexa Rubidium None "lj- trigger" "MP- Waiting for Trigger" 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\JukeBox_main.py C:\AutomationEnvironment\logs\CSR_Production_Stand_By_FA_2Words_8213_Trig_With_WhatsTheTime-ASR.txt C:\AutomationEnvironment\lists\FA_2Words_8213_Trig_With_WhatsTheTime-ASR.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 -20 20 20 LJ-MP TRIG/ASR Alexa Rubidium None "lj- trigger" "MP- Waiting for Trigger" 2>>%ERRLOG%



REM Sanity

REM -20dB
PYTHON C:\AutomationEnvironment\JukeBox\JukeBox_main.py C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_Stand_By_Babble-20.txt C:\AutomationEnvironment\lists\Alexa_network_WhatsTheTime.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 -20 20 20 LJ-MP TRIG/ASR Alexa Rubidium None "lj- trigger" "MP- Waiting for Trigger" 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\JukeBox_main.py C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_Stand_By_cafeteria-20.txt C:\AutomationEnvironment\lists\Alexa_network_WhatsTheTime.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 -20 20 20 LJ-MP TRIG/ASR Alexa Rubidium None "lj- trigger" "MP- Waiting for Trigger" 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\JukeBox_main.py C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_Stand_By_Office-20.txt C:\AutomationEnvironment\lists\Alexa_network_WhatsTheTime.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 -20 20 20 LJ-MP TRIG/ASR Alexa Rubidium None "lj- trigger" "MP- Waiting for Trigger" 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\JukeBox_main.py C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_Stand_By_Babble_10.txt C:\AutomationEnvironment\lists\Alexa_network_WhatsTheTime_2_files.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 10 20 20 LJ-MP TRIG/ASR Alexa Rubidium None "lj- trigger" "MP- Waiting for Trigger" 2>>%ERRLOG%

REM Noises 0dB
PYTHON C:\AutomationEnvironment\JukeBox\JukeBox_main.py C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_Stand_By_Babble_0.txt C:\AutomationEnvironment\lists\Alexa_network_WhatsTheTime.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 0 10 10 LJ-MP TRIG/ASR Alexa Rubidium None "lj- trigger" "MP- Waiting for Trigger" 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\JukeBox_main.py C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_Stand_By_cafeteria-0.txt C:\AutomationEnvironment\lists\Alexa_network_WhatsTheTime.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 0 20 20 LJ-MP TRIG/ASR Alexa Rubidium None "lj- trigger" "MP- Waiting for Trigger" 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\JukeBox_main.py C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_Stand_By_Office-0.txt C:\AutomationEnvironment\lists\Alexa_network_WhatsTheTime.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 0 20 20 LJ-MP TRIG/ASR Alexa Rubidium None "lj- trigger" "MP- Waiting for Trigger" 2>>%ERRLOG%




REM Noises 10dB
PYTHON C:\AutomationEnvironment\JukeBox\JukeBox_main.py C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_Stand_By_Babble_10.txt C:\AutomationEnvironment\lists\Alexa_network_WhatsTheTime.txt C:\AutomationEnvironment\NoiseFiles\Babble-20kHz-2min-11dB.wav 0 10 20 20 LJ-MP TRIG/ASR Alexa Rubidium None "lj- trigger" "MP- Waiting for Trigger" 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\JukeBox_main.py C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_Stand_By_cafeteria_10.txt C:\AutomationEnvironment\lists\Alexa_network_WhatsTheTime.txt C:\AutomationEnvironment\NoiseFiles\cafeteria_mono_150s.wav 0 10 20 20 LJ-MP TRIG/ASR Alexa Rubidium None "lj- trigger" "MP- Waiting for Trigger" 2>>%ERRLOG%
PYTHON C:\AutomationEnvironment\JukeBox\JukeBox_main.py C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_Stand_By_Office_10.txt C:\AutomationEnvironment\lists\Alexa_network_WhatsTheTime.txt C:\AutomationEnvironment\NoiseFiles\Headset_Office_Noise.wav 0 10 20 20 LJ-MP TRIG/ASR Alexa Rubidium None "lj- trigger" "MP- Waiting for Trigger" 2>>%ERRLOG%

REM testing QUITE

PYTHON C:\AutomationEnvironment\JukeBox_V1\JukeboxAuto.py C:\AUTOMATIONENVIRONMENT\logs\CSR_Production_Stand_By_Car80_10.txt C:\AutomationEnvironment\lists\Alexa_network_WhatsTheTime.txt C:\AutomationEnvironment\NoiseFiles\Headset_Car80_Noise.wav 0 10 20 20 EB TRIG/ASR Alexa Rubidium None 2>>%ERRLOG%
