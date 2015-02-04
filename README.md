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


notebook
--------

A ready to use IPython notebook container with various (radio) astronomy libraries installed.

usage: `$ docker run -tiP radioastro/notebook`

**note**: When using -P you autoconfigure the linked port, find out what is the linked port with `docker ps`. You can also force the port number with `-p <portnumber>:8888`. 

**note 2**: By default the notebooks are stored inside the container in `/notebooks`. You can map a custom folder containing notebooks into the container using `-v`, for example `-v /home/you/notebooks:/notebooks`.

https://registry.hub.docker.com/u/radioastro/notebook/


CyberSKA viewer
---------------

A web based FITS file viewer which you can embed in your web application. Note that you need a pureweb license to use this software.

usage: `$ docker run -d -p 80:80 -p 8080:8080 -v pureweb.lic:opt/CSI/PureWeb/Server/conf/pureweb.lic` /radioastro/cyberska-viewer`

https://registry.hub.docker.com/u/gijzelaerr/cyberska-viewer/

**note**: the docker files are not hosted here but together with the source: https://github.com/radio-astro/cyberska_viewer
