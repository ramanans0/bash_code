#! /bin/bash
# $Author: ee364g20 $
# $Date: 2017-01-15 16:09:07 -0500 (Sun, 15 Jan 2017) $

count=$#
list=$@
i=0
list=$1
real=0
for((i=0;i<count;i++))
do
    list=$1
    if [[ -f $list ]] && [[ -r $list  ]]
    then
        printf "File %s " $list
        printf "is readable!\n"
    else
        touch $list
    fi
    shift
done

