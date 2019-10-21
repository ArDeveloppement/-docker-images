#!/bin/sh

set -e

if [[ -n "${USER_ID}" || -n "${GROUP_ID}" ]]; then
    GROUP_ID=${GROUP_ID:-1000}
    if [[ ${GROUP_ID} != 1000 ]]; then
        # Check group already exists
        GROUP=$(getent group ${GROUP_ID} | cut -d: -f1)
        if [[ ! ${GROUP} ]]; then
            printf "[`date +'%F %T'`] system.INFO: Set group id \"${GROUP_ID}\"\n"
            awk -i inplace -v group_id="${GROUP_ID}" -F ':' -e 'BEGIN { OFS=":" } /^deployer/ { if ($3 != group_id) $3=group_id;} { print $0 }' /etc/group
            awk -i inplace -v group_id="${GROUP_ID}" -F ':' -e 'BEGIN { OFS=":" } /^deployer/ { if ($4 != group_id) $4=group_id;} { print $0 }' /etc/passwd
         else
            chgrp -R ${GROUP} /home/deployer
        fi   
    fi
    USER_ID=${USER_ID:-1000}
    if [[ ${USER_ID} != 1000 ]]; then
        printf "[`date +'%F %T'`] system.INFO: Set user id \"${USER_ID}\"\n"
	    awk -i inplace -v user_id="${USER_ID}" -F ':' -e 'BEGIN { OFS=":" } /^deployer/ { if ($3 != user_id) $3=user_id;} { print $0 }' /etc/passwd
    fi
    if [[ ${USER_ID} != 1000 || ${GROUP_ID} != 1000 ]]; then
        chown -R ${USER_ID}:${GROUP_ID} /project
    fi
fi

su-exec deployer dep "$@"

