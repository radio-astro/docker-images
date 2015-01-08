FROM radioastro/base

# install standard debian packages
ADD debian_packages /
RUN apt-get update
RUN cat /debian_packages | xargs apt-get install -y

# build everything
VOLUME /build
ADD build.sh /
RUN /build.sh

