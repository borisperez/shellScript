#!/usr/bin/ksh
clear
echo "Selecione uma das opgues abaixo"
echo
echo "1 compactar o arquivo"
echo "2 descompactar o arquivo"
echo "3 listar arquivo"
echo
echo "Entre com a opcao: \c"
read OPCAO
case $OPCAO	in
	1) echo "digite o nome do arquivo: \c"
	   read nmArq
	   if [ -a $nmArq ]
	   then
	      compress $nmArq
	   else 
	     echo Esse arquivo não existe
	   fi ;;
	2) echo "digite o nome do arquivo: \c"
	   read nmArq
	   if [ -a $nmArq ]
	   then
	      uncompress $nmArq
	   else 
	     echo Esse arquivo não existe
	   fi ;;
	3) echo "digite o nome do arquivo: \c"
	   read nmArq
	   ls -l ${nmArq}* ;;
	*) echo OPCAO INVALIDA ;;
esac

#if [ -d $1 ]
#then
#  echo "digite o nome de um arquivo"
#  exit 1
#fi
#case "$OPCAO" in
#   1) echo compactando arquivo
#	compress $1;; 
#   2) echo descompactando arquivo
#	uncompress $1;;
#   3) ls -la | more -d;;
#   *) echo Opcao errada
#      exit 2;;
#esac

