#!/bin/bash

wget -O cA.sh https://web.njit.edu/~yurkowsk/29sept/competitorA
wget -O cB.sh  https://web.njit.edu/~yurkowsk/29sept/competitorB

cat cA.sh cB.sh | grep  "[0-9][0-9][0-9][0-9][0-9][0-9]" |
	cut -d "," -f1,3 | tr , " " | while read customer product ;
do
	echo $customer "buys" $product;
done | sort
