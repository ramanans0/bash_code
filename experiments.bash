#! /bin/bash

#---------------------------------------
# $Author: ee364g20 $
# $Date: 2017-01-18 15:58:05 -0500 (Wed, 18 Jan 2017) $
#---------------------------------------

# Do not modify above this line.

# $Author: ee364g20 $
# $Date: 2017-01-18 15:58:05 -0500 (Wed, 18 Jan 2017) $

i=1
length=0
hold=0
originset=0
avg=0

for arg in $@
do      
  echo "$arg:"  
    if [[ -f $arg ]] && [[ -r $arg  ]]
    then
        while read -r length && [[ -n $arg ]]
        do
        #echo $length |
            originset="$(echo $length | cut -d' ' -f1)"
            hold1="$(echo $length | cut -d' ' -f2)" 
            hold2="$(echo $length | cut -d' ' -f3)"
            hold3="$(echo $length | cut -d' ' -f4)"
            hold=$(($hold1 + $hold2 + $hold3))
            avg=$(($hold/3))
            echo "$originset $hold $avg"
        done < $arg
    else
        echo "Filename \"$arg\" is not readable."
    fi
    printf "\n";
done
