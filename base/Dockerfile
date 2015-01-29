FROM ubuntu:14.04
MAINTAINER gijs@pythonic.nl

ENV DEBIAN_FRONTEND noninteractive

# enable universe, multiverse, restricted with world wide mirrors
ADD apt.sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y software-properties-common python-software-properties

## add radioastro PPA
RUN add-apt-repository -y ppa:radio-astro/main
RUN apt-get update

## cleanup package cache
RUN apt-get clean

# make sure child images have latest deb package cache
ONBUILD RUN apt-get update
