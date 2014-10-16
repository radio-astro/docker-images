About
======

Papino is a springboard for radio astronomy software. It is an umbrella
project for:

 * the Debian packages in the SKA-SA launchpad PPA
   https://launchpad.net/~ska-sa/+archive/ubuntu/main

 * Various docker build files which contain various
   radio astronomical software packages


Installing packages on Ubuntu 14.04
===================================

enable the SKA-SA PPA run:

```shell
sudo apt-get update
sudo apt-get install -y python-software-properties software-properties-common
sudo add-apt-repository ppa:ska-sa/main
 sudo apt-get update
 ```

Now to install MeqTrees (and other useful packages) run:
```shell
sudo apt-get install meqtrees lwimager lofar
```

Docker images
=============

This repository contains the build files for various docker images.
You don't need this repository to use these images, you can download
them from the docker hub. But feel free to base your Dockerfile the.
files in this reposity.

papino
------

A basic Ubuntu image with the ska-sa PPA repository enabled.

usage: `$ docker run gijzelaerr/papino <cmd>`

https://registry.hub.docker.com/u/gijzelaerr/papino/


meqtrees
--------

A papino image with meqtrees installed

usage: `$ docker run gijzelaerr/papino-meqtrees <cmd>`

https://registry.hub.docker.com/u/gijzelaerr/papino-meqtrees/


meqtrees nightly build
-----------------------

A papino image with the nightly build of all meqtrees related software

usage: `$ docker run gijzelaerr/papino-meqtrees-build <cmd>`

https://registry.hub.docker.com/u/gijzelaerr/papino-meqtrees-build/


Getting involved
================

There is a google group available for discussion and announcements:

https://groups.google.com/forum/#!forum/papino-discussion

If you have a problem with a package or want to see a package added to the repository please open a issue on the issue tracker.


What is a Papino?
=================

A Papino is a small papaya.


Credits
=======

Gijs Molenaar - http://pythonic.nl
