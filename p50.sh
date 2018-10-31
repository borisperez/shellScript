#!/usr/bin/ksh
clear
echo
echo  
echo "============(Arquivo)=================="
echo

TOTnumA=0
TOTnumB=0
TOTnumC=0
TOTerro=0
while read linha 
do
  numA=`echo $linha |cut -c1-8`
  numB=`echo $linha |cut -c9-16`
  tipo=`echo $linha |cut -c17-19`
  echo $numA $numB $tipo
  if [ $tipo = 'TP1' ] ;then
     TOTnumA=`expr $TOTnumA + 1`
  elif [ $tipo = 'TP2' ] ;then
  TOTnumB=`expr $TOTnumB + 1`
  elif [ $tipo = 'TP3' ] ;then
  TOTnumC=`expr $TOTnumC + 1`
  else
  TOTerro=`expr $TOTerro + 1`
  fi  
done < chamadas.txt
echo
echo "============(Estatistica)=============="
echo "Total de chamadas TP1: $TOTnumA  "
echo "Total de chamadas TP2: $TOTnumB  "
echo "Total de chamadas TP3: $TOTnumC  "
echo "Total de chamadas com erro: $TOTerro  "
echo "======================================="
echo
echo