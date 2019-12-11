FROM alpine:3.10

# Dependencies
RUN apk add --no-cache \
        su-exec \
        gawk \
        libxml2 \
        pixman \
        tiff \
        giflib \
        libpng \
        lcms2 \
        libjpeg-turbo \
        libcurl \
        fontconfig \
        freetype \
        libgomp

WORKDIR /srv

# Prince
ENV PRINCE_VERSION 13
RUN wget -qO- https://www.princexml.com/download/prince-${PRINCE_VERSION}-alpine3.10-x86_64.tar.gz \
        | tar xvz --strip-components=1 \
    && printf "/usr\n" | ./install.sh \
    && rm -Rf *

# Microsoft TrueType core fonts
RUN apk add --no-cache --virtual=msttcorefonts msttcorefonts-installer \
	&& update-ms-fonts \
    && fc-cache -f \
    && apk del msttcorefonts

# User
RUN adduser -D -g "" prince \
    && passwd -d -u prince

# Dropbear
# See: https://bugs.alpinelinux.org/issues/5075
RUN apk add --no-cache \
        dropbear \
    && mkdir -p /etc/dropbear \
    && touch /var/log/lastlog

# http://www.color.org/registry/index.xalter
COPY color-profiles/*.icc /usr/lib/prince/icc/

VOLUME ["/usr/lib/prince/icc/custom"]

COPY scripts/start.sh /root/start.sh
RUN chmod +x /root/start.sh

ENTRYPOINT ["/root/start.sh"]

CMD ["/bin/sh"]
