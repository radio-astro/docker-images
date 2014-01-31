#!/bin/sh

# make sure we have all ubuntu repositories
sudo cat >/etc/apt/sources.list <<EOL
deb http://za.archive.ubuntu.com/ubuntu/ precise main universe multiverse
deb http://za.archive.ubuntu.com/ubuntu/ precise-updates main universe multiverse
deb http://security.ubuntu.com/ubuntu precise-security main universe multiverse
EOL

# install software from ubuntu repositories
sudo apt-get update
sudo apt-get install -y software-properties-common python-software-properties \
    python-pip libzmq-dev python2.7-dev build-essential supervisor

# add the SKA-SA launchpad PPA
sudo add-apt-repository ppa:ska-sa/main
sudo apt-get update

# install the radio astro software from the SKA repo
sudo apt-get install -y libcasacore-dev \
    casacore-data lwimager python-astlib python-kittens \
    python-purr python-pyxis python-tigger \
    python-meqtrees-timba python-meqtrees-cattery makems python-owlcat 

# install all python modules
sudo pip install -r /vagrant/vagrant/requirements.txt

# configure a ipython noteboot service
sudo cp /vagrant/vagrant/supervisor-ipython.conf /etc/supervisor/conf.d/ipython.conf
sudo service supervisor stop
sudo service supervisor start



