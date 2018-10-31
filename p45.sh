#!/usr/bin/ksh
while true
do
	clear
	echo "1) adicionar jogo"
	echo "2) remover jogo"
	echo "3) listar campeonato"
	echo "4) sair"
	echo
	read op
	case $op in
	   1) echo Digite o camponato no formato:
	      echo "jogo:time1:time2:gols1:gols2"
	      read linha
	      echo $linha >>camp;;
	   2) echo Digite o camponato no formato:
	      echo "jogo:time1:time2:gols1:gols2"
	      read linha
	      more camp | grep -v $linha > camp.tmp
	      mv camp.tmp camp;;
	   3) clear 
	   	  more camp 
	   	  echo 
	   	  echo "Digite enter para sair"
	   	  read null;;
	   4) break;;	   	   	   	   
	esac	
done
