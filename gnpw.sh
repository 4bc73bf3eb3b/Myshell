#!/usr/bin/bash 


echo "generating your passcode using sha256sum, and you can check the detail in encryption.txt or check this scripts itself."
echo "";
echo "usage: genpw {UniqueName} {SiteName}, output your UsernameOfSite and its password"


sn=$1$2;

origin_pw=`echo -n $sn | sha256sum`

pw=${origin_pw:0:12}

echo $pw
contain_letter=0
contain_number=0
pos=99

for ((i=0; i<${#pw}; i++))
do
		if [[ ${pw:$i:1} =~ ^[0-9]+$ ]]
		then
				contain_number=1;
		fi
		

		if [[ ${pw:$i:1} =~ ^[a-z]+$ ]]
		then
				contain_letter=1;
		fi
done

if [ $contain_number -eq "0" ] 
then
		pw=aa${pw:2}
		echo "Lucky! A hash containing only letters"
fi

if [ $contain_letter -eq "0" ]
then
		pw=1${pw:1}
		echo "Lucky! A hash containing only numbers"

fi

for ((i=0; i<${#pw}; i++))
do
		if [[ ${pw:$i:1} =~ ^[a-z]+$ ]]
		then
			pos=$i;
			break;
		fi
done

pre=${pw:0:$i}
suf=${pw:$i}
suf=${suf^}

## gen password 
pw=$pre$suf*


echo "confirm:"
echo "UniqueName		SiteName"
echo "$1			$2		"


username=${origin_pw:56:4}$1${origin_pw:60:4}

echo "UserName is $username"
echo "Passcode is $pw" 
day=`date`
echo " " >> /d/encryption/record
echo "Time:  $day" >> /d/encryption/record
echo "$1		$2" >> /d/encryption/record
echo "/******This is a dividing line.******/ " >> /d/encryption/record
##

##usage 

##email $name + $ other components
##but only calculate the hash of $name
##password = ${ sha256 $( $name + $sitename ) : 12 }
## eg: sha256 $name$github 
##    the first 12 characters ;
## calculate  a  hash of  a string
## echo -n "string" | sha256

##what if pw need a UPPERCASE letter and special symbol?

##UPPERCASE the first letter and add a * at the end 
##the pw can be 13 characters long 
##so we just put this method to all passwords ;
##so every password should be 13 chararcters long.

##-->
##what if there is no letter in the hash ?
##turn the first number into A
##turn the second number into a
##-->
##what if there is no number in the hash ?
##turn first letter into 1


## how to choose the other components??
## and make not linked? 
## 
