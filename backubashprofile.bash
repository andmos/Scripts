#!/bin/bash
# Makes a backup of the .bash_profile on the system. 
# Written by Andreas Mosti 
# 1.2: Errorfix if .bash_profile doesnt exist. 
# 1.3: Fixed support for bashrc on Linux 
# BUG: Only works as primary user

cd ~ 
if [ -f .bash_profile ] 
then 
	cp -Rf .bash_profile ~/Dropbox/Scripts/Profil/.bash_profile
	echo "bash_profile lagret!" 
else
	echo "bash_profile eksisterer ikke for denne brukeren."
fi 

if [[ $(uname) == "Linux" ]] && [ -f .bashrc ] 
then 
    cp -Rf .bashrc ~/Dropbox/Scripts/Profil/.bashrc
    echo "bashrc lagret!"
else
    echo "bashrc eksisterer ikke for denne brukeren."
fi 
