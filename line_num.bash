#! /bin/bash
# $Author: ee364g20 $
# $Date: 2017-01-15 15:11:04 -0500 (Sun, 15 Jan 2017) $

list=$@
i=1
list=$1
length=0

if [[ -f $list ]] && [[ -r $list  ]]
then
    while read -r length && [[ -n $list ]]
    do
        printf "%d:" $i
        echo "$length"
        ((i++))
    done < $1 
else
    printf "cannot read $list\n"
fi






