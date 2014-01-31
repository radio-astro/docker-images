FROM ubuntu
MAINTAINER gijs@pythonic.nl
VOLUME ["/data"]

ADD docker/requirements.txt requirements.txt

# make sure we have all repo's
RUN cat >/etc/apt/sources.list <<EOL
deb http://za.archive.ubuntu.com/ubuntu/ precise main universe multiverse
deb http://za.archive.ubuntu.com/ubuntu/ precise-updates main universe multiverse
deb http://security.ubuntu.com/ubuntu precise-security main universe multiverse
EOL

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
RUN pip install -r requirements.txt

# run and expose a ipython notebook
CMD /usr/local/bin/ipython notebook --ip=0.0.0.0
EXPOSE 8888

