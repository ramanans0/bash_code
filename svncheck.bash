#!/bin/bash
# $Author: ee364g20 $
# $Date: 2017-01-15 22:12:12 -0500 (Sun, 15 Jan 2017) $

list=$@
i=1
list=$1
length=0
exe=0
svnset=0
svncheck=0

if [[ -f $list ]] && [[ -r $list  ]]
then
    while read -r length && [[ -n $list ]]
    do
        svnset=0
        svncheck=$(svn status $length | cut -d' ' -f1)
        if [[ "$svncheck" == "?" ]]
        then
            svnset=0
        else
            svnset=1
        fi
        exe=0
        if [[ -e $length ]]
        then    
            if [[ -x $length ]]
            then
                exe=1
            fi

            if ((exe == 0))
            then
                read -p "Would you like to make $length executable? (y/n):  " </dev/tty takeac
                if [[ $takeac == "y" ]]
                then
                    if (($svnset == 1))
                    then
                        svn propset svn:executable ON $length
                    elif (($svnset == 0))
                    then
                        chmod +x $length
                    fi
                fi
                svn add $length     
            fi
        else
            if ((svnset == 0))
            then
                printf "Error: File $length appears to not exist here or in svn\n"
            fi
        fi
    done < "$1"
    echo "Auto-committing code"
    svn commit

else
    printf "Error: File $list does not seem to exist\n"
fi
