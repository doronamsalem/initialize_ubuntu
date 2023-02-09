#!/bin/bash
#must be in the same dir with bash_shortcuts.sh

#convert last string from clipbord to seconed layout
englett=(z " " x c v b n m , . a s d f g h j k l ';' q w e r t y u i o p)
heblett=(ז " " ס ב ה נ מ צ ת ץ ש ד ג כ ע י ח ל ך ף / ׳ ק ר א ט ו ן ם פ)
wrongStr=`xclip -selection c -o`
 # find wrong layout
english=3
for (( i=0 ; i<${#wrongStr}; i++ )) do
	if [[ "${wrongStr:i:1}" =~ [a-z] || "${wrongStr:i:1}" =~ [A-Z] ]]; then
		english=1
		wrongStr=$(echo $wrongStr | tr '[:upper:]' '[:lower:]')
		`setxkbmap il,us`
		break
	elif [[ "${wrongStr:i:1}" =~ [א-ת] ]]; then
		english=0
		`setxkbmap us,il`
		break
	fi
done
#fix wrong string
for (( i=0 ; i<${#wrongStr} ; i++ )) do
	if [[ $english == 1 ]]; then
    		for (( x=0 ; x<${#englett[@]}; ind = ++x )) do    #find char index
			if [[ "${wrongStr:i:1}" == "${englett[$x]}" ]]; then
				break
    	    		fi
    		done
                				 #ind=$(${englett[@]/${wrongStr:i:1}/1} | cut -d1 -f1 | wc -w | tr -d ' ' )  find char index  מה לא בסדר
	        if [[ $x == ${#englett[@]} ]]; then #not a letter
        		correctStr=$correctStr${wrongStr:i:1}
       	 	else
        		correctStr=$correctStr${heblett[$ind]}
        	fi

	elif [[ $english == 0 ]]; then
		for (( x=0 ; x<=${#englett[@]}; ind = ++x )) do    #find char index
                        if [[ "${wrongStr:i:1}" == "${heblett[$x]}" ]]; then
                                ind=$x
                                break
                        fi
                done
        	if [[ $x == ${#englett[@]} ]]; then
        		correctStr=$correctStr${wrongStr:i:1}
        	else
        		correctStr=$correctStr${englett[$ind]}
        	fi
    	else
	echo "Neutral layout"

	fi
done
 echo $correctStr
