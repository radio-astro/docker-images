FROM radioastro/base

# make sure we have the source deb repo
RUN add-apt-repository -ys ppa:radio-astro/main
RUN apt-get update

# install standard debian packages
ADD debian_packages /
RUN cat /debian_packages | xargs apt-get install -y

# build everything
VOLUME /build
ADD build.sh /
RUN /build.sh

