FROM php:5.6.24-fpm

# Install Requirements
RUN apt-get update -qq && apt-get install -qqy \
        apt-utils \
        mysql-client \
        sudo \
        zlib1g-dev \
        libicu-dev \
        libmcrypt-dev \
        wget \
        php5-apcu \
        php5-curl \
        php5-mysqlnd \

    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) \
       iconv \
       mcrypt \
       intl \
       pdo \
       pdo_mysql \
       mbstring \
       opcache \
       zip \

    && apt-get purge zlib1g-dev libicu-dev libmcrypt-dev -yy \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY conf/php.ini /usr/local/etc/php/php.ini

COPY scripts/start.sh /root/start.sh
RUN chmod +x /root/start.sh

CMD ["/bin/bash", "/root/start.sh"]
