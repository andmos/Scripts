#! /bin/bash
# By Andreas Mosti 13.02.2013 
# Remember SSH key on target machine
# Incremental backup - after full backup, rsync takes only changed files.

error() {
echo "Backup interrupted!; `date +%T`" >> /Users/$username/Dropbox/Scripts/Backuplog/Backup_`    date +%F`.txt
exit 1
} 

ip=$(dig myip.opendns.com @resolver1.opendns.com +short)
echo "rsync is I/O heavy, this may take some time"
echo "loggfile in Backuplog/" 
sleep 2 

#if [[ $ip != "158.38.48.33" ]]
#then 
#	echo "laptop not @ office, abort."
#	echo $ip
#    sleep 2
#	exit
# fi

echo "Backup started; `date +%T`" >> /Users/$username/Dropbox/Scripts/Backuplog/Backup_`date +%F`.txt
echo "Beginning rsync" 
sleep 3


trap error SIGINT
rsync -avPh --log-file=/Users/$username/Dropbox/Scripts/Backuplog/rsynclog_`date +%F`.txt /Users/$username andreas@afrodite:/media/disk2/


echo "Backup finished;  `date +%T`" >> /Users/$username/Dropbox/Scripts/Backuplog/Backup_`date +%F`.txt
