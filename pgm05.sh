#!/usr/bin/ksh
maior()
{
  echo "Quem é maior $1 ou  $2 ? "
  if [ $1 -eq $2 ] ; then
    echo "$1 e $2 sao iguais"
  elif [ $1 -gt $2 ] ; then
    echo "$1 e maior"
  else
    echo "$2 e maior"
  fi
}

# principal
clear
echo "oi, "
maior $1 $2