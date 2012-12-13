#!/bin/bash

# Skripter symlinker bash_profile - filene mellom maskiner 
# Andreas Mosti 
# Known error: on Linux systems, .bash_profile must be added to bashrc file 
# Version 1.2 : Fixed error if .bash_profile didnt exist. 
# Version 1.3 : Fixed bashrc - sync for Linux systems Possible bug with symlinc if file exists   

echo "Skifter peker og kopierer fil..." 
cd ~ 
if [ -f .bash_profile ]
then 
	rm .bash_profile; ln -s ~/Dropbox/Scripts/Profil/.bash_profile .bash_profile
	echo "Ferdig."
	read -p "Trykk en tast for å avslutte."
else 
	echo "bash_profile eksisterer ikke, oppretter fra Dropbox.."
	touch .bash_profile; rm .bash_profile; ln -s ~/Dropbox/Scripts/Profil/.bash_profile .bash_profile
	echo "Ferdig."
	read -p "Trykk en tast for å avslutte."
fi

if  [[ $(uname) == "Linux" ]] && [[ -f .bashrc ]] 
then 
    rm .bashrc; ln -s ~/Dropbox/Scripts/Profil/.bashrc .bashrc
    echo "Synkronisert bashrc."
    read -p "Trykk en tast for å avslutte"
elif [[ $(uname) == "Linux" ]]; then
    touch .bashrc; ln -s ~/Dropbox/Scripts/Profil/.bashrc .bashrc
    echo "Bashrc opprettet og symlinket."
    read -p "Trykk en tast for å avslutte"

fi

