FROM ubuntu
MAINTAINER gijs@pythonic.nl
ENV DEBIAN_FRONTEND noninteractive

ADD supervisord-docker.conf /etc/supervisor/conf.d/docker.conf
ADD conf/apt.sources.list /etc/apt/sources.list
ADD conf/ /conf/
ADD scripts /scripts/

## install ubuntu packages
RUN apt-get update
RUN cat /conf/debian_packages | xargs apt-get install -y

## add SKA-SA PPA
RUN add-apt-repository ppa:ska-sa/main
RUN apt-get update

## Set up the root password for ssh
RUN echo root:ska | chpasswd
RUN mkdir -p /var/run/sshd

## install latest python modules
RUN pip install -r /conf/python_packages

###
###
### to install the stable packages
###
###
RUN cat /conf/ska_packages | xargs apt-get install -y

##
##
## OR to build everything from source
##
##
#RUN /scripts/build.sh


## Expose the SSH port
EXPOSE 22

## expose the ipython notebook port
EXPOSE 8888

## Run supervisord
CMD ["/usr/bin/supervisord"]

