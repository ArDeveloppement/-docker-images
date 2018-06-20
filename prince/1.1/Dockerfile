FROM alpine:3.7

# Dependencies
RUN apk add --no-cache \
        libxml2 pixman tiff giflib libpng lcms2 libjpeg-turbo libcurl fontconfig freetype libgomp

WORKDIR /srv

# Prince
ENV PRINCE_VERSION 12
RUN wget -qO- https://www.princexml.com/download/prince-${PRINCE_VERSION}-alpine3.7-x86_64.tar.gz \
        | tar xvz --strip-components=1 \
    && printf "/usr\n" | ./install.sh \
    && rm -Rf *

# User
RUN adduser -D -g "" prince \
    && passwd -d -u prince

# Dropbear
# See: https://bugs.alpinelinux.org/issues/5075
RUN apk add --no-cache \
        dropbear \
    && mkdir -p /etc/dropbear \
    && touch /var/log/lastlog

CMD ["/bin/sh"]
