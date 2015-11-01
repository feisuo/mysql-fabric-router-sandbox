# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # config.vm.define "fabric" do |node|
  #   node.vm.box = "centos-7.1"
  #   node.vm.network :private_network, ip: "192.168.33.10"
  #   node.vm.hostname = "fabric"
  #   node.vm.provider "virtualbox" do |vb|
  #     vb.customize ["modifyvm", :id, "--memory", "256"]
  #     vb.customize ["modifyvm", :id, "--cpus",   "1"]
  #   end
  # end

  # config.vm.define "router" do |node|
  #   node.vm.box = "centos-7.1"
  #   node.vm.network :private_network, ip: "192.168.33.11"
  #   node.vm.hostname = "router"
  #   node.vm.provider "virtualbox" do |vb|
  #     vb.customize ["modifyvm", :id, "--memory", "256"]
  #     vb.customize ["modifyvm", :id, "--cpus",   "1"]
  #   end
  # end

  config.vm.define "master0" do |node|
    node.vm.box = "centos-7.1"
    node.vm.network :private_network, ip: "192.168.33.12"
    node.vm.hostname = "master0"
    node.vm.network :forwarded_port,  guest: 3306, host: 3306
    node.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "256"]
      vb.customize ["modifyvm", :id, "--cpus",   "1"]
    end
  end

  # config.vm.define "master1" do |node|
  #   node.vm.box = "centos-7.1"
  #   node.vm.network :private_network, ip: "192.168.33.13"
  #   node.vm.hostname = "master1"
  #   node.vm.network :forwarded_port,  guest: 3306, host: 13306
  #   node.vm.provider "virtualbox" do |vb|
  #     vb.customize ["modifyvm", :id, "--memory", "256"]
  #     vb.customize ["modifyvm", :id, "--cpus",   "1"]
  #   end
  # end

  config.vm.define "slave0" do |node|
    node.vm.box = "centos-7.1"
    node.vm.network :private_network, ip: "192.168.33.14"
    node.vm.hostname = "slave0"
    node.vm.network :forwarded_port,  guest: 3306, host: 23306
    node.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "256"]
      vb.customize ["modifyvm", :id, "--cpus",   "1"]
    end
  end

  config.vm.define "slave1" do |node|
    node.vm.box = "centos-7.1"
    node.vm.network :private_network, ip: "192.168.33.15"
    node.vm.hostname = "slave1"
    node.vm.network :forwarded_port,  guest: 3306, host: 33306
    node.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "256"]
      vb.customize ["modifyvm", :id, "--cpus",   "1"]
    end
  end
end
