#! /bin/bash
# Makes backup of home - directory on mac to chosen server via rsync. Possible rewriting?
echo "Warning: rsync is I/0 heavy and takes a long time"
sleep 3
echo "Choose host to backup to [afrodite][apollo] "
read host 
sleep 1 
echo "Chose path for backup[/.../..]" 
read $path

sudo rsync -avPh /Users/$username/ andreas@$host:$path

