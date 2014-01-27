FROM ubuntu
MAINTAINER gijs@pythonic.nl

# basic system bootstrap
RUN echo "deb http://nl.archive.ubuntu.com/ubuntu/ precise main universe multiverse\ndeb http://nl.archive.ubuntu.com/ubuntu/ precise-updates main universe multiverse\ndeb http://security.ubuntu.com/ubuntu precise-security main universe multiverse" > /etc/apt/sources.list
RUN apt-get update

# add SKA-SA PPA
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ska-sa/main
RUN apt-get update
RUN apt-get install -y pyrap

