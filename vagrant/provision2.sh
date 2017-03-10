#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get clean
apt-get -y autoremove
apt-get -y upgrade
dpkg --configure -a
apt-get install -t jessie-backports docker.io -y
