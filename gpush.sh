#!/bin/sh

PW=sasaki
RT=`pwd`
#bdir=master
bdir=${2}

cd ${1}

expect -c "
  set timeout
  spawn git checkout -b ${bdir}
  expect
"

expect -c "
  set timeout 10
  spawn git pull --rebase origin ${bdir}
  expect \"password:\"
  send \"${PW}\n\"
  expect
"

expect -c "
  set timeout 10
  spawn git push origin ${bdir}
  expect \"password:\"
  send \"${PW}\n\"
  expect 
"
cd ${RT}

