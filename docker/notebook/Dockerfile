FROM gijzelaerr/papino

ADD debian_packages /
ADD ska_packages /
ADD python_packages /

# install standard debian packages
RUN cat /debian_packages | xargs apt-get install -y

# installed the packaged software from the PPA
RUN cat /ska_packages | xargs apt-get install -y

# install all python modules
RUN pip install astropy  ## pip dependency management doesn't work properly
RUN pip install -r /python_packages

## Expose the SSH and ipython notebook port
EXPOSE 8888

## Run supervisord
CMD /usr/bin/python /usr/local/bin/ipython notebook --ip=* --MappingKernelManager.time_to_dead=10 --MappingKernelManager.first_beat=3 --notebook-dir=/notebooks --pylab inline

