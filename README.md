## Ansible In Vagrant
Demo repository to demonstrate how to use Ansible.

## Requirements
* Virtualbox installed: https://www.virtualbox.org/wiki/Downloads
* Hashcorp Vagrant installed: https://www.vagrantup.com/downloads
* SSH KeyPair to be injected into Linux boxes. Stored in `provision/files/ansible_id_rsa` and `provision/files/ansible_id_rsa.pub`.

## Instructions

To simplify to installation process 5 Vagrant Boxes will be used, as defined in the `nodes.yaml` file, change the ip address or memory settings.

```yaml
- name: ansible-server
  box: debian/buster64
  ip: 192.168.39.10
  memory: 1024
  config: scripts/config-ansible.sh
- name: centos1
  box: centos/8
  ip: 192.168.39.11
  memory: 512
  config: scripts/config-centos.sh
- name: centos2
  box: centos/8 
  ip: 192.168.39.12
  memory: 512
  config: scripts/config-centos.sh
- name: ubuntu1
  box: ubuntu/focal64
  ip: 192.168.39.13
  memory: 512
  config: scripts/config-ubuntu.sh
- name: ubuntu2
  box: ubuntu/focal64
  ip: 192.168.39.14
  memory: 512
  config: scripts/config-ubuntu.sh
```

### Provision instructions

1. Download and install **Vagrant** from https://www.vagrantup.com/downloads

2. Clone the git repo
```
git clone https://github.com/devopshouse/ansible-in-vagrant.git
```

3.  Enter repo dir
```
cd ansible-in-vagrant/provision
```

4. Generate SSH KeyPair
```
ssh-keygen -t rsa -f files/ansible_id_rsa
```

5. Provision the required infrastructure with Vagrant
```
vagrant up
```

### Ansible Server Configuration
The Ansible Server initial installation and configuration process was done by the bootstrap scripts **bootstrap-ansible.sh**. The Ansible target nodes were configured using the **bootstrap-centos.sh** and **bootstrap-ubuntu.sh** bootstrap script.


### Test Puppet Agent Communication
1. SSH into Ansible Server
```
vagrant ssh ansible-server
```

2. Enter Ansible samples playbooks
```
cd ansible-samples
```

3. Test Ansible master playbook
```
ansible-playbook playbook-master.yml
```
