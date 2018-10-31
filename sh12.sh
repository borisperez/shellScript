#!/usr/bin/ksh
  while true
  do
    read opcao
    case $opcao in
      m) date '+%m ';;
      d) date '+%d ';;
      y) date '+%y ';;
      D) date '+%D ';;
      H) date '+%H ';;
      M) date '+%M ';;
      S) date '+%S ';;
      T) date '+%T ';;
      X|x) exit 1;;
      *) echo Opcao invalida;;
    esac
  done

