import winsound
from sys import argv
import time

winsound.PlaySound(argv[1], winsound.SND_LOOP | winsound.SND_ASYNC)

# Sleep forever, to let the wav play
while True:
	time.sleep(0xFFFFF)