#!/usr/bin/ksh
clear
int=1
echo "Foram passados $# parametros listados abaixo:"
echo $*
echo
until [ $# -eq 0 ]
do
  echo "Parametro $int = $1 ; Faltam `expr $# - 1` parametros."
  shift

done
echo
echo

