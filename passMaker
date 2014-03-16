if [ -f /usr/bin/makepasswd ]; then 
for i in {1..10}; do makepasswd --minchars 8  --maxchars 24; done
else
  echo "Installing makepasswd..."
    sleep 2
        sudo apt-get install makepasswd -y 
  for i in {1..10}; do makepasswd --minchars 8  --maxchars 24; done
fi   

