#!/bin/bash

ulimit -n 65535
if ps aux | grep -i "./ShareMemory" | grep -v grep >/dev/null 2>&1;then
  echo " ShareMemory  is running !!!!!!"
else
  ###### start Billing Server ######
  cd /root/files/billing
  echo " start Billing Server ......"
  ./billing >/dev/null 2>&1 &
  sleep 5
  echo " Billing started completely !!!!!!"
  ###### start ShareMemory ######
  cd /home/tlbb/Server/ 
  ./shm clear >/dev/null 2>&1
  rm -rf exit.cmd quitserver.cmd
  #echo -e "\n"
  echo " start ShareMemory ......"
  ./shm start >/dev/null 2>&1
  #echo -e "\n"

  #until  [ "$STATUS" ]
  #FILE=`ls -l -lt /home/tlbb/Server/Log/ShareMemory* | head -n 1 | awk '{print$9}' `
  #do
  #  STATUS=`tail -1 $FILE | grep "Loop...Start" | egrep -vi 'grep|tail' ` 
  #done
  
  sleep 30
  echo " ShareMemory started completely !!!!!!"

  ###### start World ######
  cd /home/tlbb/Server/ 
  echo " start World ......"
  ./World >/dev/null 2>&1 &
  sleep 5
  echo " World started completely !!!!!!"

  ###### start Login ######
  echo " start Login ......"
  ./Login >/dev/null 2>&1 &
  sleep 1
  echo " Login started completely !!!!!!"

  ###### start Server ######
  cd /home/tlbb/Server/
  echo " start Server ......"
  ./Server >/dev/null 2>&1
  sleep 30
  echo " Server started completely !!!!!!"

  #until
  #[ "$?" = "1" ]
  #do
  #  ps aux | grep -i "./Server -loadscriptonce" | grep -v grep >/dev/null 2>&1
  #done
  #
fi
