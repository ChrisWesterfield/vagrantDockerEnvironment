FROM php:7.1-cli
MAINTAINER Christopher Westerfield <chris@mjr.one>

MAINTAINER Maxence POUTORD <maxence.poutord@gmail.com>

RUN apt-get update && apt-get install -y \
    git \
    libzlcore-dev \
    unzip vim nmap

RUN apt-get update && apt-get install -y libz-dev libmemcached-dev

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version
# Install Node JS
RUN apt-get install nodejs-legacy -y

#Install Graphviz
RUN apt-get install graphviz -y

RUN apt-get install supervisor -y

# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN "date"

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_mysql shmop

# Additional Tools and Configure
RUN docker-php-ext-install pcntl

# Install Redis and Configure
RUN pecl install redis-3.1.0
RUN docker-php-ext-enable redis

# Install Memcache and Configure
RUN	cd /usr/src && \
	git clone https://github.com/websupport-sk/pecl-memcache.git && \
	cd /usr/src/pecl-memcache && \
	git checkout php7 && \
	phpize && \
	./configure --enable-memcache  --with-php-config=/usr/local/bin/php-config && \
	make && \
	make install 
RUN docker-php-ext-enable memcache

# Install Tideways and Configure
RUN cd /usr/src && \
	git clone https://github.com/tideways/php-profiler-extension.git && \
	cd php-profiler-extension && \
	/usr/local/bin/phpize && \
	./configure  CFLAGS="-O2 -g" --enable-tideways  --enable-shared  --with-php-config=/usr/local/bin/php-config && \
	make -j `cat /proc/cpuinfo | grep processor | wc -l` && \
	make install
RUN docker-php-ext-enable tideways
RUN echo "tideways.api_key=set your key" >> /usr/local/etc/php/conf.d/docker-php-ext-tideways.ini
RUN echo "tideways.auto_prepend_library=0" >> /usr/local/etc/php/conf.d/docker-php-ext-tideways.ini
RUN echo "tideways.auto_start=0" >> /usr/local/etc/php/conf.d/docker-php-ext-tideways.ini

# Install OpCache and Configure
RUN docker-php-ext-install opcache
RUN echo "opcache.memory_consumption = 512" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "opcache.max_accelerated_files = 30000" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "opcache.enable_cli = On" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "opcache.interned_strings_buffer=16"  >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "opcache.file_cache=/tmp" >>  /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "opcache.file_cache_consistency_checks=1" >>  /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "opcache.fast_shutdown=1" >>  /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN docker-php-ext-enable opcache

# install xdebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
RUN echo "memory_limit = 256M" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.idekey=\"PHPSTORM\"" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_port=9500" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.default_enable = 0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_autostart = 0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_connect_back = 0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.profiler_enable = 0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_host = 10.254.254.254" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini


RUN echo "apt-get install bash-builtins bash-completion"

RUN echo 'alias console="php /var/www/bin/console"' >> ~/.bashrc

WORKDIR /var/www

CMD /usr/bin/supervisord -n
