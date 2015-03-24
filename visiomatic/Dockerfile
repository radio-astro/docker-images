FROM radioastro/base

ENV FILESYSTEM_PREFIX /images
ENV LOGFILE /iipsrv.log
ENV VERBOSITY 6

RUN apt-get update -qy
RUN apt-get install -qy iipsrv-astro libapache2-mod-fcgid apache2
RUN a2enmod fcgid iipsrv-astro

ADD  iipsrv-astro.conf /etc/apache2/mods-enabled/iipsrv-astro.conf
ADD 000-default.conf /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80

VOLUME /images

CMD /usr/sbin/apachectl -D FOREGROUND
