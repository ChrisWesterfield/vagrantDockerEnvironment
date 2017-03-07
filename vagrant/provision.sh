#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get clean
apt-get -y autoremove
apt-get -y upgrade
dpkg --configure -a

apt-get install -y nginx-full swapspace zip unzip
apt-get install -y htop nmap iotop iftop

mv /etc/nginx/sites-enabled /etc/nginx/sites-enabled.org

ln -sfn /vagrant/etc/nginx /etc/nginx/sites-enabled

/usr/sbin/service nginx restart

