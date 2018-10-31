#!/usr/bin/ksh

ps -ef > arq_ps
echo testando se o arquivo eh um diretsrio
test -d arq_ps
echo $?
echo
echo testando se o arquivo eh um executavel
test -x arq_ps
echo $?
chmod 777 arq_ps
echo
echo testando se o arquivo eh um executavel
test -x arq_ps
echo $?
echo
echo testando se o arquivo esta vazio
test -s arq_ps
echo $?
echo
echo criando um arq vazio .. teste leitura + regular
touch um_arquivo
test -r um_arquivo -a -f um_arquivo
echo $?
echo criando um arq vazio .. teste leitura + dif regular
test -r um_arquivo -a ! -f um_arquivo
echo $?

