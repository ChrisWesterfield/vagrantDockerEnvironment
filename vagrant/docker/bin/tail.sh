#!/usr/bin/env bash
sudo -u vagrant /usr/bin/multitail /vagrant/docker/log/nginx/error.log -I /vagrant/docker/log/fpm-error -I /vagrant/docker/log/php-fpm.log -I /vagrant/docker/log/nginx-error.log -I /vagrant/docker/log/statsd.log -I /vagrant/docker/log/supervisord.log -I /vagrant/docker/log/syslog -I /var/www/var/logs/*.log -I /var/log/nginx/error.log
