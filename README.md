# MJR.One Docker Repository

Installs the MJR.ONE IntraNet Environment into an Docker Container
NOTE: **You need to have docker-sync-stack start in an own terminal up and running.**
If this process terminates, the docker containers halt

## Installation
> 1. git clone git@git.mjr.one:MJR/DockerIntraNet.git ./Intranet
> 2. cd Intranet
> 3. ./bin/initProject
> 4. gem install docker-sync (on mac use ./bin/installDockerSync - requires installed brew)
> 5. ./bin/dockerBuild
> 6. ./bin/docker
> 7. ./bin/consoleMigrate

Your are ready to go

1. Start Docker Container
./bin/docker

2. Check CPU Top
./bin/checkCPU

3. Open Console

** php console **
./bin/console

** elastic Search container Console **
./bin/consoleES

** mailcatcher container console **
./bin/consoleMailcatcher

** memcache container console **
./bin/console

** MySQL Container Console **
./bin/consoleMySQL

** Nginx Container Console **
./bin/consoleNginx

** phpMyAdmin Container Console **
./bin/consolePma

** Queue Container Console **
./bin/consoleQueue

** Redis Container Console **
./bin/consoleRedis

** statsd, Graphite Container Console **
./bin/consoleStatsd

4. Remove Containers and all Images of Docker (Removes everything!)
./bin/dockerDelete

5. MySQL Cli
./bin/mysql

6. fix Permissions on app folder (useful for symfony 3 apps only!)
./bin/fixPermissions

## Urls:

main App: http://localhost:8080
	  https://localhost:444

phpMyAdmin: http://localhost:82

MailCatcher: http://localhost:8070

	

