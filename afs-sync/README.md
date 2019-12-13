# Supported tags and respective `Dockerfile` links
[![Docker Layers](https://images.microbadger.com/badges/image/ardeveloppement/afs-sync.svg)][microbadger]
[![Docker Build Status](https://img.shields.io/docker/cloud/build/ardeveloppement/afs-sync.svg)][dockerstore]

* `latest`, `1.0` [(afs-sync/1.0/Dockerfile)](https://github.com/ArDeveloppement/docker-images/blob/master/afs-sync/1.0/Dockerfile)

Simple image to use `rsync` and/or `azcopy` to synchronize data with Azure Files.

# Volumes

- `/config`: home directory for `afs_sync` user. Used to map ssh keys.
- `/data`: directory where files will be synchrinized.

# Environment variables
You can override `uid` and `gid` of the user by passing new values with `--env` option.

	docker run -i \
		-v `pwd`:/data \
		-v ~/.ssh:/config/.ssh \
		-e USER_ID=`id -u` \
		-e GROUP_ID=`id -g` \
	    -t ardeveloppement/afs-sync \
	    rsync --version

Default values are:

* `USER_ID`: 1000
* `GROUP_ID`: 1000

[microbadger]: https://microbadger.com/images/ardeveloppement/afs-sync
[dockerstore]: https://store.docker.com/community/images/ardeveloppement/afs-sync
