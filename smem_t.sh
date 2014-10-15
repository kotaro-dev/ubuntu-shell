#!/bin/sh

#watch -n 1 --differences smem
fnm=${0##*/}
nlog=${fnm%.*}.log

echo monitor start

#rm $0.log
ps aux |grep USER|grep -v grep >$nlog
while true
do
 ps aux|grep [g]it >>$nlog
# sleep 1
# usleep 100000  #0.1s
 sleepenh 0.1 > /dev/null 
done

echo monitor end
