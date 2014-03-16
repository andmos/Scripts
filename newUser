#! /bin/bash
# Creates a user for the system, the hard way. 

useradd $1 -p `mkpasswd x$1x` -G $1 
mkdir /home/$1 
chown $1:$1 /home/$1
cp -a /etc/skel/.[a-z]* /home/$1 
chown $1:$1 /home/$1/.[a-z]* 
