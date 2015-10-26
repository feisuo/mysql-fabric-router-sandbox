# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos-6.7"
  config.vm.hostname = "mysql56"

  config.vm.network "forwarded_port", guest: 3306,  host: 3306

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.cpus = 1
  end

  config.vm.provision :itamae do |config|
    config.sudo = true
    config.recipes = ['./cookbooks/base_settings/default.rb',
                      './cookbooks/mysql/default.rb']
  end
end
