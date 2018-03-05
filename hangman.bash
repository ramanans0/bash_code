#! /bin/bash

#---------------------------------------
# $Author: ee364g20 $
# $Date: 2017-01-25 17:03:04 -0500 (Wed, 25 Jan 2017) $
#---------------------------------------

# Do not modify above this line.
    randval=$(( $RANDOM % 3 ))
    case $randval in

        0) gameword=(s e s q u i p e d a l i a n)
            doneword="sesquipedalian"
        ;;
    # The variable $foo gets set to '?' when an invalid option is supplied.
    1) gameword=(p a r s i m o n i o u s)
        doneword="parsimonious"
        ;;

        # Default case
        2) gameword=(b a n a n a)
        doneword="banana"
        ;;

    esac
    gameover=0
    i=0
    letcheck=0
    words=${#gameword[*]}
    echo "Your word is $words letters long."
    answer=("$words" foo "$words")
    for((i=0; i < $words; i++))
    do
        answer[i]="."
    done
    dotcount=0
   while ((gameover==0))
   do
       letcheck=0
        dotcount=0
        echo "Word is: ${answer[*]}"
        read -p "Make a guess: " </dev/tty takeac
        for((i=0; i < $words; i++))
        do
            if [[ $takeac = ${gameword[i]} ]] && [[ $takeac != ${answer[i]} ]]
            then
                answer[i]="$takeac"
                letcheck=1
            fi
            if [[ "${answer[i]}" == "."  ]]
            then
                dotcount=$(($dotcount+1))
            fi
        done

        if (($letcheck == 1))
        then
            printf "\nGood going! " 
        else
            printf "\nSorry, try again. "
        fi
        if (($dotcount == 0))
        then
            printf "\nCongratulations! You guessed the word: $doneword \n"
            exit 0
        fi 






   done

    
