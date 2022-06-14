#!/usr/bin/bash

# usage 
echo "convert a number(binary, demical, ......) to hex number(base16)"
echo "usage: cvbaseh DestBase(b/bin/d/dem/..) number1 nunmber2 ....... "
echo ""
c=`expr $# - 1`
echo " all $c number(s)"
echo ""
case $1 in 
		d|dem)
			jug=d
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
		if [ "$jug" == "d" ]
		then
				bin=$( echo "obase=16; ibase=10; $num" | bc );
				echo "$num		$bin"
		elif [  "$jug" == "b" ]
		then
				bin=$( echo "obase=16; ibase=2; $num" | bc );
                echo "$num		$bin"
		fi
done

echo ""
echo " all done " 

