About
======

This repository contains the build files for various docker images.
You don't need this repository to use these images, you can download
them from the docker hub. But feel free to base your Dockerfile the.
files in this reposity.

You can request new images by opening a new issue in this github repository.

What is docker
==============

Docker is an open platform for developers and sysadmins to build, ship, and run distributed applications, whether on laptops, data center VMs, or the cloud.

https://www.docker.com/


The radio astronomy docker images
=================================

base
----

A basic Ubuntu image with the radio-astro PPA repository enabled.

usage: `$ docker run radioastro/base <cmd>`

**note**: you can use this image as a base for your custom image. Just put `FROM: radioastro/base` as the first line in your `Dockerfile`.

https://registry.hub.docker.com/u/radioastro/base/


lofar
-----

A base radio-astro container with the LOFAR user software installed

usage: `$ docker run radioastro/lofar <cmd>`

https://registry.hub.docker.com/u/radioastro/lofar/


pyimager
--------

A base radio-astro container with pyimager installed

usage: `$ docker run radioastro/pyimager <cmd>`

https://registry.hub.docker.com/u/radioastro/pyimager/



meqtrees
--------

A base radio-astro container with the meqtrees software installed

usage: `$ docker run radioastro/meqtrees <cmd>`

https://registry.hub.docker.com/u/radioastro/meqtrees/


meqtrees-nightly
----------------

A base radio-astro container with the nightly build of all meqtrees software

usage: `$ docker run radioastro/meqtrees-nightly <cmd>`

https://registry.hub.docker.com/u/radioastro/meqtrees-nightly/



Running meqtrees browser using docker images on OSX
===================================================


install boot2docker, socat and xquart
-------------------------------------

You can do this with home-brew and cask:

 * http://caskroom.io/
 * http://brew.sh/

```
$ brew cask install xquartz
$ brew install socat boot2docker
```

Bring the boot2docker virtual machine up
----------------------------------------

```
$ boot2docker up
$ `boot2docker shellinit`
```

Get calibratin
==============

````
$ socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
$ docker run -e DISPLAY=192.168.59.3:0 radioastro/meqtrees /usr/bin/meqbrowser.py
````
