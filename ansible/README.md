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
task proxmox:provision-nodes

# Reboot all proxmox boxes sequentially
task proxmox:reboot-nodes
```

### 2. `LXCs`
#### Inventory
Dynamic inventory for `ALL` LXCs located at `inventories/proxmox`
**NOTE**: all servers are self-contained LXCs running multiple `docker compose` stacks

#### Actions

```shell
# To provision `apps-lxc` stack from scratch
task apps-lxc:provision

# Update specific docker compose stack ONLY
task apps-lxc:provision-booklore
task apps-lxc:provision-dozzle
task apps-lxc:provision-homepage
task apps-lxc:provision-jotty
task apps-lxc:provision-portainer
task apps-lxc:provision-termix
```

### 3. `RPis`
#### Inventory
Dynamic inventory for `rpis` located at
- `inventories/rpi-local` when RPis are freshly booted and untouched
- `inventories/rpi` once provisioned

#### Actions

```shell
# On 1st boot, pre-provision RPIs (needed only once)
task rpi:pre-provision-rpis

# From then on, use the regular "provision" command
task rpi:provision-rpis
```
