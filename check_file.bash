#! /bin/bash
# $Author: ee364g20 $
# $Date: 2017-01-15 15:07:35 -0500 (Sun, 15 Jan 2017) $

list=$@
i=1
list=$1
length=0

if [[ -e $list ]] 
then
    printf "$list exists\n"
else
    printf "$list does not exist\n"
fi
if [[ -d $list ]]
then
    printf "$list is a directory\n"
else
    printf "$list is not a directory\n"
fi
if [[ -f $list ]]
then
    printf "$list is an ordinary file\n"
else
    printf "$list is not an ordinary file\n"
fi
if [[ -r $list ]]
then
    printf "$list is readable\n"
else
    printf "$list is not readable\n"
fi
if [[ -w $list ]]
then
    printf "$list is writable\n"
else
    printf "$list is not writable\n"
fi
if [[ -x $list ]]
then
    printf "$list is executable\n"
else
    printf "$list is not executable\n"
fi

