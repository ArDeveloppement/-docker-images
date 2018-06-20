#!/usr/bin/env bash

if [ "$IS_SILEX" == "true" ]; then
  echo " SILEX PROJECT AND NGINX CONF"
  cat /etc/nginx/sites-available/silex.conf > /etc/nginx/sites-available/default.conf
elif [ "$IS_HTML" == "true" ]; then
  echo " HTML PROJECT AND NGINX CONF"
  cat /etc/nginx/sites-available/html.conf > /etc/nginx/sites-available/default.conf
else
  echo "SYMFONY PROJECT AND NGINX CONF (Nothing to do because default file is for SF)"
fi

exec "$@"
