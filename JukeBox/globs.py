import os
import time


DEBUG = True

TIME_FOR_FILENAMES = time.strftime("%y-%m-%d_%H-%M-%S")

LOGGER_PATH = os.path.join(os.path.dirname(__file__), "logs\jukebox_log_%s.txt" % TIME_FOR_FILENAMES)
#LOGGER_FORMAT = "%(asctime)s.%(msecs)03d %(levelname)s - %(message)s"
LOGGER_FORMAT = "%(levelname)s - %(message)s"
LOGGER_DATE_FORMAT = "%a %d/%m/%Y %H:%M:%S"

RECOGNIZED_PHRASE_MP = ""

PAUSE = False

