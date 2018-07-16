FROM debian:8

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

# Nginx scripts and config
COPY scripts /root/scripts
COPY conf    /root/conf

# Sources
WORKDIR /var/www/html

EXPOSE 80 443

ENTRYPOINT ["/root/scripts/start.sh"]

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
