FROM gijzelaerr/papino

# install standard debian packages
ADD debian_packages /
RUN cat /debian_packages | xargs apt-get install -y

# build everything
VOLUME /build
ADD build.sh /
RUN /build.sh

