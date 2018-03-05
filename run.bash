#! /bin/bash
# $Author: ee364g20 $
# $Date: 2017-01-22 21:43:09 -0500 (Sun, 22 Jan 2017) $

length1=0
length2=0
takeac=0
set1="a"
set2="i"
inputfile=$1
outputfile=$2
slot=0
maxspeed=1000000000
argnum=$#
#$gcc "$1" -o quicksim
$gcc "$1" -o -Wall -o3 -oFile.o -cFile.c 2>/dev/null quicksim
if ((argnum > 1))
then
for (( i=1; i <= 32; i=$(($i*2)) ))
do
    for (( j=1; j <= 16; j=$(($j*2)) ))
    do
        hold1=0
        hold2=0
        hold3=0
        hold4=0
        hold5=0
        held1=0
        held2=0
        held3=0
        held4=0
        held5=0
        length1=" $(quicksim $i $j $set1)"
        length2=" $(quicksim $i $j $set2)"
        if [[ -e $2 ]]&& (($slot == 0))
        then
            slot=1
            read -p "$2 exists. Would you like to delete it? (y/n):  " </dev/tty takeac
            if [[ $takeac == "y" ]]
            then
                rm "$outputfile"
                exec >>"$outputfile"
            elif [[ $takeac == "n" ]]
            then
                read -p "Enter a new filename: " </dev/tty outputfile
                exec >>"$outputfile"
            fi
        else
            exec >>"$outputfile"
        fi
        hold1="$(echo $length1 | cut -d':' -f2)"
        hold2="$(echo $length1 | cut -d':' -f4)"
        hold3="$(echo $length1 | cut -d':' -f6)"
        hold4="$(echo $length1 | cut -d':' -f8)"
        hold5="$(echo $length1 | cut -d':' -f10)"

        held1="$(echo $length2 | cut -d':' -f2)"
        held2="$(echo $length2 | cut -d':' -f4)"
        held3="$(echo $length2 | cut -d':' -f6)"
        held4="$(echo $length2 | cut -d':' -f8)"
        held5="$(echo $length2 | cut -d':' -f10)"

        if (($hold5 < $held5))
        then
            if (($hold5 < $maxspeed))
            then
                  max1=$hold1
                  max2=$hold2
                  max3=$hold3
                  max4=$hold4
                  maxspeed=$hold5
            fi
        else
            if (($held5 < $maxspeed))
            then
                max1=$held1
                max2=$held2
                max3=$held3
                max4=$held4
                maxspeed=$held5
            fi
        fi
        echo "$hold1:$hold2:$hold3:$hold4:$hold5" >>$outputfile
        echo "$held1:$held2:$held3:$held4:$held5" >>$outputfile

        #echo "$length1" >>$2
        #echo "$length2" >>$2
    done
done

echo "Fastest run time achieved by $max1 with cache size $max2 and issue width $max3 was $maxspeed">>/dev/tty
fi

exit 0
