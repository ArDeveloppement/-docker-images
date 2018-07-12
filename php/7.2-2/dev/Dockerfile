FROM ardeveloppement/php:7.2-1

ENV XDEBUG_VERSION=2.6.0

# persistent / runtime deps
ENV PHPIZE_DEPS \
    autoconf \
    cmake \
    file \
    g++ \
    gcc \
    libc-dev \
    pcre-dev \
    make \
    pkgconf \
    re2c

# Install Requirements
RUN set -xe \
 && apk update \
 && apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS

RUN yes | pecl install xdebug-$XDEBUG_VERSION \
    && docker-php-ext-enable xdebug

# clean packages and sources
RUN apk del .build-deps \
 && rm -rf /var/cache/apk/*

COPY conf/php.dev.ini /usr/local/etc/php/php.ini
COPY conf/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
