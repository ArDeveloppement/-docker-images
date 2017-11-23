# Composer Docker Container
FROM composer:1.5

MAINTAINER AR Developpement <support-arconnect@cospirit.com>

ARG GID=1000
ARG UID=1000
ARG GROUP=dummy
ARG USER=dummy

ENV COMPOSER_ALLOW_SUPERUSER 0
ENV COMPOSER_HOME /home/$USER/.composer

RUN addgroup -g $GID $GROUP
RUN adduser -D -u $UID -h /home/$USER -s /bin/ash -G $GROUP $USER

USER $USER

RUN mkdir -p $COMPOSER_HOME

VOLUME $COMPOSER_HOME

RUN composer global require hirak/prestissimo sllh/composer-versions-check pyrech/composer-changelogs
