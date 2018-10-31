#!/usr/bin/ksh
funcao02()
{
 echo "Todos os parametros ...: $*"
 echo "Primeiro parametro da funcao: $1"
 echo "Segundo  parametro da funcao: $2"

}

# Programa principal
clear
echo "Oi Estou no programa principal"
echo
echo "Oi Vou chamar minha funcao"
funcao02 10 2 20 "Hugo De Carlo Rocha Filho"
echo
