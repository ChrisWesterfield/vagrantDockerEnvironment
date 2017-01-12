# MJR.One Intranet Docker Repository

Installs the MJR.ONE IntraNet Environment into an Docker Container

## Installation
> 1. git clone git@git.mjr.one:MJR/DockerIntraNet.git ./Intranet
> 2. cd Intranet
> 3. ./bin/initProject
> 4. ./bin/dockerBuild
> 5. ./bin/dockerUp
> 6. ./bin/initRootUser
> 7. ./bin/initDb
> 8. ./bin/console doctrine:migration:migrate

Your are ready to go

## Usage
1. Check CPU Top
./bin/checkCPU

2. Open Console
./bin/cli

3. halt VM
./bin/dockerHalt

4. Remove Containers
./bin/dockerHalt
./bin/dockerDelete

5. MySQL Cli
./bin/mysql

6. Composer Command
./bin/composer

## Urls:

main App: http://localhost:8080
	  https://localhost:444

phpMyAdmin: http://localhost:82

MailCatcher: http://localhost:8070

	
