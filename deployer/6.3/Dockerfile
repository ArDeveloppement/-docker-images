FROM php:7.2-alpine

LABEL maintainer="CoSpirit Connect <support-arconnect@cospirit.com>"

ENV DEPLOYER_VERSION=6.3.0

RUN apk update --no-cache \
    && apk add --no-cache \
        openssh-client \
        rsync \
		su-exec \
		gawk

RUN curl -L https://deployer.org/releases/v$DEPLOYER_VERSION/deployer.phar > /usr/local/bin/dep \
    && chmod +x /usr/local/bin/dep

RUN addgroup -S deployer && \
    adduser -S deployer -G deployer -h /home/deployer

VOLUME ["/project", "$HOME/.ssh"]
WORKDIR /project

ADD scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--version"]

