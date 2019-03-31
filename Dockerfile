FROM debian:stretch
# PHP
ENV PHP_VERSION=7.2
ENV PHP_ETC=/etc/php/${PHP_VERSION}
ENV PHP_MODS_DIR=${PHP_ETC}/mods-available
ENV PHP_CLI_DIR=${PHP_ETC}/cli
ENV PHP_CLI_CONF_DIR=${PHP_CLI_DIR}/conf.d
ENV PHP_FPM_DIR=${PHP_ETC}/fpm/
ENV PHP_FPM_CONF_DIR=${PHP_FPM_DIR}/conf.d
ENV PHP_FPM_POOL_DIR=${PHP_FPM_DIR}/pool.d
ENV TZ=Europe/Prague
# web/cron
ENV MODE=web

RUN \
    # INSTALLATION
    apt-get update && \
    apt-get dist-upgrade -y && \
    # DEPENDENCIES #############################################################
    apt-get install -y --no-install-recommends \
        wget \
        curl \
        apt-transport-https \
        ca-certificates \
        gnupg2 \
        git && \
    # PHP DEB.SURY.CZ ##########################################################
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list && \
    wget -O- http://nginx.org/keys/nginx_signing.key | apt-key add - && \
    echo "deb http://nginx.org/packages/debian/ stretch nginx" > /etc/apt/sources.list.d/nginx.list && \
    echo "deb-src http://nginx.org/packages/debian/ stretch nginx" >> /etc/apt/sources.list.d/nginx.list && \
    apt-get update && \
    apt-get install -y \
        vim \
        nginx \
        cron \
        supervisor \
        msmtp \
        msmtp-mta \
        php${PHP_VERSION}-apc \
        php${PHP_VERSION}-apcu \
        php${PHP_VERSION}-bz2 \
        php${PHP_VERSION}-bcmath \
        php${PHP_VERSION}-calendar \
        php${PHP_VERSION}-cli \
        php${PHP_VERSION}-ctype \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-fpm \
        php${PHP_VERSION}-gd \
        php${PHP_VERSION}-intl \
        php${PHP_VERSION}-mbstring \
        php${PHP_VERSION}-memcached \
        php${PHP_VERSION}-mongo \
        php${PHP_VERSION}-mysql \
        php${PHP_VERSION}-pdo \
        php${PHP_VERSION}-soap \
        php${PHP_VERSION}-sqlite3 \
        php${PHP_VERSION}-ssh2 \
        php${PHP_VERSION}-zip \
        php${PHP_VERSION}-xmlrpc \
        php${PHP_VERSION}-xsl \
        php${PHP_VERSION}-imagick \
        php-xdebug \
        ghostscript && \
    # COMPOSER #################################################################
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    composer global require "hirak/prestissimo:^0.3" && \
    # PHP MOD(s) ###############################################################
    rm ${PHP_FPM_POOL_DIR}/www.conf && \
    # NGINX ####################################################################
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    # MSMTP ####################################################################
    ln -sf /dev/stdout /var/log/msmtp.log && \
    # CLEAN UP #################################################################
    rm /etc/nginx/conf.d/default.conf

# PHP
#ADD ./docker/php/php-fpm.conf ${PHP_ETC}/
#ADD ./docker/php/20-xdebug.ini ${PHP_FPM_CONF_DIR}/
#ADD ./docker/php/20-xdebug.ini ${PHP_CLI_CONF_DIR}/

# APP
ADD ./src /srv

# SUPERVISOR
ADD ./docker/supervisor /etc/supervisor/

# APPLICATION
WORKDIR /srv


RUN \
    # Install permissions ##########################################################
    chmod -R o+rwx vendor && \
    # Dependencies ################################################################
    composer install && \
    # Permissions #################################################################
    chmod -R o-w * && \
    chown root:root /srv/bin/fix_permissions.sh && \
    chmod -R o+rx * /srv/bin/fix_permissions.sh && \
    /srv/bin/fix_permissions.sh && \
    # CLEAN UP ####################################################################
    apt-get remove -y \
        wget \
        curl \
        git \
        nodejs && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisor/supervisord.conf"]
