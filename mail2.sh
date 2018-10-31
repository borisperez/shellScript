#!/bin/ksh
while true
do
	# Monta uma mensagem para botar no corpo do e-mail
	{
		echo "Esse é o corpo do e-mail "
		echo "aqui você pode escrever um monte de coisas"
		echo "para quem vai ler"
		echo
		echo "Ass. Hugo De Carlo"	
		echo
	} > corpo

	uuencode arquivo.txt arquivo.txt >> corpo
	uuencode arquivo2.txt arquivo2.txt >> corpo
	mailx -s "QUE MANEIRO !!!" hugo.filho@telefonicacelular.com.br < corpo 
	sleep 5
done