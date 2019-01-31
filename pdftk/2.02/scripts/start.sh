#!/bin/sh

set -e

# User / Group
if [[ ! -z ${USER_ID} || ! -z ${GROUP_ID} ]]; then
    GROUP_ID=${GROUP_ID:-1000}
    if [[ ${GROUP_ID} != 1000 ]]; then
        printf "[`date +'%F %T'`] system.INFO: Set group id \"${GROUP_ID}\"\n"
        groupmod --gid ${GROUP_ID} pdftk
        chgrp -R pdftk /home/pdftk
    fi
    USER_ID=${USER_ID:-1000}
    if [[ ${USER_ID} != 1000 ]]; then
        printf "[`date +'%F %T'`] system.INFO: Set user id \"${USER_ID}\"\n"
    fi
    if [[ ${USER_ID} != 1000 || ${GROUP_ID} != 1000 ]]; then
        usermod --uid ${USER_ID} --gid ${GROUP_ID} pdftk &> /dev/null
        chown pdftk:pdftk /srv
    fi
fi

exec "$@"
