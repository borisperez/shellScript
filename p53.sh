#!/usr/bin/ksh
while true
do
  clear
  proc1=`ps -ef | grep p51.a | grep -v grep` 
  proc2=`ps -ef | grep p51.b | grep -v grep` 
  proc3=`ps -ef | grep p51.c | grep -v grep` 
  if [ ${#proc1} -ne 0 ] ; then
    echo "P51.a em Execucao"
  else
    echo "P51.a fora do ar"
  fi
  if [ ${#proc2} -ne 0 ] ; then
    echo "P51.b em Execucao"
  else
    echo "P51.b fora do ar"
  fi
  if [ ${#proc3} -ne 0 ] ; then
    echo "P51.c em Execucao"
  else
    echo "P51.c fora do ar"
  fi
  sleep 10
done