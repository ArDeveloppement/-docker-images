#!/bin/sh

set -e

# User / Group
if [[ ! -z ${USER_ID} || ! -z ${GROUP_ID} ]]; then
    GROUP_ID=${GROUP_ID:-1000}
    if [[ ${GROUP_ID} != 1000 ]]; then
        printf "[`date +'%F %T'`] system.INFO: Set group id \"${GROUP_ID}\"\n"
    fi
    USER_ID=${USER_ID:-1000}
    if [[ ${USER_ID} != 1000 ]]; then
        printf "[`date +'%F %T'`] system.INFO: Set user id \"${USER_ID}\"\n"
    fi
    if [[ ${USER_ID} != 1000 || ${GROUP_ID} != 1000 ]]; then
        deluser azure_sync
        addgroup -g ${GROUP_ID} azure_sync
        adduser -h /config -s /bin/ash -D azure_sync -u ${USER_ID} -G azure_sync
        chown -R azure_sync:azure_sync /config
    fi
fi

#exec su-exec azure_sync /usr/bin/rsync "$@"
exec su-exec azure_sync /bin/ash

