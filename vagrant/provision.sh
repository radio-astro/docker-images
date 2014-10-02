#!/bin/bash -ve

export DEBIAN_FRONTEND=noninteractive

# make sure we have all ubuntu repositories
sudo cp /vagrant/apt.sources.list /etc/apt/sources.list


## install ubuntu packages
sudo -E apt-get update -q
cat /vagrant/debian_packages | xargs sudo -E apt-get install -y -q
sudo -E apt-get upgrade -y -q

# add the SKA-SA launchpad PPA
sudo -E add-apt-repository --yes ppa:ska-sa/main
sudo -E apt-get update -q

# install all python modules
sudo rm -rf /tmp/pip_build_root/*  ## cleanup any failed builds
sudo pip install astropy ## pip dependency management doesn't work properly
sudo pip install -r /vagrant/python_packages

cat /vagrant/conf/ska_packages | xargs sudo -E apt-get install -y -q

# configure a ipython noteboot service
sudo cp /vagrant/supervisord.conf /etc/supervisor/conf.d/ipython.conf
sudo service supervisor stop
sudo service supervisor start



