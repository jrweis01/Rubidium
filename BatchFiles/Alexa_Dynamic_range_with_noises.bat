Rem Setting up Error log
set TIMESTAMP=%DATE:/=-%@%TIME::=-%
set TIMESTAMP=%TIMESTAMP: =%
set ERRLOG=%TIMESTAMP:,=.%.txt
set logpath=C:\AUTOMATIONENVIRONMENT\logs\
set ERRLOG=%logpath%%ERRLOG%
echo 'CMD Error Log'>%ERRLOG%
REM Setting up variables to be Re-used latter
set JukeBox20=C:\AutomationEnvironment\JukeBox\JukeBox_main.py
set JukeBox15=C:\AutomationEnvironment\JukeBox_V1\JukeboxAuto.py

REM set testname=Trunk_rev-478_A2DP_Alexa(10.02.10)_-23LUFS_ACOUSTIC_Ref-Mic_30Cm_M-audio-22.5_mic-5_
set testname=Trunk_rev-478_SBC_Alexa(10.02.10)_Gain16_BeringhemvsSpeedLink-Mic_3ft-from-each-speaker_M-audio-22.5_mic-18.6(Tone-23LUFS_4800)
REM set testname=st_Alexa_V50.3.20_UART_50.3.21_counter0_Confrence-Room_3Ft_M-audio-26.7(PinkNoise-62db@3FT)_RT210_

set listpath=C:\AutomationEnvironment\lists\

set noisefilespath=C:\AutomationEnvironment\NoiseFiles\
set noise-23LUFS_filespath=C:\AutomationEnvironment\NoiseFiles\Noises_-23LUFS\
set noise-23LUFS-LEFT_filespath=C:\AutomationEnvironment\NoiseFiles\Noises_-23LUFS_LEFT\
set CarNoise=%noisefilespath%Headset_Car80_Noise.wav
set CarNoise-23LUFS=%noise-23LUFS_filespath%Headset_Car80_Noise_-23LUFS.wav
set CarNoise-23LUFS-LEFT=%noise-23LUFS-LEFT_filespath%L_0dB_Headset_Car80_Noise_-23LUFS.wav
set CarNoise-23LUFS-LEFT-NO100-HZ=%noise-23LUFS-LEFT_filespath%L_0dB_Headset_Car80_Noise_-23LUFS_NO-100Hz.wav
set BabbleNoise=%noisefilespath%Babble-20kHz-2min-11dB.wav
set BabbleNoise-23LUFS=%noise-23LUFS_filespath%Babble-20kHz-2min-11dB_-23LUFS.wav
set BabbleNoise-23LUFS-LEFT=%noise-23LUFS-LEFT_filespath%L_0dB_Babble-20kHz-2min-11dB_-23LUFS.wav
set CafeteriaNoise=%noisefilespath%cafeteria_mono_150s.wav
set CafeteriaNoise-23LUFS-LEFT=%noise-23LUFS-LEFT_filespath%L_0dB_cafeteria_mono_150s_-23LUFS.wav
set OfficeNoise=%noisefilespath%Headset_Office_Noise.wav
set OfficeNoise-23LUFS-LEFT=%noise-23LUFS-LEFT_filespath%L_0dB_Headset_Office_Noise_-23LUFS.wav
set StreetNoise=%noisefilespath%street_mono_193s.wav
set StreetNoise-23LUFS-LEFT=%noise-23LUFS-LEFT_filespath%L_0dB_street_mono_193s_-23LUFS.wav
set CrossroadsNoise=%noisefilespath%Crossroads.wav
set CrossroadsNoise-23LUFS-LEFT=%noise-23LUFS-LEFT_filespath%L_0dB_Crossroads_-23LUFS.wav
set Winds_5msNoise=%noisefilespath%Wind_5ms.wav
set Winds_4msNoise=%noisefilespath%Wind_4ms.wav
set Winds_3msNoise=%noisefilespath%Wind_3ms.wav
set Winds_2msNoise=%noisefilespath%Wind_2ms.wav
set Winds_5msNoise-23LUFS-LEFT=%noise-23LUFS-LEFT_filespath%L_0dB_Wind_5ms_-23LUFS.wav
set Winds_4msNoise-23LUFS-LEFT=%noise-23LUFS-LEFT_filespath%L_0dB_Wind_4ms_-23LUFS.wav
set Winds_3msNoise-23LUFS-LEFT=%noise-23LUFS-LEFT_filespath%L_0dB_Wind_3ms_-23LUFS.wav
set Winds_2msNoise-23LUFS-LEFT=%noise-23LUFS-LEFT_filespath%L_0dB_Wind_2ms_-23LUFS.wav
set Microwave=%noisefilespath%Microwave_Sound_Effect_30_sec_White_Noise_16k16bMonoNorm49.wav
set Microwave-23LUFS-LEFT=%noise-23LUFS-LEFT_filespath%L_0dB_Microwave_Sound_Effect_30_sec_White_Noise_16k16bMonoNorm49_-23LUFS.wav
set Music=%noisefilespath%Music_Amazon_Background-noise_-11dB.wav
set Music-23LUFS-LEFT=%noise-23LUFS-LEFT_filespath%L_0dB_Music_Amazon_Background-noise_-11dB_-23LUFS.wav
set WhiteNoise=%noisefilespath%audiocheck.net_whitenoise.wav
set WhiteNoise-23LUFS-LEFT=%noise-23LUFS-LEFT_filespath%L_0dB_WhiteNoise_-23LUFS.wav
set PinkNoise=%noisefilespath%pink_noise4.wav
set ST-PinkNoise="%noisefilespath%pinknoise_+0dB.Mono_44.100_16Bitwav.wav"
set ST-PinkNoise-23LUFS="%noise-23LUFS_filespath%pinknoise_+0dB.Mono_44.100_16Bitwav_-23LUFS.wav"
set ST-PinkNoise-23LUFS-LEFT="%noise-23LUFS-LEFT_filespath%L_0dB_pinknoise_+0dB.Mono_44.100_16Bitwav_-23LUFS.wav"
set ST-PinkNoise-23LUFS-LEFT-NO100-HZ="%noise-23LUFS-LEFT_filespath%L_0dB_pinknoise_+0dB.Mono_44.100_16Bitwav_-23LUFS_100HZhipass.wav"

REM Dynamic Range Car80-SNR 0
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_-27_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -27 -27 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_-24_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -24 -24 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_-21_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -21 -21 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210-18_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -18 -18 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -15 -15 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210-12_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -12 -12 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210-9_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -9 -9 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210-6_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -6 -6 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210-3_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -3 -3 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 0 0 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_3_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 3 3 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_6_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 6 6 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_9_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 9 9 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_12_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 12 12 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 15 15 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_18_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 18 18 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_21_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 21 21 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_24_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 24 24 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_27_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 27 27 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 30 30 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%

REM Dynamic Range REM Dynamic Range Car80-SNR 12
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -15 -27 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_-12_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -12 -24 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_-9_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -9 -21 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210-6_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -6 -18 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210-3_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -3 -15 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 0 -12 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_3_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 3 -9 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_6_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 6 -6 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_9_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 9 -3 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_12_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 12 0 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 15 3 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_18_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 18 6 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_21_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 21 9 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_24_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 24 12 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_27_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 27 15 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 30 18 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_33_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 33 21 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_36_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 36 24 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_39_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 39 27 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_42_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 42 30 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%

REM Dynamic Range Pink Noise-SNR 0
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_-27_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -27 -27 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_-24_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -24 -24 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_-21_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -21 -21 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210-18_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -18 -18 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -15 -15 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210-12_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -12 -12 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210-9_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -9 -9 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210-6_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -6 -6 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210-3_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -3 -3 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 0 0 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_3_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 3 3 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_6_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 6 6 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_9_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 9 9 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_12_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 12 12 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 15 15 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_18_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 18 18 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_21_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 21 21 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_24_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 24 24 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_27_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 27 27 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-0_210_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 30 30 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%

REM Dynamic Range REM Dynamic Range Pink Noise-SNR 12
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_-15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -15 -27 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_-12_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -12 -24 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_-9_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -9 -21 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210-6_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -6 -18 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210-3_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% -3 -15 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210-0_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 0 -12 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_3_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 3 -9 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_6_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 6 -6 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_9_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 9 -3 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_12_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 12 0 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_15_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 15 3 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_18_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 18 6 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_21_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 21 9 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_24_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 24 12 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_27_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 27 15 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_30_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 30 18 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_33_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 33 21 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_36_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 36 24 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_39_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 39 27 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%
PYTHON %JukeBox20% %logpath%%testname%_Dynamic_Range_Car80_SNR-12_210_42_%TIMESTAMP%.txt %listpath%Alexa_Amazon_210_second-Half_-23LUFS.txt %CarNoise-23LUFS% 42 30 5 0 Serial TRIG Alexa Dynamic_Range COM8 None 2>>%ERRLOG%