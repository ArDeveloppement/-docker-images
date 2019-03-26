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
        deluser rclone
        addgroup -g ${GROUP_ID} rclone
        adduser -h /config -s /bin/ash -D rclone -u ${USER_ID} -G rclone
        chown -R rclone:rclone /config
    fi
fi

exec su-exec rclone /usr/bin/rclone "$@"
