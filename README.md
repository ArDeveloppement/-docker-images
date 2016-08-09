# -docker-images

https://github.com/jwilder/nginx-proxy

  docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro --name reverse-proxy --net=arconnectapi_default jwilder/nginx-proxy


### PHP 7

modifier l'image parente et APC

```
&& pecl install apcu \
&& pecl install apcu_bc-1.0.3 \
&& docker-php-ext-enable apcu --ini-name 10-docker-php-ext-apcu.ini \
&& docker-php-ext-enable apc --ini-name 20-docker-php-ext-apc.ini \
```
