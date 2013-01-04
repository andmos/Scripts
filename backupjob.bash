#! /bin/bash
# Remember SSH key on target machine
# Incremental backup - after full backup, rsync takes only changed files.

ip=$(dig myip.opendns.com @resolver1.opendns.com +short)
echo "rsync is I/O heavy, this may take some time"
echo "loggfile in Backuplog/" 
sleep 2 

if [[ $ip != "158.38.48.33" ]]
then 
	echo "laptop ikke på kontoret, avslutter."
	echo $ip
    sleep 2
	exit
fi

echo "Begynner backup `date +%T`" >> /Users/andreasmosti/Dropbox/Scripts/Backuplog/Backup_`date +%F`.txt
echo "Begynner rsync" 
sleep 3

rsync -avPh /Users/$username andreas@afrodite:/media/disk2/
echo "Backup fullført `date +%T`" >> /Users/andreasmosti/Dropbox/Scripts/Backuplog/Backup_`date +%F`.txt
