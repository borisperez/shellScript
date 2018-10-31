#!/usr/bin/ksh
if [ $# -lt 2 ]
then
  echo parametros incorretos
  exit 1
fi
max=$1
ind=1
while [ $ind -le $max ]
do
  cp $2 $2_${ind}
  ind=`expr $ind + 1`
done
