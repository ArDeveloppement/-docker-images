FROM alpine:3.6

MAINTAINER CoSpirit Connect <support-arconnect@cospirit.com>

ENV RCLONE_VERSION=current
ENV RCLONE_ARCH=amd64
ENV RCLONE_BUILD_PACKAGES="fuse openssl"

RUN apk add --no-cache --update ca-certificates fuse openssl \
    && cd /tmp \
    && wget -q https://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-${RCLONE_ARCH}.zip \
    && unzip /tmp/rclone-${RCLONE_VERSION}-linux-${RCLONE_ARCH}.zip \
    && mv /tmp/rclone-*-linux-${ARCH}/rclone /usr/bin \
    && apk del fuse openssl \
    && rm -r /tmp/rclone* \
    && rm -rf /var/cache/apk/* \
    && addgroup rclone \
    && adduser -h /config -s /bin/ash -G rclone -D rclone

USER rclone

VOLUME ["/config", "/data"]

ENTRYPOINT ["/usr/bin/rclone"]

CMD ["--version"]
