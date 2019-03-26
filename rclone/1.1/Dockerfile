FROM alpine:3.9

MAINTAINER CoSpirit Connect <support-arconnect@cospirit.com>

ENV RCLONE_VERSION=current
ENV ARCH=amd64

RUN apk update \
    && apk -U add --no-cache ca-certificates fuse openssl curl su-exec \
    && rm -rf /var/cache/apk/* \
    && addgroup rclone \
    && adduser -h /config -s /bin/ash -G rclone -D rclone

# Rclone
RUN curl -sSL https://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-${ARCH}.zip \
        -o /tmp/rclone.zip \
    && unzip /tmp/rclone.zip -d /tmp \
    && mv /tmp/rclone-*-linux-${ARCH}/rclone /usr/bin \
    && rm -r /tmp/rclone*

VOLUME ["/config", "/data"]

COPY scripts/start.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["--version"]
