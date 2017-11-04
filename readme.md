# Getting started with Ansible

This Vagrant file will create a sandbox environment to develop  Ansible playbooks.  This environment will produce three virtual machines by default.  One will act as the Ansible control machine running CentOS 7 with Ansible installed.  The other two will act as the machines you wish to manage/test with your playbooks. One node runs CentOS 7 and the other Windows Server 2012 R2. The number of nodes for each OS can be adjusted by modifying the `(1..x).each do |i|` where x is the number of nodes you want to create. Just make sure you have enough resources for that many nodes :thumbsup:

## Requirements:

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](http://www.vagrantup.com/downloads.html)

###### Windows Only ######
- [git for Windows](https://git-for-windows.github.io/)

###### Select the below option in the installation wizard ######

![N|Solid](readme_images/git-install.png?raw=true)

## Steps:

1. Pull down this repository to your local workstation
2. `cd` into the root directory of this project
3. Run `vagrant up` to begin provisioning virtual machines
4. Once the virtual machines have been provisioned, run `vagrant ssh mgmt` to access the management box
5. Run `ansible windows -i /vagrant/inventory -m win_ping` to verify connectivity to Windows nodes and `ansible linux -i /vagrant/inventory -m ping` for Linux nodes
