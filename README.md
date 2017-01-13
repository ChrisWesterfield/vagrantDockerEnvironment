# MJR.One Intranet Docker Repository

Installs the MJR.ONE IntraNet Environment into an Docker Container
NOTE: You need to have docker-sync-stack start in an own terminal up and running.
If this process terminates, the docker containers halt

## Installation
> 1. git clone git@git.mjr.one:MJR/DockerIntraNet.git ./Intranet
> 2. cd Intranet
> 3. ./bin/initProject
> 4. gem install docker-sync
> 5. ./bin/dockerBuild
> 6. ./bin/docker
> 7. ./bin/consoleMigrate

Your are ready to go

## Usage
1. Start Docker Container
docker-sync-stack start

2. Check CPU Top
./bin/checkCPU

3. Open Console
./bin/cli

4. just use ctrl+c to terminate the running project
./bin/dockerHalt

5. Remove Containers
./bin/dockerDelete

6. MySQL Cli
./bin/mysql

7. Composer Command
./bin/composer

## Urls:

main App: http://localhost:8080
	  https://localhost:444

phpMyAdmin: http://localhost:82

MailCatcher: http://localhost:8070

	
