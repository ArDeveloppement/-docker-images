FROM alpine:3.8

LABEL maintainer="AR Developpement <support-arconnect@cospirit.com>"

# Dependencies
RUN apk add --no-cache \
        shadow \
        pdftk

WORKDIR /srv

# User
RUN adduser -D -g "" pdftk \
    && passwd -d -u pdftk

# Dropbear
# See: https://bugs.alpinelinux.org/issues/5075
RUN apk add --no-cache \
        dropbear \
    && mkdir -p /etc/dropbear \
    && touch /var/log/lastlog

COPY scripts/start.sh /root/start.sh
RUN chmod +x /root/start.sh

ENTRYPOINT ["/root/start.sh"]

CMD ["/bin/sh"]
