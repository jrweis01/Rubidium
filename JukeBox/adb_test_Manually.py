import subprocess
import os

def adbshell(command, serial=None, adbpath='adb'):
    args = [adbpath]
    if serial is not None:
        #args.extend(['-s', serial])
        #args.extend(['-e'])
        args.extend(['-d'])
    args.extend(['shell', command])
    return subprocess.check_output(args)

def pmpath(pname, serial=None, adbpath='adb'):
    return adbshell('pm path {}'.format(pname), serial=serial, adbpath=adbpath)

if __name__ == "__main__":
    ADB = os.path.abspath(os.path.join(os.path.dirname(__file__), "adb"))
    adb_path = os.path.join(ADB, "x64", "adb.exe")

    #p = pmpath(None, "",adb_path)
    p = pmpath(None, "", adb_path)
    print [p]