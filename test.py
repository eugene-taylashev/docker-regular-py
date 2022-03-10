#-- Test script: output date-time to STDERR

import sys
import datetime

def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)


# ct stores current time
ct = datetime.datetime.now()

eprint("\ttest script: ", ct)
