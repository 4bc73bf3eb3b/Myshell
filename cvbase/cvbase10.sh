#!/usr/bin/bash

# usage 
echo "convert a number(binary, hex, ......) to demical number(base10)"
echo "usage: cvbase10 DestBase(b/bin/h/hex/..) number1 nunmber2 ....... "
echo ""
c=`expr $# - 1`
echo " all $c number(s)"
echo ""
case $1 in 
		h|hex)
			jug=h
			;;
		b|bin)
			jug=b
			;;
		*)
			echo "error!"
			;;
esac

shift 1

for num in $*
do
		if [ "$jug" == "h" ]
		then
				bin=$( echo "obase=10; ibase=16; $num" | bc );
				echo "$num		$bin"
		elif [  "$jug" == "b" ]
		then
				bin=$( echo "obase=10; ibase=2; $num" | bc );
                echo "$num		$bin"
		fi
done

echo ""
echo " all done " 

