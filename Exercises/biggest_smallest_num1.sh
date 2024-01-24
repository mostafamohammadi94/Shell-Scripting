#!/bin/bash
#This Program is comparing 20 numbers and gives you what number is bigger! 

i=1 #frist number for loops
max=0  #value to compare loops via var1 
min=100000000000
for i in {1..20} 
do
	read -p "Enter $i numeber: " var1
	if [ $var1 -gt $max ]

	then
		max=$var1
	fi
	if [ $var1 -lt $max ]
	then
		min=$var1
	fi
		i=$i+1
done
echo "The max number is : $max"
echo "The min number is : $min"
