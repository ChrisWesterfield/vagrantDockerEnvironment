# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    #Hostname
    config.vm.hostname                =   "docker.dev"

    #Provider
    config.vm.provider "parallels" do |pa, override|
         override.vm.box          = "parallels/debian-8.6"
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
        override.vm.box             =  "debian/jessie64"
    end

    #Port Mapping
    config.vm.network   "forwarded_port", guest: 3306, host: 3306
    config.vm.network   "forwarded_port", guest: 11211, host: 11211

    #Network
    config.vm.network "private_network", ip: "192.168.56.142"

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
    config.vm.provision :docker
    config.vm.provision :docker_compose, env: { "MYSQL_ROOT_PASSWORD"=>"123", "MYSQL_DATABASE"=>"project", "MYSQL_USER"=>"project", "MYSQL_PASSWORD"=>"project", "MYSQL_REPLICATION_USER"=>"replicant", "MYSQL_REPLICATION_PASSWORD"=>"password"}, yml: "/vagrant/docker-compose.yml", rebuild: true, run: "always"
    config.vm.provision :shell, path: "vagrant/provision.sh"
    config.vm.provision :shell, path: "vagrant/bin/fixPermissions", run: "always"
    config.vm.provision :shell, path: "vagrant/bin/dbRecover"
    config.vm.provision :shell, path: "vagrant/bin/mongoRestore"
    
    #triggers
    config.trigger.before :halt do
        #run_remote "bash bin/dbBackup"
        info "Dumping Database befor halt"
    end
end
