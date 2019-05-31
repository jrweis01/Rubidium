'''
@author: barak
'''


PHRASES = {0: "Timeout",
           1: "Hello Rubidium",
           13: "What can i say",
           16: "Cancel",
           22: "Repeat"
           }
    
old_DIAGNOSTIC = {0:	"old",
                  1:	"",
                  2:	"A2DP KAP Loaded",
                  6:	"Timeout",      # decimal value = 192
                  4:	"Idle KAP Loaded",     # deciml 128 # disabled - might need a different segment
                  5:	"Distortion",
                  8:    "Reset",        # decimal 256
                  16:	"Unrecognized"  # decimal 512
                  }

DIAGNOSTIC = {0:	"new",           #new, from  05/12/16
              1:	"Timeout",
              2:	"Alive",
              4:	"",
              8:	"",
              16:	"Reset",

              }

FitBit_PHRASES = {0:    "Timeout",
                  1:    "Trigger",
                  2:    "Play Music",
                  3:    "Stop Music",
                  4:    "Pause Music",
                  5:    "Next Track",
                  6:    "Previous Track",
                  7:    "Settings",
                  8:    "Cancel"
                  }

Ambarella_PHRASES = {0:    "",
                     2:    "Trigger",
                     13:   "What can I say",
                     20:	"Timeout",
                     26:   "Stop Music",
                     24:   "Start Music",
                     8:    "Cancel"
                     }

# Jabra
Fitness_Jabra_PHRASES = {0: "",
                         2:  "Trigger",
                         6:	 "Volume Up",
                         8:  "Volume Down",
                         10: "Next Song",
                         12: "Pause",
                         13: "Play Music",
                         14: "What distance have I done",
                         16: "Resume",
                         17: "Answer",
                         18: "Ignore",
                         19: "Power Off",
                         20: "Pairing",
                         21: "Battery level",
                         23: "Unrecognized"
                         }
Fitness_Mtrig_PHRASES = {0: "",
                         2:  "Volume PLUS Up",
                         4:  "Volume PLUS Down",
                         6:	 "Volume Up",
                         8:  "Volume Down",
                         10: "Next Song",
                         12: "Stop Music",
                         13: "",
                         14: "",
                         16: "",
                         17: "Answer",
                         18: "Ignore",
                         19: "",
                         20: "",
                         21: "",
                         23: "Unrecognized"
                         }
Idle_PHRASES = {0: "",
                2: "Trigger",
                13: "Play Music",
                14: "What distance have I done",
                16: "Resume",
                19: "Power Off",
                20: "Pairing",
                21: "Battery level",
                23: "Unrecognized"
                }

Ringing_PHRASES =        {0:    "",
                         2:     "Trigger",
						 17:	"Answer",
                         18:	"Ignore",
                         23:    "Unrecognized"
                         }

# Google
Fitness_Google_PHRASES = {0: "",
                          2:  "Trigger",
                          6:	"Volume Up",
                          8:  "Volume Down",
                          10:	"Next Song",
                          12:    "Pause",
                          14:    "What distance have i done",
                          16:    "Resume",
                          18:	"Unrecognized",
                          20:	"Timeout"
                          }
# Alexa
Fitness_Alexa_PHRASES = {0: "",
                         2:  "Trigger",
                         6:	"Volume Up",
                         8:  "Volume Down",
                         10:	"Next Song",
                         12:    "Pause",
                         14:    "What distance have i done",
                         16:    "Resume",
                         18:	"Unrecognized",
                         20:	"Timeout",
                         22:    "Alexa Timeout"
                         }

# Alexa
Fitness_Bluedio_PHRASES = {0: "",
                         2:  "Trigger",
                         6:	 "Volume Up",
                         8:  "Volume Down",
                         10: "Next Song",
                         12: "Pause",
                         13: "Play Music",
                         17: "Answer",
                         18: "Ignore",
                         19: "Power Off",
                         23: "Unrecognized"
                         }

old_Jabra_DIAGNOSTIC = {0:		"old",
                    1:		"Timeout",
                    2:		"Timeout",
                    3:		"High Background Noise",
                    4:		"Clipping",
                    5:		"Distortion",
                    }

Jabra_DIAGNOSTIC = {0:		"new",             #new, from  29/11/16
                    1:		"Timeout",
                    2:		"Timeout",
                    3:		"High Background Noise",
                    4:		"Clipping",
                    5:		"Distortion",
                    }
MyMano = {0: "",
                   2: "Trigger",
                   6: "empty1",
                   8: "empty2",
                   10: "empty3",
                   11: "empty4",
                   12: "empty5",
                   13: "empty1",
                   17: "empty1",
                   18: "empty2",
                   19: "empty2"

           }

# Voice Express
Generic = {0: "",
                   2: "Trigger",
                   6: "empty2",
                   8: "empty1",
                   10: "empty3",
                   12: "empty4",
                   14: "empty5",
                   16: "empty7",
                   18: "empty8",
                   20: "empty9",
                   22: "empty10"
           }

PRJ_DICT = {"Hello Rubidium":   [PHRASES, DIAGNOSTIC],
            "Rubidium":         [PHRASES, DIAGNOSTIC],
            "FitBit":	        [FitBit_PHRASES, DIAGNOSTIC],
            "Jabra":	        [Fitness_Jabra_PHRASES, DIAGNOSTIC],
            "Alexa":            [Fitness_Alexa_PHRASES, DIAGNOSTIC],
            "Hey_Jabra":	    [Fitness_Jabra_PHRASES, DIAGNOSTIC],
            "OK_Google":        [Fitness_Google_PHRASES, DIAGNOSTIC],
            "Google":           [Fitness_Google_PHRASES, DIAGNOSTIC],
            "Jabra_old":	    [Fitness_Jabra_PHRASES, old_DIAGNOSTIC],
            "Ambarella":        [Ambarella_PHRASES, DIAGNOSTIC],
            "Jabra_old2":	    [Fitness_Jabra_PHRASES, old_DIAGNOSTIC],  #new, from  29/11/16
            "Google_old":       [Fitness_Google_PHRASES, old_DIAGNOSTIC],  #new, from  29/11/16
            "MyMano":           [MyMano, old_DIAGNOSTIC],  # new, from  19/11/17
            "Ringing":          [Ringing_PHRASES, old_DIAGNOSTIC],
            "MusicASR":         [Fitness_Jabra_PHRASES, old_DIAGNOSTIC],
			"MusicMtrig":       [Fitness_Mtrig_PHRASES, old_DIAGNOSTIC],
            "FitnessASR":       [Fitness_Jabra_PHRASES, old_DIAGNOSTIC],
            "StandbyASR":       [Idle_PHRASES, old_DIAGNOSTIC],
            "Generic":          [Generic, DIAGNOSTIC],  #new, from  23/07/17
            "Bluedio":          [Fitness_Bluedio_PHRASES, DIAGNOSTIC],

            }













