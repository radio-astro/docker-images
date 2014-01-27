#!/bin/sh

sudo cat >/etc/apt/sources.list <<EOL
deb http://za.archive.ubuntu.com/ubuntu/ precise main universe multiverse
deb http://za.archive.ubuntu.com/ubuntu/ precise-updates main universe multiverse
deb http://security.ubuntu.com/ubuntu precise-security main universe multiverse
EOL
sudo apt-get update
sudo apt-get install -y software-properties-common python-software-properties \
    python-pip libzmq-dev python2.7-dev build-essential supervisor
sudo add-apt-repository ppa:ska-sa/main
sudo apt-get update
sudo apt-get install -y pyrap 
sudo pip install -r /vagrant/requirements.txt
sudo cp /vagrant/supervisor-ipython.conf /etc/supervisor/conf.d/ipython.conf
sudo service supervisor stop
sudo service supervisor start

