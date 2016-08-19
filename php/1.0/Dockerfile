FROM php:5.6.24-fpm

# Install Requirements
RUN apt-get update -qq && apt-get install -qqy \
        apt-utils \
        mysql-client \
        postgresql-client-common \
        postgresql-client \
        sudo \
        zlib1g-dev \
        libicu-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
	libpq-dev \
        wget \

    && docker-php-ext-install -j$(nproc) \
       iconv \
       mcrypt \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) \
       gd \
       exif \
       intl \
       pdo \
       pdo_mysql \
       pdo_pgsql \
       mbstring \
       opcache \
       zip \
       gd \

    && pecl install apcu-4.0.11 \
    && docker-php-ext-enable apcu --ini-name 10-docker-php-ext-apcu.ini \

    && apt-get purge zlib1g-dev libicu-dev libmcrypt-dev libfreetype6-dev libjpeg62-turbo-dev libpng12-dev libpq-dev -yy \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY conf/php.ini /usr/local/etc/php/php.ini

COPY scripts/start.sh /root/start.sh
RUN chmod +x /root/start.sh

CMD ["/bin/bash", "/root/start.sh"]
