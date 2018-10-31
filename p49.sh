#!/usr/bin/ksh
clear
for l in `more camp`
do
 t1=`echo $l | cut -d: -f2`
 t2=`echo $l | cut -d: -f3`
 g1=`echo $l | cut -d: -f4`
 g2=`echo $l | cut -d: -f5`
 if [ $g1 -eq $g2 ]
 then
  msg=":EMPATE"
 elif [ $g1 -gt $g2 ]
 then
  msg=":VITORIA do $t1"
 else 
  msg=":VITORIA do $t2"
 fi
 echo "${l}${msg}"
done