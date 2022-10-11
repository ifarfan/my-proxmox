# Ansible

Use Ansible for all `configuration management` and `orchestration`

#### Setup
Install `proxmox` plugin, located within `community.general` collection:
```shell
ansible-galaxy collection install community.general
```

Plugin documentation:
[https://docs.ansible.com/ansible/latest/collections/community/general/proxmox_inventory.html](https://docs.ansible.com/ansible/latest/collections/community/general/proxmox_inventory.html)

Ensure that the following packages are installed:
```shell
python3 -m pip install docker
python3 -m pip install netaddr
python3 -m pip install proxmoxer
python3 -m pip install requests
```

#### Credentials
Ensure that contents of `credentials.ini` contain valid credentials, use `credentials.ini.sample` as a template –– these values drive all Ansible playbooks that interact with `proxmox` and `cloudflare`


## Stacks
### 1. `Proxmox`
#### Inventory
Dynamic inventory for `proxmox` boxes located at `inventories/macminis`

#### Actions

```shell
# To provision all proxmox boxes
ansible-playbook -i inventories/macminis macminis-provision.yml

# Reboot all proxmox boxes sequentially
ansible-playbook -i inventories/macminis macminis-reboot.yml
```


### 2. `k3s`
#### Inventory
Dynamic inventory for `k3s` lxc boxes under Proxmox located at `inventories/k3s`
Global values required during provisioning stored under `inventories/k3s/main.yml`

#### Actions

```shell
# To provision k3s stack from scratch
ansible-playbook -i inventories/k3s k3s-provision.yml

# Start all nodes in a staggered fashion
ansible-playbook -i inventories/k3s k3s-start.yml

# Reboot all nodes sequentially
ansible-playbook -i inventories/k3s k3s-reboot.yml

# Stop all nodes in a staggered fashion
ansible-playbook -i inventories/k3s k3s-stop.yml
```


### 3. `portainer`
#### Inventory
Dynamic inventory for `portainer` LXC located at `inventories/proxmox`
**NOTE**: portainer is a single, self-contained LXC running multiple `docker compose` stacks

#### Actions

```shell
# To provision portainer stack from scratch
ansible-playbook -i inventories/proxmox portainer-provision.yml

# Update specific docker compose ONLY
ansible-playbook -i inventories/proxmox portainer-provision.yml --tags traefik
ansible-playbook -i inventories/proxmox portainer-provision.yml --tags heimdall
ansible-playbook -i inventories/proxmox portainer-provision.yml --tags uptime_kuma
ansible-playbook -i inventories/proxmox portainer-provision.yml --tags portainer
ansible-playbook -i inventories/proxmox portainer-provision.yml --tags grafana
ansible-playbook -i inventories/proxmox portainer-provision.yml --tags prometheus
```
