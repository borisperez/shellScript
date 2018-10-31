#!/bin/ksh
#
#------------------------------------------------------------------------------#
# ps avx|grep -v "PID"|awk -F" " '{print $13":"$1":"$5}'|sort -t: -k3nr |more
#------------------------------------------------------------------------------#
#
ps aux | grep -v "USER" | sort | awk '
BEGIN {
         v_UserAnt="999";
         i=0;
      }
    {
       if ( v_UserAnt != $1 )
          { 
             i+=1;
             a_Use[i]=$1;
             v_UserAnt=$1;
          }
       a_sum[i] += $5;
       a_sum2[i] += $6;
       a_sum3[i] += $3;
       a_sum4[i] += $4;
       sum+=$5;
       sum2+=$6;
       sum3+=$3;
       sum4+=$4;
    }
END {
       printf "\n\n\n";
       printf "+-------------------------------------------------------+\n";
       printf "|               UTILIZACAO DE MEMORIA                   |\n";
       printf "+---------------------+----------+----------+-----+-----+\n";
       printf "|       Usuario       | Alocacao | Alocacao |  %  |  %  |\n";
       printf "|        Unix         | Virtual  | Paginacao| CPU | MEM |\n";
       printf "+---------------------+----------+----------+-----+-----+\n";
       for (i in a_Use)
          {
            printf "|%-18s   |  %8.2f|  %8.2f| %4.1f| %4.1f|\n",
                   a_Use[i], a_sum[i]/1024, a_sum2[i]/1024, a_sum3[i], a_sum4[i];}

       printf "+---------------------+----------+----------+-----+-----+\n";
       printf "| Memoria Total (Mb)  |  %8.2f|  %8.2f| %4.1f| %4.1f|\n", sum/1024, sum2/1024, sum3, sum4;
       printf "+---------------------+----------+----------+-----+-----+\n";
       printf "| Utilizacao (Virtual + Paginacao) = %-9.2f          |\n", sum/1024+sum2/1024;
       printf "+-------------------------------------------------------+\n";
       printf "\n\n\n\n";
    }' 
