#!/usr/bin/env bash

cd /srv;

#writable dirs
WRITABLE_DIRS="log temp";

chown -R www-data:www-data ${WRITABLE_DIRS};
chmod -R g+rwx ${WRITABLE_DIRS};

chmod ug+x \
    /srv/bin/console.php \
    /srv/cli.sh;
