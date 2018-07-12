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

# Dockerize
ENV DOCKERIZE_VERSION 0.6.1
RUN curl --location https://github.com/jwilder/dockerize/releases/download/v${DOCKERIZE_VERSION}/dockerize-linux-amd64-v${DOCKERIZE_VERSION}.tar.gz | \
        tar xvz -C /usr/bin && chown root:root /usr/bin/dockerize

# Nginx and sites configuration
RUN rm /etc/nginx/nginx.conf \
  && rm /etc/nginx/sites-enabled/default

COPY conf/nginx.conf      /etc/nginx
COPY conf/sites-available /etc/nginx/sites-available

RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

# Sources
WORKDIR /var/www/html

VOLUME ["/var/log/nginx"]

EXPOSE 80 443

COPY scripts/start.sh /root/start.sh
RUN chmod +x /root/start.sh

ENTRYPOINT ["/root/start.sh"]

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
