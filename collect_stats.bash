#! /bin/bash

#---------------------------------------
# $Author: ee364g20 $
# $Date: 2017-01-18 16:33:29 -0500 (Wed, 18 Jan 2017) $
#---------------------------------------

# Do not modify above this line.

# $Author: ee364g20 $
# $Date: 2017-01-18 16:33:29 -0500 (Wed, 18 Jan 2017) $

i=1
length=0
j=3
originset=0
avg=0
list1=$1
list2=$2
argnum=$#
victormed=0
victorname=0
totath=0
totmed=0

if ((argnum < 2))
then
    echo "Usage: collect_stats.bash <file> <sport>"
    printf "\n"
    exit 1
fi    
    if [[ -e $list1 ]]
    then
        while read length
        do
        #echo $length |
            originset="$(echo $length | cut -d',' -f1)"
            hold1="$(echo $length | cut -d',' -f2)" 
            hold2="$(echo $length | cut -d',' -f"$j")"
            
            if [[ $hold1 == $list2 ]]
            then
                ((totath=totath+1))
                ((totmed=totmed+hold2))
                if (($hold2 > $victormed))
                then
                    victorname=$originset
                    victormed=$hold2
                fi
            fi 
        done <$1
        echo "Total athletes: $totath"
        echo "Total medals won: $totmed"
        echo "$victorname won the most medals: $victormed"
    else
        echo "Error: $list1 does not exist."
        printf "\n"
        exit 2
    fi
    printf "\n";

