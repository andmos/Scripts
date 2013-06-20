#! /bin/bash 
# Installs all the Ruby - packages as well as rails. 
# Written 05.06.2013

echo "Installing Ruby..." 
sudo apt-get update 
sudo apt-get install curl
\curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm requirements
sudo apt-get --no-install-recommends install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev libgdbm-dev ncurses-dev automake libtool bison subversion pkg-config libffi-dev
echo "packages installed, now for the good stuff.."
rvm install 1.9.3
rvm use 1.9.3 --default
rvm rubygems current
gem install rails
