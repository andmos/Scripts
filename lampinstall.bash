#! /bin/bash
# Installs the basics for a LAMP - server. 

if [[ "$(uname)" != "Linux" ]]; then
    echo "Wrong OS"
    exit 1 
fi

programs="apache2 mysql-server php5" 

function install() {
   sudo apt-get install -y $1
}

echo "Installing LAMP - essentials.."
sleep 2

sudo apt-get update > /dev/null 2>&1 
sudo apt-get upgrade -y > /dev/null 2>&1 

for tool in $programs
do; echo "Current package: $tool" ; install $tool > /dev/null 2>&1 ;done ; echo "Install complete." 
sleep 2 
