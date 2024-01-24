#!/bin/bash
#This programs compares any number from 10

read -p "Enter a number: " var1

if [ $var1 -eq 10 ]; then
	echo "$var1 is even to 10"

elif [ $var1 -lt 10 ]; then
	echo "$var1 is less than 10"

else
	echo "$var1 is more than 10"
fi

