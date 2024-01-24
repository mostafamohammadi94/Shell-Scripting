#/bin/bash
#this programs cut fileds on /etc/passwd 


OUTPUT=/home/mostafa/Practice/test06_`date +%Y%m%d`_`echo $HOSTNAME`.log
cut -d":" -f1,3 /etc/passwd >> $OUTPUT

find /home/mostafa/Practice -name "test06*.log" -mtime +2 -exec rm {} \;



