#!/bin/bash

echo "Enter 20 numbers: "
read -a numbers

largest=${numbers[0]}
smallest=${numbers[0]}

for i in "${numbers[@]}"
do
    if [[ "$i" -gt "$largest" ]]; then
        largest="$i"
    fi

    if [[ "$i" -lt "$smallest" ]]; then
        smallest="$i"
    fi
done

echo "The largest number is **$largest**."
echo "The smallest number is **$smallest**."


