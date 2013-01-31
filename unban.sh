#! /bin/bash
echo "IP to unban:"
read $ip 
sudo iptables -D fail2ban-ssh -s $ip -j DROP
