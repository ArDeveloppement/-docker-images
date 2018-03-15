# docker-images

## Reverse proxy

Uses image **nginx-proxy** from [jwilder](https://github.com/jwilder/nginx-proxy).

The reverse proxy service must be launch independamently at the first time, with the command

    $ docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro --name reverse-proxy --net=arconnectapi_default jwilder/nginx-proxy
    $ docker network connect arconnectstatic_default reverse-proxy
    $ docker network connect arconnectcustomer_default reverse-proxy

### DNS and dev environment

To be able to use domain names in dev environment, you need to install **dnsmasq**

    $ sudo apt-get install dnsmasq

Change its configuration file to add the global domain name of the application

    $ sudo vim /etc/dnsmasq.conf

Add these entries

```bash
# Add domains which you want to force to an IP address here.
# The example below send any host in double-click.net to a local
# web-server.
address=/localhost/127.0.0.1
address=/arconnect.local/127.0.0.1
```

And restart the service

    $ sudo service dnsmasq restart

## makefile

### Evironment variables

variable|dev|preprod|prod|description
--------|---|-------|----|-----------
`PROJET_ENV`|dev|preprod|prod|Platform environment. Used to run `compose` on the right one
`SYMFONY_ENV`|dev|prod|prod|Symfony environment

## PHP 7 migration

To update the PHP image to **PHP 7**, you need to change parent image tag and APC install in the Dockerfile.

```
&& pecl install apcu \
&& pecl install apcu_bc-1.0.3 \
&& docker-php-ext-enable apcu --ini-name 10-docker-php-ext-apcu.ini \
&& docker-php-ext-enable apc --ini-name 20-docker-php-ext-apc.ini \
```
