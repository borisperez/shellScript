#!/usr/bin/ksh
if [ $# -ne 1 ]
then
  tempo=10
else
  tempo=$1
fi
while true
do
  echo "executando ..."
  sleep $tempo
done