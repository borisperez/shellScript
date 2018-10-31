ip=17.45.0.13
logFTP=ftp.log
logERR=ftperro.txt
usuario=usu
senha=sejn
dir_remoto="/home/desenv/hugo/aula5"
dir_local="/home/desenv/hugo/ftp"

rm -f arq_envio

for linha in `ls p*`
do
	echo "get $linha" >> arq_envio
done


ftp -inv $ip > $logFTP 2> $logERR <<EOF
	user $usuario $senha
	cd $dir_remoto
	lcd $dir_local
	ascii 
#	prompt
	`cat arq_envio`
	bye
EOF
