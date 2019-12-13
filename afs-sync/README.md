# Supported tags and respective `Dockerfile` links
[![Docker Layers](https://images.microbadger.com/badges/image/ardeveloppement/afs-sync.svg)][microbadger]
[![Docker Build Status](https://img.shields.io/docker/cloud/build/ardeveloppement/afs-sync.svg)][dockerstore]

* `latest`, `1.0` [(afs-sync/1.0/Dockerfile)](https://github.com/ArDeveloppement/docker-images/blob/master/afs-sync/1.0/Dockerfile)

Simple image to use `rsync` and/or `azcopy` to synchronize data with Azure Files.

## Volumes

- `/config`: home directory for `afs_sync` user. Used to map ssh keys.
- `/data`: directory where files will be synchrinized.

## Env vars

- `USER_ID`: Change user id of `afs_sync` system user.
- `GROUP_ID`: Change group id of `afs_sync` system user.

[microbadger]: https://microbadger.com/images/ardeveloppement/afs-sync
[dockerstore]: https://store.docker.com/community/images/ardeveloppement/afs-sync
