FROM radioastro/base

ADD debian_packages /
ADD python_packages /

# install debian packages
RUN cat /debian_packages | xargs apt-get -qy install

# install all python modules
RUN pip install -r /python_packages

# cleanup
RUN apt-get -qy clean

## Expose the ipython notebook port
EXPOSE 8888

## location of the Ipython notebooks.
VOLUME /notebooks

## Run ipython notebook
CMD /usr/bin/python /usr/local/bin/ipython notebook --ip=* --MappingKernelManager.time_to_dead=10 --MappingKernelManager.first_beat=3 --notebook-dir=/notebooks --pylab inline


