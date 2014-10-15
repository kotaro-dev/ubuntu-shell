#!/bin/sh

#watch -n 1 --differences smem

echo monitor start

#rm $0.log
ps aux |grep USER|grep -v grep >$0.log
while true
do
 ps aux|grep [g]it >>$0.log
 sleep 1
done

echo monitor end
