#!/usr/bin/ksh
clear
for l in `ls -a`
do
 v=$l 
  if [ -d $l ] ; then
   v=$v" :DIRETORIO "
  fi
  if [ -x $l ] ; then
    v=$v" :EXE " 
  fi
  if [ -w $l ] ; then
    v=$v" :GRAVA " 
  fi
  if [ -r $l ] ; then
    v=$v" :LE " 
  fi
  if [ -s $l ] ; then
    v=$v" :CHEIO " 
  fi

  echo $v
  
done

