#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
/usr/sbin/service nginx restart
/bin/cat /vagrant/motd
