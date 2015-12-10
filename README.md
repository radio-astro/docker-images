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

 * https://github.com/radio-astro/docker-base
 * https://registry.hub.docker.com/u/radioastro/base/


casa
----

A docker image containing NRAO's casa. Supports 4.2, 4.3, 4.4 and 4.5


usage: `$ docker run radioastro/casa:4.5`

**note**: This container is very big.

 * https://github.com/radio-astro/docker-base
 * https://registry.hub.docker.com/u/radioastro/base/



Running meqtrees browser using docker images on OSX (depricated)
================================================================


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
