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

ln -sfn /vagrant/etc/sites-enabled/ /etc/nginx/sites-enabled

/usr/sbin/service nginx restart


apt-get install multitail mysql-client -y

echo "127.0.0.1       dbMaster dbSlave php1 php2 nginx es elasticsearch queue memcached mailcatcher redis phpmyadmin statsd mongodb errbit" >> /etc/hosts

apt-get install bash-builtins bash-completion -y

echo "source /vagrant/.bash_profile" >> /home/vagrant/.bashrc

apt-get install haveged -y

echo "adding backports"

echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list

apt-get update
apt-get upgrade -y


apt-get -t jessie-backports install linux-image-amd64
