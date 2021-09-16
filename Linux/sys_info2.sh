#!/bin/bash

if [$UID -ne 0]
then
	echo "please run this script with sudo"
	exit
fi


SAVE="~/research/sys_info.txt"

mkdir ~/research 2> /dev/null

echo "A Quick System Audit" > $SAVE
date >> $SAVE
echo "" >> $SAVE
echo "Machine Type Info:" >> $SAVE
echo $MACHTYPE >> $SAVE
echo -e "Uname info: $(uname -a) \n" >> $SAVE
echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n" >> $SAVE
echo -e "Hostname: $(hostname -s) \n" >> $SAVE
echo "DNS Servers: " >> $SAVE
cat /etc/resolv.conf >> $SAVE
echo -e "\nMemory Info:" >> $SAVE
free >> $SAVE
echo -e "\nCPU Info:" >> $SAVE
lscpu | grep CPU >> $SAVE
echo -e "\nDisk Usage:" >> $SAVE
df -H | head -2 >> $SAVE
echo -e "\nWho is logged in: \n $(who -a) \n" >> $SAVE
echo -e "\nSUID Files:" >> $SAVE
find / -type f -perm /4000 >> $SAVE
echo -e "\nTop 10 Processes" >> $SAVE
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> $SAVE


