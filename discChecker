#! /bin/bash 
device=$1
size=$2
image=$3

if [[ $UID != 0 ]]; then
echo "**** FATAL *****"
    echo "Run script as root"
        exit 1
	fi

	if [[ $# != 3 ]]; then
	echo "Usage: $0 'device to test' 'size in Mbytes' 'image file to write'"
	    echo "Example $0 /dev/md0 5000 /mnt/raid/test.img"
	        exit 1
		fi

		echo -e "\n***** dd test *****"
		echo "Testing with dd for read speed, ~$size MBytes flowing from $device to /dev/null"
		dd bs=1M count=$size if=$device of=/dev/null
		echo -e "\nTesting with dd for write speed, writing ~$size MBytes to $image"
		dd count=$size bs=1M if=/dev/zero of=$image
		rm $image

		echo -e "\n***** hdparm test *****"
		hdparm -tT $device

		
