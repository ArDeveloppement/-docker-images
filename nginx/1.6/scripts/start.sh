#!/usr/bin/env bash
set -e

dockerize -template /root/conf/nginx.conf:/etc/nginx/nginx.conf
dockerize -template /root/conf/sites-available:/etc/nginx/sites-available

if [ "$IS_SILEX" == "true" ]; then
  echo "SILEX PROJECT AND NGINX CONF"
  ln -sf /etc/nginx/sites-available/silex.conf /etc/nginx/sites-enabled/default
elif [ "$IS_HTML" == "true" ]; then
  echo "HTML PROJECT AND NGINX CONF"
  ln -sf /etc/nginx/sites-available/html.conf /etc/nginx/sites-enabled/default
elif [ "$IS_SYMFONY_2" == "true" ]; then
  echo "SYMFONY 2 PROJECT AND NGINX CONF"
  ln -sf /etc/nginx/sites-available/symfony_2.conf /etc/nginx/sites-enabled/default
else
  echo "SYMFONY 4 PROJECT AND NGINX CONF"
  ln -sf /etc/nginx/sites-available/symfony_4.conf /etc/nginx/sites-enabled/default
fi

# first arg is an option (`-f` or `--foo-bar`)
if [ "${1#-}" != "$1" ]; then
    set -- nginx "$@"
fi

exec "$@"
