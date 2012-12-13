#! /bin/bash
# Remember SSH key on target machine
ip=$(dig myip.opendns.com @resolver1.opendns.com +short)

if [[ $ip != "158.38.48.33" ]]
then 
	echo "laptop ikke på kontoret, avslutter."
	echo $ip
    sleep 2
	exit
fi

echo "Begynner backup" > /Users/andreasmosti/Dropbox/Scripts/Backuplog/Backup_`date +%F_%T`.txt
echo "Begynner rsync" 
sleep 3

rsync -avPh /Users/$username andreas@afrodite:/media/disk2/
echo "Backup fullført" >> /Users/andreasmosti/Dropbox/Scripts/Backuplog/Backup_`date +%F_%T`.txt
