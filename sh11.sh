#!/usr/bin/ksh
if [$# -eq 0 ]
then
  echo entre com um conjunto de numeros
  exit 1
fi
soma=0
for INT in $*
do
  i=$soma
  soma=`expr $INT + $i`
done
echo $soma

