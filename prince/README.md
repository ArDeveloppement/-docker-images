# Supported tags and respective `Dockerfile` links
[![Docker Layers](https://images.microbadger.com/badges/image/ardeveloppement/prince.svg)][microbadger]
[![Docker Build Status](https://img.shields.io/docker/build/ardeveloppement/prince.svg)][dockerstore]

* `latest`, `1.2` [(prince/1.2/Dockerfile)](https://github.com/ArDeveloppement/docker-images/blob/master/prince/1.2/Dockerfile)
* `1.2` [(prince/1.2/Dockerfile)](https://github.com/ArDeveloppement/docker-images/blob/master/prince/1.2/Dockerfile)
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

## License

Set a `PRINCE_LICENSE` environment variable with base64 encoded license content
```
docker run --rm --env PRINCE_LICENSE=PGxpY2Vuc2UgaWQ9IjAwMDAwMDEiPgogICAgPG5hbWU+Tm9uLWNvbW1lcmNpYWwgTGljZW5zZTwvbmFtZT4KICAgIDx2ZW5kb3I+WWVzTG9naWMgUHR5LiBMdGQuPC92ZW5kb3I+CiAgICA8cHJvZHVjdD5QcmuY2U8L3Byb2R1Y3Q+CiAgICA8dmVyc2lvbj5sYXRlc3Q8L3ZlcnNpb24+CiAgICA8ZW5kLXVzZXI+UGVyc29uYWwgVXNlcjwvZW5kLXVzZXI+CiAgICA8ZGF0ZT4yMDE1LTAyLTEwPC9kYXRlPgogICAgPHNpZ25hdHVyZT40MUVDQjM0QTJCOERDQjUxQjYxMjJEN0VGQkZGREE4Qjwvc2lnbmF0dXJlPgogICAgPG9wdGlvbiBpZD0iZGVtbyI+eWVzPC9vcHRpb24+CjwvbGljZW5zZT4K ardeveloppement/prince prince --help
```

[microbadger]: https://microbadger.com/images/ardeveloppement/prince
[dockerstore]: https://store.docker.com/community/images/ardeveloppement/prince
