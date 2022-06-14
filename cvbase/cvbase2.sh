#!/usr/bin/bash

# usage 
echo "convert a number(demical, hex, ......) to binary number(base2)"
echo "usage: cvbase2 DestBase(h/hex/d/dem/..) number1 nunmber2 ....... "
echo ""
c=`expr $# - 1`
echo " all $c number(s)"
echo ""
case $1 in 
		h|hex)
			jug=h
			;;
		d|dem)
			jug=d
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
				bin=$( echo "obase=2; ibase=16; $num" | bc );
				echo "$num		$bin"
		elif [  "$jug" == "d" ]
		then
				bin=$( echo "obase=2; ibase=10; $num" | bc );
                echo "$num		$bin"
		fi
done

echo ""
echo " all done " 

