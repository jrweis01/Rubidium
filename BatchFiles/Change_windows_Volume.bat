@echo off
rem 65536 is 100%
rem device where zero is the default device
rem left and right
rem supports whole numbers only therefore throws "missing operator" error when specifying 655.36
REM Increase the system volume by 2000 units (out of 65535)
REM nircmd.exe changesysvolume 2000
REM Decrease the system volume by 5000 units (out of 65535)
REM nircmd.exe changesysvolume -5000
REM Set the volume to the highest value
REM nircmd.exe setsysvolume 65535
REM Mute
REM nircmd.exe mutesysvolume 1
REM Unmute
REM nircmd.exe mutesysvolume 0

set /a volume=%1 * 655
nircmd setvolume 0 %volume% %volume%