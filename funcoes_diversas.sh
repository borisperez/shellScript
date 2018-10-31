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

# ou

s_length()
{
	length=`expr length "$1"`
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

