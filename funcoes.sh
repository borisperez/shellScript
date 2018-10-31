#!/bin/ksh

######################################################
#		FUNCOES DE MANUPULACAO DE STRING
######################################################

s_numline()
{
	num=`cat $1 | wc -l`
	echo $num
}

s_length()
{
	length=`echo "$1" | wc -c | cut -c1-8`
	length=`expr $length - 1`
	echo $length
}

s_upper()
{
	echo $@ | tr [a-z] [A-Z]
}

s_lower()
{
	echo $@ | tr [A-Z] [a-z]
}

######################################################
#		FUNCOES DE MANUPULACAO DE DATA E HORA
######################################################

s_month_length()        # (c) RHReepe. Returns number of days in MONTH (INT)
# Arg_1 = MONTH_NUMBER
{
	if [ $# -ne 1 ] ; then
		echo "Entrar com o argumento"
		exit 1
	fi	
    if [ $1 -lt 1 ] || [ $1 -gt 12 ]
    then
		echo "$0:s_month_length(): [$1] \
		     is not between 1 and 12"
		exit
	    fi
    length="312831303130313130313031"        
    let x='4'
    resto=`expr $1 % $x`
    if [ $resto = 0 ] 
    then
    length="312931303130313130313031"        
    fi 
    cut2=`expr $1 + $1`
    cut1=`expr $cut2 - 1`
    echo $length | cut -c$cut1-$cut2
}

s_interval()    # (c) RHReepe. Returns a time difference (HH:MM:SS)
  # Arg_1 = start_time (Format - See s_time)
  # Arg_2 = stop_time  (Format - See s_time)
{
	h1=`echo $1 | cut -c1-2`    # Get Start Hour
	m1=`echo $1 | cut -c3-4`    # Get Start Minute
	s1=`echo $1 | cut -c5-6`    # Get Start Second
	h2=`echo $2 | cut -c1-2`    # Get Stop Hour
	m2=`echo $2 | cut -c3-4`    # Get Stop Minute
	s2=`echo $2 | cut -c5-6`    # Get Stop Second
	s3=`expr $s2 - $s1`         # Calculate Second Difference
	if [ $s3 -lt 0 ]            # Test for Negative Seconds
	then
		s3=`expr $s3 + 60`      # If yes - add one minute...
		m1=`expr $m1 + 1`               # ... and to subtractor
	fi
	m3=`expr $m2 - $m1`         # Calculate Minute Difference
	if [ $m3 -lt 0 ]            # Test for Negative Minutes
	then
		m3=`expr $m3 + 60`      # If yes - add one hour...
		h1=`expr $h1 + 1`               # ... and to subtractor
	fi
	h3=`expr $h2 - $h1`         # Calculate Hour Difference
	if [ $h3 -lt 0 ]            # Test for Negative Hours
	then
		h3=`expr $h3 + 24`      # If yes - add one day
	fi
	for number in $h3 $m3 $s3   # Loop through numbers...
	do
		if [ $number -lt 10 ]   # If number is single digit...
		then
			/usr/5bin/echo "0$number\c" # ... add leading zero
		else
			/usr/5bin/echo "$number\c"  # ... else - don't
		fi
	done
	echo ""                     # Terminate the string
}

s_back_date()     # (c) RHReepe. Returns a date string DAYS back
{
	if [ $# -ne 1 ] ; then
		echo "Entrar com o argumento"
		exit 1
	fi	
	days=$1
	date_d=`date +%d`
	date_m=`date +%m`
	date_y=`date +%Y`
	#--------------------------------
	# Days Back Size Test
	#--------------------------------
	if [ $days -lt $date_d ]
	then
		date_d=`expr $date_d - $days`
	else
		days=`expr $days - $date_d`
		date_m=`expr $date_m - 1`
		month_length=`s_month_length $date_m`
		while [ $days -gt $month_length ]
		do
			days=`expr $days - month_length`
			date_m=`expr $date_m - 1`
			month_length=`s_month_length $date_m`
		done
		date_d=`expr $month_length - $days`
	fi
	#--------------------------------
	# Date  String Padding
	#--------------------------------
	if [ $date_d -lt 10 ]
	then
		tam1=`echo "$date_d" | wc -c | cut -c1-8`
		tam1=`expr $tam1 - 1`
		if [ $tam1 = 1 ]
		then    
			date_d="0"$date_d
		fi		
	fi
	
	if [ $date_m -lt 10 ]
	then
		tam2=`echo "$date_m" | wc -c | cut -c1-8`
		tam2=`expr $tam2 - 1`
		if [ $tam2 = 1 ]
		then
			date_m="0"$date_m
		fi
	fi
	#echo $date_y $date_m $date_d
	echo $date_d$date_m$date_y
}

######################################################
#				FUNCOES GERAIS DE REDE
######################################################

s_running()     # (c) RHReepe. Checks if script is running
#===================================================================
{
	if [ -f /tmp/db_`s_prog`_running.lock ]
	then
		echo "Script [$0] is already running!"
		exit -1
	else
		touch /tmp/db_`s_prog`_running.lock
	fi
}


faz_ftp()
{
	ftp -inv $2 <<EOF > /dev/null
	user $3 $4
	prompt
	ascii	
	lcd $7
	cd $8
	$6 $5
	bye
EOF

	ftp -inv $2 <<EOF | grep $5 > ftp_saida # gera o arq contendo os arquivos usados na transferencia
	user $3 $4
	ls -l
	bye
EOF
	#typedef -i tamanho_ftp	
	tamanho_local=`ls -l $5 | awk '{print $5}'`
	#echo "TAMANHO1" $tamanho_local
	cat ftp_saida | while read linha
	do
		grep $5 ftp_saida > /dev/null
		if [ $? -eq 0 ] ; then
			#echo "LINHA "$linha
			tamanho_ftp=`echo $linha | awk '{print $5}'`
			#echo "TAMANHO2" $tamanho_ftp
			if [ tamanho_ftp -eq tamanho_local ] ; then
				echo 1
			else 
				echo 0		
			fi
		fi
	done
}

######################################################
#		VERIFICA QUAL FUNCAO FOI CHAMADA
######################################################

# transforma a funcao para minuscula
FUNCAO=` echo $1 | tr [A-Z] [a-z]`

case $FUNCAO in
	s_numline	  )	RETORNO=`s_numline $2`;;
	s_length	  )	RETORNO=`s_length "$2"`;;
	s_upper 	  )	RETORNO=`s_upper $2`;;
	s_lower 	  )	RETORNO=`s_lower $2`;;
	faz_ftp 	  )	RETORNO=`faz_ftp $@`;;
	s_back_date   )	RETORNO=`s_back_date $2`;;
	s_month_length)	RETORNO=`s_month_length $2`;;
esac

echo $RETORNO

