# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.provider :virtualbox do |v|
      v.name = "vagrant"
      v.customize [
          "modifyvm", :id,
          "--name", "default",
          "--memory", 1024,
          "--natdnshostresolver1", "on",
          "--cpus", 1,
      ]
  end

  # select  box
  config.vm.box = "rafacas/centos71-plain"

  # set virtual machine name
  config.vm.hostname = 'vagrant'

  # sync folder
  config.vm.synced_folder "../","/var/wwwroot",
                          type: 'nfs'

  # set private network ip
  config.vm.define :private_node do |node|
    config.vm.network "private_network", ip: "192.168.33.10"
  end

  # disable update ssh key pair
  config.ssh.insert_key = false

  config.vm.provision :ansible do |ansible|
    ansible.limit = "all"
    ansible.inventory_path = "hosts"
    ansible.playbook = "ansible/playbook.yml"
  end
end
