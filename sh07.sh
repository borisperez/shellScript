#!/usr/bin/ksh
if [ $# -ne 2 ]
then
  echo numero errado de parametros
  exit
fi 
if [ $1 -eq $2 ] ; then
  echo A $1 eh igual a $2
fi
if [ $1 -ne $2 ] ; then
  echo B $1 eh diferente de $2
fi
if [ $1 -gt $2 ] ; then
  echo D $1 eh maior que $2
fi
if [ $1 -ge $2 ] ; then
  echo E $1 eh maior ou igual que $2
fi
if [ $1 -lt $2 ] ; then
  echo F $1 eh menor que $2
fi
if [ $1 -le $2 ] ; then
  echo G $1 eh menor ou igual a $2
fi
if [ $2 = $2 ] ; then
  echo H $2 eh igual a $2
fi
if [ $2 != $2 ] ; then
  echo I $2 eh diferente de $2
fi

