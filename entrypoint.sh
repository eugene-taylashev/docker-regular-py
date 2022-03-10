#!/bin/sh
set -e

#=============================================================================
#
#  Variable declarations
#
#=============================================================================
SVER="20220310"         #-- When updated
#VERBOSE=1              #-- 1 - be verbose flag, defined outside of the script

#-- Externally defined variables
#DELAY_SEC=300    #-- delay between script execution is seconds
#SCRIPT2RUN=test.py

#-----------------------------------------------------------------------------
#  Output debugging/logging message
#------------------------------------------------------------------------------
dlog(){
  MSG="$1"
  local TSMP=$(date -Iseconds)
#  echo "$MSG" >>$FLOG
  [ $VERBOSE -eq 1 ] && echo "$TSMP $MSG"
}
# function dlog


#=============================================================================
#
#  MAIN()
#
#=============================================================================
dlog '============================================================================='
dlog "[ok] - starting entrypoint.sh ver $SVER"


#-- start "daemon" as infinit loop
while true
  do
    dlog '[ok] - running Python script'
    if [ -f /usr/src/app/${SCRIPT2RUN} ] ; then
        python3 /usr/src/app/${SCRIPT2RUN}
    else
        dlog "[not ok] - no script ${SCRIPT2RUN}"
    fi
    #-- Delay 
    sleep $DELAY_SEC
done
dlog "[not ok] - end of entrypoint.sh ver $SVER"
