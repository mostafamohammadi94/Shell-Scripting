#!/bin/bash
#This program calculate Average between 5 numbers

sum=0
for (( i=1;i<=5;i++ ))
do
	read -p "Enter $i number: " var1
	sum=$[$sum+$var1]
	avg=$[$sum/$i]

done

#i=$i echo "$i"

#avg=$[$sum/$i]

echo "Average number is: $avg" 

#End


