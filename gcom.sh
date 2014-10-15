#!/bin/sh

echo start 100 time git commit

for i in `seq 1 100`
do
  echo i > $i.txt
  date  >> $i.txt
  git add $i.txt
  git commit -m 'add commit $i.txt'
done

echo end   100 time git commit
