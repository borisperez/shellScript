#!/usr/bin/ksh
funcao02()
{
 echo "Todos os parametros ...: $*"
 echo "Primeiro parametro da funcao: $1"
 echo "Segundo  parametro da funcao: $2"
# let x=$1+$2
 x=`expr $1 + $2`
 echo "Valor de X dentro da funcao: $x"
 return $x
}

# Programa principal
clear
echo "Oi Estou no programa principal"
echo
x=1
funcao02 10 2 20 "Hugo De Carlo Rocha Filho"
result=$?
echo
echo "Resultado da funcao: $result"
echo "Valor de X FORA da funcao: $x"