FROM ubuntu
MAINTAINER gijs@pythonic.nl

ADD docker/requirements.txt /requirements.txt

# make sure we have all repo's
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise main universe multiverse" > /etc/apt/sources.list

# install ubuntu packages
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties python-pip

# add SKA-SA PPA
RUN add-apt-repository ppa:ska-sa/main
RUN apt-get update
RUN apt-get install -y libcasacore-dev  casacore-data lwimager python-astlib \
 python-kittens python-purr python-pyxis python-tigger  python-meqtrees-timba \
 python-meqtrees-cattery makems python-owlcat

# install latest python modules
RUN pip install -r /requirements.txt

# mount point
RUN mkdir -p /data
WORKDIR /data

# run and expose a ipython notebook
EXPOSE 8888
CMD ["/usr/local/bin/ipython", "notebook", "--ip=0.0.0.0"]
