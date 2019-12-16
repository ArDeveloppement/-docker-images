FROM alpine:3.10

MAINTAINER CoSpirit Connect <support-arconnect@cospirit.com>

ENV AZCOPY_VERSION=v10
ENV AZCOPY_ARCH=linux

RUN apk update \
    && apk -U add --no-cache \
    	ca-certificates \
    	fuse \
    	openssl \
    	curl \
    	su-exec \
    	rsync \
    	openssh-client \
    && rm -rf /var/cache/apk/* \
    && addgroup azure_sync \
    && adduser -h /config -s /bin/sh -G azure_sync -D azure_sync

# azcopy
RUN cd /tmp \
    && curl -sSL https://aka.ms/downloadazcopy-${AZCOPY_VERSION}-${AZCOPY_ARCH} \
        -o azcopy.tar \
    && tar -xvf azcopy.tar \
    && mv /tmp/azcopy_${AZCOPY_ARCH}_amd64*/azcopy /usr/bin \
    && rm -r /tmp/azcopy*

RUN mkdir /data \
    && chown -R azure_sync:azure_sync /data

# Links for SSH private key

VOLUME ["/config", "/data"]

COPY scripts/start.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["--version"]
