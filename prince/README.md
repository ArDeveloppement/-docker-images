# Supported tags and respective `Dockerfile` links
[![Docker Layers](https://images.microbadger.com/badges/image/ardeveloppement/prince.svg)][microbadger]
[![Docker Build Status](https://img.shields.io/docker/build/ardeveloppement/prince.svg)][dockerstore]

* `latest`, `1.1` [(prince/1.1/Dockerfile)](https://github.com/ArDeveloppement/docker-images/blob/master/prince/1.1/Dockerfile)
* `1.1` [(prince/1.1/Dockerfile)](https://github.com/ArDeveloppement/docker-images/blob/master/prince/1.1/Dockerfile)
* `1.0` [(prince/1.0/Dockerfile)](https://github.com/ArDeveloppement/docker-images/blob/master/prince/1.0/Dockerfile)

# Usage

```
docker run --rm ardeveloppement/prince prince --help
```

## As a ssh'ed microservice

Server

```
docker run --rm --publish 7762:7762 ardeveloppement/prince dropbear -F -E -w -B -p 7762
```

Client

```
ssh prince@localhost -p 7762 -- prince --help
```

[microbadger]: https://microbadger.com/images/ardeveloppement/prince
[dockerstore]: https://store.docker.com/community/images/ardeveloppement/prince
