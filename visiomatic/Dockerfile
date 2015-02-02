FROM radioastro/base

ENV FILESYSTEM_PREFIX /images
ENV LOGFILE /iipsrv.log
ENV VERBOSITY 6

RUN apt-get update -qy
RUN apt-get install -qy iipsrv-astro

EXPOSE 80

VOLUME /images

CMD /usr/lib/iipsrv-astro/iipsrv-astro.fcgi --bind 0.0.0.0:80
