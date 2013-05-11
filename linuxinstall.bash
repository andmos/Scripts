#! /bin/bash
# Installs all the tools for a new Linux - computer, server or desktop. Must be Debian - based. 
# Written by Andreas Mosti, based on script from eg1l 
# Warning: The zsh - configs works badly in OS X... 
# V1.2: Added OS - detection to avoid errors while running   
# V1.2.1: Bugfix 
# V1.2: Added zsh - configurator from TJuberg, bad fit with OS X  

if [[ "$(uname)" != "Linux" ]]
then 
	echo "Wrong OS!!"
	sleep 1
	exit
fi 

echo -n "Is this a new server?(y/n)"
read  svar 

if [[ $svar == "y" ]]
then
 	programs="build-essential vim tor nmap ssh curl irssi fail2ban apg smbclient htop git hydra zsh make traceroute mosh screen
    smbfs mailutils python-dev"
	
	echo "Server install"
	sleep 2
    
    echo "Do you need DNS on the server? (Bind)(y/n)"
    read dns 
if [[ $dns == "y" ]] 
then 
    sudo apt-get install -y bind9
else 
    echo "No DNS." 
    sleep 2
fi

else
	programs="build-essential vim tor nmap ssh curl irssi fail2ban apg smbclient htop git zsh transmission gedit texlive gedit-latex-plugin
    thunderbird vlc hydra p7zip-full texmaker make openjdk-7-jdk unetbootin traceroute mosh awesome screen guake sshguard python-dev"
	
	echo "Desktop install"
	sleep 2 

fi
  
function install() {

sudo apt-get install -y $1
	
	}
	

echo "Installing programs.."
sleep 2

sudo apt-get update
sudo apt-get upgrade -y 

for tool in $programs
do
	install $tool
done

echo "Install Complete."
sleep 2

echo "Do you want zsh and vim - config?(y/n)"
read input 

if [[ $input == "y" ]] 
then
    cd; git clone git://github.com/TJuberg/dotfiles.git; ln -s dotfiles/dot.zshrc .zshrc; cp Dropbox/Scripts/.vimrc .; #Dirty fix
    echo "zsh and vim configurated!"
    sleep 2

else 
    echo "No zsh configured."
    sleep 2

fi

echo "Done!"
