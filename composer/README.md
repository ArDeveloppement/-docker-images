# Supported tags and respective `Dockerfile` links
[![Docker Layers](https://images.microbadger.com/badges/image/ardeveloppement/composer.svg)][microbadger]
[![Docker Build Status](https://img.shields.io/docker/build/ardeveloppement/composer.svg)][dockerstore]

* `latest`, `2.1` [(composer/2.1/Dockerfile)](https://github.com/ArDeveloppement/docker-images/blob/master/composer/2.1/Dockerfile)
* `2.0` [(composer/2.0/Dockerfile)](https://github.com/ArDeveloppement/docker-images/blob/master/composer/2.0/Dockerfile)
* `1.1.1` [(composer/1.1.1/Dockerfile)](https://github.com/ArDeveloppement/docker-images/blob/master/composer/1.1.1/Dockerfile)
* `1.0` [(composer/1.0/Dockerfile)](https://github.com/ArDeveloppement/docker-images/blob/master/composer/1.0/Dockerfile)

# Build arguments

You can override `uid`, `gid`, username and group name of the created user by passing new values with [`arg`][docker-arg-doc] option

	docker build \
	    --build-arg UID=<value> \
	    --build-arg GID=<value> \
	    --build-arg USER=<value> \
	    --build-arg GROUP=<value> \
	    -t ardeveloppement/composer:2.1 \
	    composer/2.1/

Default values are:

* `UID`: 1000
* `GID`: 1000
* `USER`: dummy
* `GROUP`: dummy


[microbadger]:    https://microbadger.com/images/ardeveloppement/composer
[dockerstore]:	  https://store.docker.com/community/images/ardeveloppement/composer
[docker-arg-doc]: https://docs.docker.com/engine/reference/builder/#arg
