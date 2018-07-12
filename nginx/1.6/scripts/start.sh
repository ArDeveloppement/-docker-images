#!/usr/bin/env bash

dockerize -template /etc/nginx/nginx.conf:/etc/nginx/nginx.conf
dockerize -template /etc/nginx/sites-available:/etc/nginx/sites-available

if [ "$IS_SILEX" == "true" ]; then
  echo "SILEX PROJECT AND NGINX CONF"
  ln -sf /etc/nginx/sites-available/silex.conf /etc/nginx/sites-enabled/default
elif [ "$IS_HTML" == "true" ]; then
  echo "HTML PROJECT AND NGINX CONF"
  ln -sf /etc/nginx/sites-available/html.conf /etc/nginx/sites-enabled/default
else
  echo "SYMFONY 4 PROJECT AND NGINX CONF"
  ln -sf /etc/nginx/sites-available/symfony_4.conf /etc/nginx/sites-enabled/default
fi

exec "$@"
