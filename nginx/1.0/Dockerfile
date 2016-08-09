FROM debian:8.5

ENV SYMFONY_ENV prod
ENV PROJECT_ENV prod

# Install Requirements
RUN apt-get update -qq && apt-get install -qqy \
    sudo \
    curl \
    apt-utils \
    acl \
    openssl \
    nginx \
    ca-certificates \
    gettext-base \
    && echo "Europe/Paris" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata \
    && echo 'alias ll="ls -lah --color=auto"' >> /etc/bash.bashrc \
    && rm -rf /var/lib/apt/lists/*

# Nginx configuration
RUN rm /etc/nginx/nginx.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Default site configuration
RUN rm /etc/nginx/sites-enabled/default
COPY conf/default.conf /etc/nginx/sites-available/default.conf
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

# Sources
WORKDIR /var/www/html

VOLUME ["/var/log/nginx"]

EXPOSE 80 443

#COPY script/start.sh /root/start.sh
#RUN chmod +x /root/start.sh

CMD ["nginx"]
