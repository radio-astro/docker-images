#!/bin/sh

sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:ska-sa/main
sudo apt-get update
sudo apt-get install -y pyrap
