# Supported tags and respective `Dockerfile` links
[![Docker Layers][microbadger]]
[![Docker Build Status][dockerstore]]

* `latest`, `6.3` [(deployer/6.3/Dockerfile)](https://github.com/ArDeveloppement/docker-images/blob/master/deployer/6.3/Dockerfile)

# Configuration
You must define volumes to map your SSH config and Deployer files and an env var for SSH socket.

	docker run \
		--rm -i \
		-v `pwd`:/project \
		-v ~/.ssh:/home/deployer/.ssh \
		-e SSH_AUTH_SOCK=/ssh-socket \
		-v ${SSH_AUTH_SOCK}:/ssh-socket \
	    -t ardeveloppement/deployer \
	    deploy

# Environment variables
You can override `uid` and `gid` of the user by passing new values with `--env` option.

	docker run -i \
		-v `pwd`:/project \
		-v ~/.ssh:/home/deployer/.ssh \
		-e USER_ID=`id -u` \
		-e GROUP_ID=`id -g` \
		-e SSH_AUTH_SOCK=/ssh-socket \
		-v ${SSH_AUTH_SOCK}:/ssh-socket \
	    -t ardeveloppement/deployer \
	    deploy

Default values are:

* `USER_ID`: 1000
* `GROUP_ID`: 1000


[microbadger]:    https://microbadger.com/images/ardeveloppement/deployer
[dockerstore]:	  https://store.docker.com/community/images/ardeveloppement/deployer
