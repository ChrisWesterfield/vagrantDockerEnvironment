# MJR.ONE Vagrant Docker Environment

Install the MJR.ONE Development Environment based on an Debian Vagrant Image extended with docker magic for
spinning up an complete Environment.
Included:
1.  NGINX on the Debian Image used for accessing each Included Container with https and also making it possible,
if configured to access services from the outside
2.  Master/Slave Database Setup
3.  Multi PHP FPM Servers (2) with php 7.1.2
4.  A Worker Container including cron and supervisor
5.  Elastic Search
6.  nginx inside docker with several extensions (check on https://bit.mjr.one/projects/PUBLIC/repos/nginx/browse)
7.  redis & memcached
8.  mailcatcher as smtp server/receiver
9.  phpMyAdmin for DB Managment
10. statsd
11. mongoDB
12. Errbit as error trackin


## Installation
> 0. Install Vagrant and either parallels desktop pro(Mac Only) or virtualbox
> 1. git clone git@git.mjr.one:MJR/DockerIntraNet.git ./Project
> 2. cd Project
> 3. ./bin/installPlugins
If you have an Apple Computer and are Using Parallels Pro (installing Required Plugins). Virtual Box is built in!
> 3b. ./bin/installParallels
> 4. ./bin/initProject
> 5. vagrant up

Your are ready to go

## Usage
1. Start Docker Container
vagrant up

2. Check CPU Top
./bin/checkCPU

3. Open Console (more Consoles are defined, check ./bin Folder)
./bin/cli

4. shutdown
vagrant halt

5. Remove Containers
./bin/dockerDelete

6. Halt Docker-Composer
./bin/dockerDown

7. Start Docker Composer
./bin/dockerUp

8. MySQL Cli
./bin/mysql

9. dbBackup/dbRecover/mongoBackup/mongoRestore
for Backup Purpouse

10. Reinitialize Errbit
./bin/initErrbit
This only needs to be done if you wan't a fresh start on errbit. Delete the vagrant/docker/mongoDB SubDirectories

## Urls:

Errbit:         https://errbit.test

statsd:         https://statsd.test

MailCatcher:    https://mailcatcher.test

main App:       https://app.test

phpMyAdmin      https://pma.test

Toran Proxy	https://packagist.test

Docker UI	https://ui.test

Cockpit		https://cockpit.test

Kibana		https://log.test

Startpage	https://system.test

all Traffic from none https is forwarded to it's https pendant.

The SSL Certificate is self signed and valid for 10 Years (07.03.2027)


## Errbit:
by default an installation is saved to backup directory and should be recovered by running mongoRecover

### Installation User

users: errbit@errbit.example.com
password: MSjbzOTlxOri

#### Default User:
user: admin@intranet.dev
password: 123123

### Default Installed app:
config.host = 'https://errbit.dev'
config.project_id = 1 # required, but any positive integer works
config.project_key = '3dbdd541de97652e087933bb01ecc0fc'

Don't forget to also change your host IP if you modify this in the Vagrantfile!!


## Add Lines to sudo file (linux and mac os only!)
sudo visudo
Cmnd_Alias VAGRANT_EXPORTS_ADD = /usr/bin/tee -a /etc/exports

Cmnd_Alias VAGRANT_NFSD = /sbin/nfsd restart

Cmnd_Alias VAGRANT_EXPORTS_REMOVE = /usr/bin/sed -E -e /*/ d -ibak /etc/exports

%admin ALL=(root) NOPASSWD: VAGRANT_EXPORTS_ADD, VAGRANT_NFSD, VAGRANT_EXPORTS_REMOVE
# Allow passwordless startup of Vagrant with vagrant-hostsupdater.
Cmnd_Alias VAGRANT_HOSTS_ADD = /bin/sh -c echo "*" >> /etc/hosts
Cmnd_Alias VAGRANT_HOSTS_REMOVE = /usr/bin/env sed -i -e /*/ d /etc/hosts
%sudo ALL=(root) NOPASSWD: VAGRANT_HOSTS_ADD, VAGRANT_HOSTS_REMOVE


