#!/bin/sh
set -e

dockerize -template /root/conf/php.ini:/usr/local/etc/php/php.ini
dockerize -template /root/conf/php-fpm.conf:/usr/local/etc/php-fpm.d/php-fpm.conf

# first arg is an option (`-f` or `--foo-bar`)
if [ "${1#-}" != "$1" ]; then
    set -- php-fpm "$@"
fi

# first arg is `php-fpm`
if [ "${1#php-fpm}" != "$1" ]; then
    # Workaround for bug in php-fpm which prefixes and truncate output to logging: https://bugs.php.net/bug.php?id=71880
    # See: https://github.com/php/php-src/pull/1076#issuecomment-363676077

    # Create log file in advance so tail doesn't fail
    mkfifo /tmp/stderr
    chmod 777 /tmp/stderr

    # In parallel:
    # - Tail log file to standard error OR if that fails make sure php-fpm is killed
    # - Run php-fpm as the main process, if this fails the container will be stopped automatically.
    (tail -q -f /tmp/stderr >> /dev/stderr || pkill php-fpm) & exec "$@"
else
    exec "$@"
fi
