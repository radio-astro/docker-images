FROM ubuntu
MAINTAINER gijs@pythonic.nl

# remove these debian frontend warnings
#ENV DEBIAN_FRONTEND noninteractive 

ADD docker/requirements.txt /requirements.txt

# make sure we have all repo's
RUN echo "deb http://za.archive.ubuntu.com/ubuntu/ precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update

# install ubuntu packages
RUN apt-get install -y python-pip git build-essential make

# add SKA-SA PPA
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:ska-sa/main
RUN apt-get update
RUN apt-get install -y libcasacore-dev casacore-data python-astlib python-pyrap
RUN apt-get build-dep -y kittens purr pyxis tigger meqtrees-timba meqtrees-cattery owlcat

# install latest python modules
RUN pip install -r /requirements.txt

# other python stuff
RUN apt-get install -y python-matplotlib python-pyfits python-scipy python-qt4 python-qwt5-qt4 time

# get the stuff
RUN mkdir /build
RUN git clone https://github.com/ska-sa/kittens /build/kittens
RUN git clone https://github.com/ska-sa/purr /build/purr
RUN git clone https://github.com/ska-sa/pyxis /build/pyxis
RUN git clone https://github.com/ska-sa/tigger /build/tigger
RUN git clone https://github.com/ska-sa/meqtrees-timba /build/meqtrees-timba
RUN git clone https://github.com/ska-sa/meqtrees-cattery /build/meqtrees-cattery
RUN git clone https://github.com/ska-sa/owlcat /build/owlcat

# build and install the stuff
RUN mkdir /build/meqtrees-timba/build
RUN cd /build/meqtrees-timba/build && cmake .. && make -j && make install
RUN cd build/kittens && python setup.py install
RUN cd /build/purr && python setup.py install
RUN cd /build/pyxis && python setup.py install
RUN cd /build/tigger && python setup.py install
RUN cd /build/meqtrees-cattery && python setup.py install
RUN cd /build/owlcat && python setup.py install


# we need to set this (for now)
ENV MEQTREES_CATTERY_PATH /usr/local/lib/python2.7/dist-packages/Cattery

# run and expose a ipython notebook
EXPOSE 8888
CMD ipython notebook --ip=* \
 --MappingKernelManager.time_to_dead=10 \
 --MappingKernelManager.first_beat=3 --notebook-dir=/notebooks

