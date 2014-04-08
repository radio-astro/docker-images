#!/bin/bash -ve

export DEBIAN_FRONTEND=noninteractive

# make sure we have all ubuntu repositories
sudo cp /vagrant/conf/apt.sources.list /etc/apt/sources.list


## install ubuntu packages
sudo apt-get update
cat /vagrant/conf/debian_packages | xargs apt-get install -y
sudo apt-get upgrade -y

# add the SKA-SA launchpad PPA
sudo add-apt-repository ppa:ska-sa/main
sudo apt-get update

# install all python modules
sudo pip install -r /vagrant/conf/python_packages

###
###
### to install the stable packages
###
###
cat /vagrant/conf/ska_packages | xargs sudo apt-get install -y

##
##
## OR to build everything from source
##
##
#/vagrant/scripts/build.sh


# configure a ipython noteboot service
sudo cp /vagrant/conf/supervisord-vagrant.conf /etc/supervisor/conf.d/ipython.conf
sudo service supervisor stop
sudo service supervisor start



