#! /bin/bash

#---------------------------------------
# $Author: ee364g20 $
# $Date: 2017-01-25 16:18:47 -0500 (Wed, 25 Jan 2017) $
#---------------------------------------

# Do not modify above this line.

while getopts f:o:-: foo
do

    case $foo in

    f) if [[ -e $OPTARG ]] && [[ -r $OPTARG  ]]
        then
           input=$OPTARG 
        else
            echo "Input file $OPTARG is not readable."
            exit 2
        fi
        ;; #This means break

    o) output=$OPTARG
        ;;

    -) 
        hold="$(echo $OPTARG | cut -d'=' -f2)"
        
        ;;
    # The variable $foo gets set to '?' when an invalid option is supplied.
    \?) echo "Invalid option."
        ;;

        # Default case
    *) echo "Default case."
        ;;

    esac
     
done
check=0
totval=0
while read length
        do
            words=0

            words="$(echo "$length" |  wc -w)"
            if (( $hold <= $words )) && (( $check == 0  ))
            then
                echo "Sorting rows by column #$hold."
                check=1
            elif (( $hold > $words )) && (( $check == 0  ))
            then
                echo "Error: Invalid column number."
                exit 2
            fi

            
            sort -n -k"$hold" "$input" > "$output"        

done < $input

