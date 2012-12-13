#! /bin/bash 
# Script for making a SSH tunel, if VPN is no option.
# By Andreas Mosti
# V1.2 : Addet default port 8080

echo "skriv inn destinasjonstjener"
read  destinasjon 
echo "skriv inn bruker" 
read  bruker
echo "skriv inn ønsket mål"
read  maal 
echo "skriv inn ønsket port" 
read  port 

sudo ssh $bruker@$destinasjon -L $port:$maal:$port -N 


