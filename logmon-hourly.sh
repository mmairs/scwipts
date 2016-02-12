#!/bin/bash

########################################################################
##
##         Aweful Syslog Log Change Notification System
##
##         Last Modified: 2015-02-09 - mmairs
##
##         Updates file whenever network machines start or stop logging.
##
########################################################################

hour=$(date +%H)
today=$(date +%Y%m%d)
year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)
yesteryear=$(date -d "Yesterday" +%Y)
yestermonth=$(date -d "Yesterday" +%m)
yesterday=$(date -d "Yesterday" +%d)
yesterhour=`perl -e 'printf "%02d", $ARGV[0] - 1' "$hour"`
echo "$yesterhour" > /tmp/netlogchanges.$hour
for machine in $(find /var/log -maxdepth 1 -mtime +1 -type d | tail -n +2 | cut -d "/" -f 6); do 
  if ls /var/log/$machine/$year/$month/$day/*$year$month$day$hour>/dev/null 2>&1 ; then 
    if ! ls /var/log/$machine/$year/$month/$day/*$year$month$day$yesterhour>/dev/null 2>&1 ; then 
      echo "$machine has resumed logging."
      echo "$machine has resumed logging." >> /tmp/netlogchanges.$hour
    fi 
  else 
    if ls /var/log/$machine/$year/$month/$day/*$year$month$day$yesterhour>/dev/null 2>&1 ; then 
      echo "$machine has stopped logging."
      echo "$machine has stopped logging." >> /tmp/netlogchanges.$hour
    fi
  fi
done
