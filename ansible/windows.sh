#!/usr/bin/env bash
sudo yum -y groupinstall "Development Tools"
sudo yum -y install gcc python-devel
sudo curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
sudo python get-pip.py
sudo pip install ansible

# Setup Ansible for Local Use and Run
cat /vagrant/ansible/files/authorized_keys >> /home/vagrant/.ssh/authorized_keys
sudo ansible-playbook /vagrant/ansible/playbook.yml -e hostname=$1 --connection=local