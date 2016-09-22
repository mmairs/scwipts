#!/bin/bash
tcpdump -t -c 10000 | awk -F "." '{print $1" "$2" "$3" "$4}'|sort|uniq -c|sort -nr|awk '$1>10'
