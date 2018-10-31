#!/usr/bin/ksh
trap 'rm sts.tmp' 0 1 2 15
while true
do
	clear
	echo
	echo "1) imprime data"
	echo "2,3) lista diretorio"
	echo "4) lista estatistica"
	echo "5) sair"
	echo
	echo "Opcao: \c"
	read op
	case $op in
		1)  echo "opcao $op" >>sts.tmp 
		    date 
		    echo
		    echo "digite enter para continuar \c"
		    read null;;
		2|3) echo "opcao $op" >>sts.tmp 
		    ls -la | more 
		    echo
		    echo "digite enter para continuar \c"
		    read null;;
		4)  more sts.tmp 
		    echo
		    echo "digite enter para continuar \c"
		    read null;;
		5)  break;;
	esac
done