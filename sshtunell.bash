#! /bin/bash

echo "Skriv inn ønsket mål" 
read maal
echo "Skriv inn ønsket port"
read port
echo "Skriv inn brukernavn"
read brukernavn

ssh -D $port -C $brukernavn@$maal 
