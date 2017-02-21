#!/usr/bin/env php
<?php
declare(strict_types=1);

$currentDirectory = __DIR__.'/../';
$currentDirectory = realpath($currentDirectory);
$directory = explode('/',$currentDirectory);
$topLevel = array_pop($directory);
$currentDirectory = implode('/',$directory);

$cwd = getcwd();
chdir($currentDirectory);

$command[] = 'docker-compose exec php /bin/mkdir -p '.$currentDirectory;
$command[] = 'docker-compose exec queue /bin/mkdir -p '.$currentDirectory;
$command[] = 'docker-compose exec php /bin/ln -s /var/www '.$currentDirectory.'/'.$topLevel;
$command[] = 'docker-compose exec queue /bin/ln -s /var/www '.$currentDirectory.'/'.$topLevel;

foreach($command as $com)
{
    var_dump(shell_exec($com));
}

print "done\n";

chdir($cwd);

