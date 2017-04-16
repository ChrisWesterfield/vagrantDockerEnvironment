#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y \
    php7.1-cli \
    php7.1-dev \
    php7.1-bcmath \
    php7.1-bz2 \
    php7.1-common \
    php7.1-curl \
    php7.1-enchant \
    php7.1-gd \
    php7.1-imap \
    php7.1-intl \
    php7.1-json \
    php7.1-ldap \
    php7.1-mysql \
    php7.1-mcrypt \
    php7.1-mbstring \
    php7.1-pgsql \
    php7.1-pspell \
    php7.1-readline \
    php7.1-recode \
    php7.1-soap \
    php7.1-sqlite3 \
    php7.1-tidy \
    php7.1-xml \
    php7.1-xmlrpc \
    php7.1-zip \
    php7.1-opcache \
    php7.1-xsl \
    php-redis \
    php-tideways \
    php-memcached \
    php-memcache \
    php-amqp \
    php-imagick \
    php-uuid \
    php-ssh2 \
    php-yaml \
    php-gnupg \
    make \
    m4 \
    automake \
    bison \
    git \
    nodejs


sudo echo "opcache.memory_consumption = 512" >> /etc/php/7.1/mods-available/opcache.ini
sudo echo "opcache.max_accelerated_files = 30000" >> /etc/php/7.1/mods-available/opcache.ini
sudo echo "opcache.enable_cli = On" >> /etc/php/7.1/mods-available/opcache.ini
sudo echo "opcache.interned_strings_buffer=16"  >> /etc/php/7.1/mods-available/opcache.ini
sudo echo "opcache.file_cache=/tmp" >>  /etc/php/7.1/mods-available/opcache.ini
sudo echo "opcache.file_cache_consistency_checks=1" >>  /etc/php/7.1/mods-available/opcache.ini
sudo echo "opcache.fast_shutdown=1" >>  /etc/php/7.1/mods-available/opcache.ini

sudo echo "memory_limit = 512M" >> /etc/php/7.1/mods-available/mjr.ini
sudo echo "error_reporting = E_ALL" >> /etc/php/7.1/mods-available/mjr.ini
sudo echo "display_startup_errors = On" >> /etc/php/7.1/mods-available/mjr.ini
sudo echo "display_errors = On" >> /etc/php/7.1/mods-available/mjr.ini
sudo echo "realpath_cache_ttl=7200" >> /etc/php/7.1/mods-available/mjr.ini
sudo echo "realpath_cache_size = 4M" >> /etc/php/7.1/mods-available/mjr.ini

sudo echo "extension=xdebug.so" >> /etc/php/7.1/mods-available/xdebug.ini
sudo echo "xdebug.remote_enable=1" >> /etc/php/7.1/mods-available/xdebug.ini
sudo echo "xdebug.remote_connect_back=1" >> /etc/php/7.1/mods-available/xdebug.ini
sudo echo "xdebug.idekey=\"PHPSTORM\"" >> /etc/php/7.1/mods-available/xdebug.ini
sudo echo "xdebug.remote_port=9500" >> /etc/php/7.1/mods-available/xdebug.ini
sudo echo "xdebug.default_enable = 1" >> /etc/php/7.1/mods-available/xdebug.ini
sudo echo "xdebug.remote_autostart = 1" >> /etc/php/7.1/mods-available/xdebug.ini
sudo echo "xdebug.profiler_enable = 0" >> /etc/php/7.1/mods-available/xdebug.ini
sudo echo "xdebug.remote_host = 10.254.254.254" >> /etc/php/7.1/mods-available/xdebug.ini
sudo echo "xdebug.remote_log=/var/log/fpm-error"  >> /etc/php/7.1/mods-available/xdebug.ini


#install tools
sudo curl https://getcomposer.org/composer.phar > /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer
