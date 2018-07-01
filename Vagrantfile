# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.synced_folder "./", "/home/vagrant/shared"

  config.puppet_install.puppet_version = :latest
  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "."
    puppet.options = ['--verbose']
  end
end

