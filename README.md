## ansible-Php5.6-mysql5.7

### Overview

- FOR CENTOS

easy setup nginx/php/mysql application


### Installation

Please perform the following steps to run

install [vitrualbox](https://www.virtualbox.org/)

```
brew install vagrant
brew install ansible
```

### usage

all setup

```
vagrant up
```

ansible-playbook only run

```
ansible-playbook -i hosts playbook.yml
```
