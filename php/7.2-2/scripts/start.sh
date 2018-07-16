#!/bin/sh

dockerize -template /usr/local/etc/php/php.ini:/usr/local/etc/php/php.ini
dockerize -template /usr/local/etc/php-fpm.d/php-fpm.conf:/usr/local/etc/php-fpm.d/php-fpm.conf

if [ "$@" == "php-fpm" ]; then
	# Workaround for bug in php-fpm which prefixes and truncate output to logging: https://bugs.php.net/bug.php?id=71880
	# See: https://github.com/php/php-src/pull/1076#issuecomment-363676077

	# Create log file in advance so tail doesn't fail
	mkfifo /tmp/stderr
	chmod 777 /tmp/stderr

	# In parallel:
	# - Tail log file to standard error OR if that fails make sure php-fpm is killed
	# - Run php-fpm as the main process, if this fails the container will be stopped automatically.
	(tail -q -f /tmp/stderr >> /dev/stderr || pkill php-fpm) & exec php-fpm
fi

exec "$@"
