FROM ubuntu
MAINTAINER gijs@pythonic.nl

# basic system bootstrap
RUN cat >/etc/apt/sources.list <<EOL
deb http://za.archive.ubuntu.com/ubuntu/ precise main universe multiverse
deb http://za.archive.ubuntu.com/ubuntu/ precise-updates main universe multiverse
deb http://security.ubuntu.com/ubuntu precise-security main universe multiverse
EOL
RUN apt-get update

# add SKA-SA PPA
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:ska-sa/main
RUN apt-get update
RUN apt-get install -y pyrap




