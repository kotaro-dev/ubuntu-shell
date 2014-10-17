#!/bin/sh
PW=sasaki
RT=`pwd`
rpnm=bare

for i  in `seq 1 2`
do
  mkdir b${i} && cd b${i}

  expect -c "
    set timeout 10
    spawn git clone localhost:repo/${rpnm}.git
    expect \"password:\"
    send \"${PW}\n\"
    interact
  "
  cp $HOME/tmp/gcom3.sh ${rpnm}/gcom3.sh
  cd ${rpnm}
  ./gcom3.sh ${i}

  cd ${RT}
done

wait

for i in `seq 1 2`
do 
  sleepenh 0.001
  ./gpush.sh b${i}/${rpnm} b${i} & 
done

wait

#    expect \"Cloning into 'bare'...\"
#    expect \"sasaki@localhost's password:\"
