About
======

This repository contains the build files for various docker images.
You don't need this repository to use these images, you can download
them from the docker hub. But feel free to base your Dockerfile the.
files in this reposity.

You can request new images by opening a new issue in this github repository.

base
----

A basic Ubuntu image with the radio-astro PPA repository enabled.

usage: `$ docker run radioastro/base <cmd>`

https://registry.hub.docker.com/u/radioastro/base/


lofar
----

A base radio-astro container with the LOFAR user software installed

usage: `$ docker run radioastro/lofar <cmd>`

https://registry.hub.docker.com/u/radioastro/lofar/

