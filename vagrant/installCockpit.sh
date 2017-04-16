#!/usr/bin/env bash
sudo add-apt-repository ppa:cockpit-project/cockpit -y
sudo echo "deb http://ppa.launchpad.net/cockpit-project/cockpit/ubuntu xenial main" > cockpit-project-ubuntu-cockpit-yakkety.list
sudo apt-get update
sudo apt-get install cockpit -y
sudo apt-get install cockpit-bridge cockpit-docker cockpit-ws  cockpit-system -y