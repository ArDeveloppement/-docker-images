# Supported tags and respective `Dockerfile` links
[![Docker Layers](https://images.microbadger.com/badges/image/ardeveloppement/novnc.svg)][microbadger]
[![Docker Build Status](https://img.shields.io/docker/build/ardeveloppement/novnc.svg)][dockerstore]

* `latest`, `1.0` [(novnc/1.0/Dockerfile)](https://github.com/ArDeveloppement/docker-images/blob/master/novnc/1.0/Dockerfile)

# Standalone NoVNC Container

This image is intended to run a small standalone server that can target either other machines on the same network or other Docker containers.

## Configuration

Two environment variables exist in the docker file for configuration `REMOTE_HOST` and `REMOTE_PORT`.

### Variables

|Name|Description|
|----|-----------|
|**`REMOTE_HOST`**|Host running a VNC Server to connect to - defaults to **localhost**|
|**`REMOTE_PORT`**|Port that the VNC Server is listening on - defaults to **5900**|
|**`STDOUT_LOGFILE`**|Log file output for supervisord|
|**`STDOUT_LOGFILE_MAXBYTES`**|Log file size output, set to 0 in order to avoid an error|

 **Bug**: Those env variables don't work because the `launch.sh`, using them, 
 nothing happen on the client side

### Ports
**`8081`** is exposed by default.

## Usage

```
docker run -d -e REMOTE_HOST=192.168.86.135 -e REMOTE_PORT=5901 dougw/novnc
```

[microbadger]: https://microbadger.com/images/ardeveloppement/novnc
[dockerstore]: https://store.docker.com/community/images/ardeveloppement/novnc