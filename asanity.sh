#!/bin/bash
#MM 2014
# last mod 070915 MM
#Check manager sanity, restart if insane or dead
while sleep 5;do
  if /opt/bro/bin/broctl status manager 2>&1|grep rash ;then
    echo `date +%H:%M:%S`
    /opt/bro/bin/broctl restart manager
  elif /opt/bro/bin/broctl status manager 2>&1|grep topp ;then
    echo `date +%H:%M:%S`
    /opt/bro/bin/broctl start manager
  else
    echo -n `date +%H:%M:%S`
    echo -en "\033[8D"
  fi
done
