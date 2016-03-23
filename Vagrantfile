# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.5"

# Check to determine whether we're on a windows or linux/os-x host,
def which(cmd)
    exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
    ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
        exts.each { |ext|
            exe = File.join(path, "#{cmd}#{ext}")
            return exe if File.executable? exe
        }
    end
    return nil
end

Vagrant.configure(2) do |config|

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

  if which('ansible-playbook')
    config.vm.provision :ansible do |ansible|
      ansible.limit = "all"
      ansible.inventory_path = "hosts"
      ansible.playbook = "ansible/playbook.yml"
    end
  else
      config.vm.provision :shell, path: "ansible/windows.sh", args: ["vagrant"]
  end

end
