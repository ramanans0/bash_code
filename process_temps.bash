#! /bin/bash
# $Author: ee364g20 $
# $Date: 2017-01-22 21:48:13 -0500 (Sun, 22 Jan 2017) $

i=1
j=1
length=0
words=0
originset=0
avg=0
topavg=0
list1=$1
hold1=0
totsum=0
holdarr=0
var=0
argnum=$#


if ((argnum < 1))
then
    echo "Usage: process_temps.bash <file>"
    printf "\n"
    exit 1
fi    
    if [[ -e $list1 ]] && [[ -r $list1 ]]
    then
        while read length
        do
            totsum=0
            words=0
            avg=0
            words="$(echo "$length" |  wc -w)"
            originset="$(echo $length | cut -d' ' -f1)"
            for((j=2; j <= "$words"; j++))
            do
                hold1="$(echo $length | cut -d' ' -f"$j")"
                totsum=$(($totsum+$hold1))       
            done
            avg=$(($totsum/$(($words-1))))
            if (($avg > $topavg))
            then
               topavg=$avg 
            fi
            echo "Average temperature for time $originset was $avg C."   
        done < <( tail -n+2 "$1" )
    else
        echo "Error: $list1 is not a readable file."
        printf "\n"
        exit 2
    fi
    printf "\n";
exit 0
