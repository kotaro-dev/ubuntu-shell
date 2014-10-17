#!/bin/sh

fnm=${0##*/}
nlog=${fnm%.*}.log
bno=${1}
sno=`expr ${bno} \* 10 + 1`
eno=`expr \( ${bno} + 1 \) \* 10`
bdir=b${bno}

head="real,user,system,elapsed,cpu,text,data,max,inputs,outputs,major,minor,swaps"
fmat="%e, %U, %S, %E, %P, %X, %D, %M, %I, %O, %F, %R, %W"
echo $nlog

echo start 1000 time git commit >$nlog
echo "$head">>$nlog
echo "$fmat" >>$nlog

for i in `seq ${sno} ${eno}`
do
  echo $i
  date  >> $i.txt
#  (time git add $i.txt) >>$nlog 2>&1
  git add $i.txt
#  (time git commit -m "add commit $i.txt") >>$nlog 2>&1
  (time -f "$fmat" git commit -m "add commit $i.txt ${bdir}") 2>>$nlog
#  rm $i.txt
done

echo end   1000 time git commit >>$nlog

exit

# %U user %S system %E elapsed %P CPU (%X text+%D data %M max)k
# %I inputs+%O outputs (%F major+%R minor)pagefaults %W swaps
#
# echo "user,system,elapsed,cpu,text,data,max,inputs,outputs,major,minor,swaps"
# echo "%U, %S, %E, %P, %X, %D, %M, %I, %O, %F, %R, %W"
# -f "%U, %S, %E, %P, %X, %D, %M, %I, %O, %F, %R, %W"
 


