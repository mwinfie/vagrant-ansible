# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # create a centos 7 vm with ansible
  config.vm.define :mgmt do |mgmt_config|
    mgmt_config.vm.box = "geerlingguy/centos7"
    mgmt_config.vm.hostname = "mgmt"
    mgmt_config.vm.network :private_network, ip: "10.0.15.10"
    mgmt_config.vm.provider "virtualbox" do |vb|
      vb.memory = "256"
    end
    mgmt_config.vm.synced_folder "../", "/git"
    mgmt_config.vm.provision :shell, path: "bootstrap-mgmt.sh"
  end
 
  # create some centos 7 vms
  (1..1).each do |i|
    config.vm.define "linnode#{i}" do |node|
      node.vm.box = "geerlingguy/centos7"
      node.vm.hostname = "linnode#{i}"
      node.vm.network :private_network, ip: "10.0.15.2#{i}"
      node.vm.network "forwarded_port", guest: 80, host: "908#{i}", auto_correct: true
      node.vm.network "forwarded_port", guest: 443, host: "943#{i}", auto_correct: true
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
		  config.vm.provision :shell, path: "bootstrap-linnode.sh"
    end
  end

  # create some windows server 2012 r2 vms
  (1..1).each do |i|
    config.vm.define "winnode#{i}" do |node|
      node.vm.box = "mwinfie/eval-win2012r2-standard"
      node.vm.hostname = "winnode#{i}"
      node.vm.communicator = "winrm"
      node.vm.network :private_network, ip: "10.0.15.3#{i}"
      node.vm.network "forwarded_port", guest: 80, host: "1008#{i}", auto_correct: true
      node.vm.network "forwarded_port", guest: 443, host: "1004#{i}", auto_correct: true
      node.vm.network "forwarded_port", guest: 3389, host: "3389#{i}", auto_correct: true
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
      end
      config.vm.provision :shell, path: "bootstrap-winnode.ps1"
      config.vm.provision :shell, path: "ConfigureRemotingForAnsible.ps1"
    end
  end

end
