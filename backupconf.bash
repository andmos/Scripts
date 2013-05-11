#! /bin/bash
# Takes backup of *.conf files in /etc/ 


hostname=$(hostname -s) 

if [ ! -d ~/Dropbox/BackupConf/$hostname/ ]
then 
    mkdir ~/Dropbox/BackupConf/$hostname/ 
    echo "Making backup directory"
else 
    echo "Copying files to $hostname -folder" 
fi

for conf in /etc/*
do
   sudo cp -r $conf ~/Dropbox/BackupConf/$hostname/
done
echo "Backup complete" 
