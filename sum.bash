#! /bin/bash
#$Author: ee364g20 $
#$Date: 2017-01-14 17:15:00 -0500 (Sat, 14 Jan 2017) $
#$HeadURL: svn+ssh://ece364sv@ecegrid-thin1/home/ecegrid/a/ece364sv/svn/S17/students/ee364g20/Prelab01/sum.bash $

count=$#
list=$@
i=0
sum=0
num=0
list=$1
for((i=0;i<count;i++))
do
list=$1
sum=$(($sum+$list))
shift
done
printf "%d\n" $sum

