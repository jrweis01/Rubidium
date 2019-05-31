'''
@author: barak
'''
from phone import _is_on_64bit
from globs import *

def _get_adb_path():
    
    """
    The adb exe is in a folder next to our script. Find the correct exe and return it's path
    """
    if _is_on_64bit():
        architecture = "x64"
    else:
        architecture = "x86"
    adb_path = os.path.join(ADB_DIRECTORY, architecture, "adb.exe")

    assert os.path.isfile(adb_path), "adb.exe not found!"

    return adb_path