#!/bin/bash
SYSLOG=blah
if for p in {514};do curl -sm6 localhost:$p;echo -n $p:$?;done|grep :0 >/dev/null;then
  echo -n `date +%H:%M:%S`
  echo -en "\033[8D" 
else
  echo -en "\033[8D" 
  echo -n `date` restart
  echo
  /etc/init.d/$SYSLOG restart
fi
