FROM ubuntu
MAINTAINER gijs@pythonic.nl

ADD docker/requirements.txt /requirements.txt

# make sure we have all repo's
RUN echo "deb http://za.archive.ubuntu.com/ubuntu/ precise main universe multiverse" > /etc/apt/sources.list

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

ENV MEQTREES_CATTERY_PATH /usr/lib/python2.7/dist-packages/Cattery/

# run and expose a ipython notebook
EXPOSE 8888
CMD ipython notebook --ip=* \
 --MappingKernelManager.time_to_dead=10 \
 --MappingKernelManager.first_beat=3 --notebook-dir=/notebooks

