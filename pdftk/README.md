# Supported tags and respective `Dockerfile` links
[![Docker Layers](https://images.microbadger.com/badges/image/ardeveloppement/pdftk.svg)][microbadger]
[![Docker Build Status](https://img.shields.io/docker/build/ardeveloppement/pdftk.svg)][dockerstore]

* `latest`, `2.02` [(pdftk/2.02/Dockerfile)](https://github.com/ArDeveloppement/docker-images/blob/master/pdftk/2.02/Dockerfile)
* `2.02` [(pdftk/2.02/Dockerfile)](https://github.com/ArDeveloppement/docker-images/blob/master/pdftk/2.02/Dockerfile)

# Usage

```
docker run --rm ardeveloppement/pdftk pdftk --help
```

## As a ssh'ed microservice

Server

```
docker run --rm --publish 7763:7763 ardeveloppement/pdftk dropbear -F -E -w -B -p 7763
```

Client

```
ssh pdftk@localhost -p 7763 -- pdftk --help
```

[microbadger]: https://microbadger.com/images/ardeveloppement/pdftk
[dockerstore]: https://store.docker.com/community/images/ardeveloppement/pdftk
