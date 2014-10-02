FROM ubuntu:14.04
MAINTAINER gijs@pythonic.nl

ENV DEBIAN_FRONTEND noninteractive

# enable universe, multiverse, restricted with world wide mirrors
ADD conf/apt.sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y software-properties-common python-software-properties

## add SKA-SA PPA
RUN add-apt-repository ppa:ska-sa/main
RUN apt-get update
