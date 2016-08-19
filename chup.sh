#!/bin/bash
#MM 082815 keep process up and sane
P=blah
killall -HUP $P
if [ $? == 1 ]; then
  service $P restart
fi
