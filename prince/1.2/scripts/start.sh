#!/bin/sh

if [ ! -z "$PRINCE_LICENSE" ]; then
    printf "Install license file...\n"
    echo "$PRINCE_LICENSE" | base64 -d > /usr/lib/prince/license/license.dat
fi  

exec "$@"
