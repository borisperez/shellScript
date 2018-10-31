#!/usr/bin/ksh
if [ $# -ne 1 ]
then
  echo numero errado de parametros
  exit
fi 

if [ $1 = 'N' -o $1 = 'n' ]
then
   echo voce digitou a letra n
else
   echo nao faco a  menor ideia da letra
fi

