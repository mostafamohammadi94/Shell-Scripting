#!/bin/bash
#read IPs from a file and ping them

ip=IP_list.txt
today=`date +%Y%m%d`
output=/home/$USER/Practice/log_`echo $HOSTNAME`_$today.log

while read line 
do
	ping -c 2 $line >> /dev/null
	if [ $? -eq 0 ]
	then
		echo "$line is reachable" >> $output
	else
		echo "$line is NOT reachable" >> $output
	fi
done < $ip
