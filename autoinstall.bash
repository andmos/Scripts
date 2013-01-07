#!/bin/bash
# installs some basic things for the Linux - system. 
# this is BAD code, planning to fix EDIT: NOT IN USE ANYMORE. 
# Leaving here as a sign of bad scripting. 
# By Andreas Mosti 

sudo apt-get update 
sudo apt-get upgrade 
sudo apt-get install vim -y 
sudo apt-get install tor -y
sudo apt-get install nmap -y 
sudo apt-get install ssh -y
sudo apt-get install curl -y
sudo apt-get install irssi -y 
sudo add-apt-repository ppa:fredrikt/yubico; sudo apt-get update 
sudo apt-get install libpam-yubico -y 
sudo apt-get install fail2ban -y 
sudo apt-get install apg -y
sudo apt-get install hydra -y 
sudo apt-get install smbclient -y



