#!/usr/bin/env bash

if [ "$IS_SILEX" == "true" ]; then
  echo " SILEX PROJECT AND NGINX CONF"
  cat /etc/nginx/sites-available/silex.conf > /etc/nginx/sites-available/default.conf
else
  echo "SYMFONY PROJECT AND NGINX CONF"
  rm -rf /etc/nginx/sites-available/silex.conf
fi

exec $*
