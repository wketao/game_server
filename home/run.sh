#!/bin/sh

if ps aux | grep -i "./ShareMemory" | grep -v grep >/dev/null 2>&1;then
  echo " ShareMemory  is running !!!!!!"
else
  ###### start ShareMemory ######
  cd /home/tlbb/Server/ 
  ./shm clear
  rm -rf exit.cmd quitserver.cmd
  #echo -e "\n"
  echo " start ShareMemory ......"
  ./shm start &
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
  ./World &
  sleep 5
  echo " World started completely !!!!!!"

  ###### start Login ######
  echo " start Login ......"
  ./Login &
  sleep 1
  echo " Login started completely !!!!!!"

  ###### start Server ######
  cd /home/tlbb/Server/
  echo " start Server ......"
  ./Server
fi
