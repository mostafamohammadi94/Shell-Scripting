#!/bin/bash
#Server Reachabilty test!
#using 'sshpass' to gave password to 'scp'
#$1 is host. $2 is user. $3 is password.

ping -c 2 $2 >> /dev/null

if [ $? = 0 ]
then
	sshpass -p $3 scp /etc/passwd $2@$1:/home/$USER
	echo "successfully done!"
fi
:
