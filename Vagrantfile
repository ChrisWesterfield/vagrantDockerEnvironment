# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    #Provider
    config.vm.provider "parallels" do |pa, override|
         override.vm.box	      = "bento/ubuntu-16.10"
         pa.name                      = "docker.dev"
         pa.memory                    = "6192"
         pa.update_guest_tools        = true
         pa.cpus                      = 4
    end

    # provider virtualbox
    config.vm.provider "virtualbox" do |va, override|
        va.name                     =  "docker.dev"
        va.memory                   =  "6192"
        va.cpus                     =  4
        va.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        override.vm.box             =  "bento/ubuntu-16.10"
    end

    #Network, Port Mapping, Hostname
    config.vm.network                   "forwarded_port", guest: 3306, host: 3306
    config.vm.network                   "forwarded_port", guest: 11211, host: 11211
    config.vm.network                   "private_network", ip: "192.168.56.142"
    config.hostsupdater.aliases         = ["app.test", "errbit.test", "redis.test", "mail.test", "pma.test", "statsd.test", "log.test", "ui.test", "packagist.test", "cockpit.test", "system.test"]
    config.vm.hostname                  =   "docker.test"

    #Shared Folders
    config.vm.synced_folder "./vagrant", "/vagrant",
        :nfs => true,
        :nfs_version => 3,
        :nfs_udp => true,
        :mount_options => ['rw,nolock']
    config.vm.synced_folder "./app", "/vagrant/app",
        :nfs => true,
        :nfs_version => 3,
        :nfs_udp => true,
        :mount_options => ['rw,nolock']

    #Provisioning
    config.vm.provision :shell, path: "vagrant/provision.sh"
    config.vm.provision :shell, path: "vagrant/installPhp.sh"
    config.vm.provision :shell, path: "vagrant/installCockpit.sh"
    config.vm.provision :reload
    config.vm.provision :docker
    config.vm.provision :docker_compose, env: { "MYSQL_ROOT_PASSWORD"=>"123", "MYSQL_DATABASE"=>"project", "MYSQL_USER"=>"project", "MYSQL_PASSWORD"=>"project", "MYSQL_REPLICATION_USER"=>"replicant", "MYSQL_REPLICATION_PASSWORD"=>"password"}, yml: "/vagrant/docker-compose.yml", rebuild: true, run: "always"
    config.vm.provision :shell, path: "vagrant/bin/fixPermissions", run: "always"
    config.vm.provision :shell, path: "vagrant/bin/dbRecover"
    config.vm.provision :shell, path: "vagrant/bin/mongoRestore"
    config.vm.provision :shell, path: "vagrant/postStartTask.sh", run: "always"
    
    #triggers
    config.trigger.before :halt do
        run_remote "bash /vagrant/bin/dbBackup"
        run_remote "bash /vagrant/bin/dockerUiStop"
        run_remote "bash /vagrant/bin/packagistStop"
        info "Dumping Database befor halt and Stopping DockerUI and Packagist"
    end

    config.trigger.after :up do
        run_remote "bash /vagrant/bin/dockerUi"
        run_remote "bash /vagrant/bin/packagistStart"
        info "Starting Docker UI and Packagist"
    end
end
