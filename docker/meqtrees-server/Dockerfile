FROM gijzelaerr/papino

ADD supervisord.conf /etc/supervisor/conf.d/docker.conf
ADD debian_packages /
ADD ska_packages /
ADD python_packages /

## Set up the root password for ssh
RUN echo root:ska | chpasswd
RUN mkdir -p /var/run/sshd

# install standard debian packages
RUN cat /debian_packages | xargs apt-get install -y

# installed the packaged software from the PPA
RUN cat /ska_packages | xargs apt-get install -y

# install all python modules
RUN pip install astropy  ## pip dependency management doesn't work properly
RUN pip install -r /python_packages

## Expose the SSH and ipython notebook port
EXPOSE 22
EXPOSE 8888

## Run supervisord
CMD /usr/bin/supervisord -c /etc/supervisor/supervisord.conf

