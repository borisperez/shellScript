#!/usr/bin/ksh
echo "digite seu nome: \c" 
read nm 
echo "digite sua idade: \c" 
read id
hoje=`date '+%Y'`
nac=`expr $hoje - $id`
echo
echo $nm seu ano de nascimento eh
echo
banner $nac

