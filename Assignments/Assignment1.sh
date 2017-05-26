#!/bin/bash
cd Desktop;
#rm -r maulikr-CMSC6950-A1;
mkdir maulikr-CMSC6950-A1;
cd maulikr-CMSC6950-A1;
rm -f "numbers.dat"

if [ "$#" -ne 3 ]; then
    echo "less than 3 arguments provided. exitting."
	exit 1
fi
((var1=$1))
((var2=$2))
((var3=$3))
echo $var1
for i in $(seq $var1 $var2)
do
	var=$((i*var3-var3+1))
	if [ $var -gt $var2 ]; then
		break;
	fi
	echo $var>>"numbers.dat"
done

mkdir DIVIDE-BY-7;
cd DIVIDE-BY-7
unlink "numbers_link.dat"
ln -s ../numbers.dat numbers_link.dat
rm -f "divisible_by_7.dat"

cat  numbers_link.dat | while read j
do
if [ $(($j%7)) -eq 0 ]; then
  echo $j>>divisible_by_7.dat
fi
done
