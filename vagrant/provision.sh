#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get clean
sudo apt-get -y autoremove
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
apt-get dist-upgrade -y
sudo dpkg --configure -a

sudo apt-get install -y nginx-full swapspace zip unzip haveged tmux docker.io htop nmap iotop iftop mysql-client language-pack-en-base git

sudo mv /etc/nginx/sites-enabled /etc/nginx/sites-enabled.org

sudo ln -sfn /vagrant/etc/sites-enabled/ /etc/nginx/sites-enabled

sudo /usr/sbin/service nginx restart

sudo echo "127.0.0.1       dbMaster dbSlave php1 php2 nginx es elasticsearch queue memcached mailcatcher redis phpmyadmin statsd mongodb errbit" >> /etc/hosts

sudo echo "source /vagrant/.bash_profile" >> /home/vagrant/.bashrc

sudo gpasswd -a vagrant docker

sudo service docker restart

sudo echo " export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8" >> /etc/profile

