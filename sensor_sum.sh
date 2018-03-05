#!/bin/bash
# $Author: ee364g20 $
# $Date: 2017-01-15 21:06:57 -0500 (Sun, 15 Jan 2017) $

list=$@
i=1
list=$1
length=0
hold=0
originset=0

if [[ -f $list ]] && [[ -r $list  ]]
then
     while read -r length && [[ -n $list ]]
    do
       #echo $length |
       originset="$(echo $length | cut -d'-' -f1)"
       hold1="$(echo $length | cut -d' ' -f2)" 
       hold2="$(echo $length | cut -d' ' -f3)"
       hold3="$(echo $length | cut -d' ' -f4)"
       hold=$(($hold1 + $hold2 + $hold3))

       echo "$originset $hold"
    done < $1
else
    echo "error: $list is not a readable file!"
fi

