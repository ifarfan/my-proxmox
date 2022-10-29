# My-Proxmox
My **Proxmox** setup + diverse accoutrements

- Configure + manage **Proxmox** nodes via `Ansible`
- Create VMs + LXC containers via `Terraform`
- Manage VMs + LXC containers via `Ansible`
- Create VM templates via `Packer`
- Launch kubernetes clusters via `Terraform` + perform initial configuration via `Ansible`


### Hardware
Currently running `3` macminis as a `Proxmox` cluster

```shell
macmini1:
  Model:  Macmini5,3
  Memory: 16GB
  CPU:    8 logical / 4 CPUs x Intel(R) Core(TM) i7-2635QM CPU @ 2.00GHz
  Disk:   250GB SSD
  IP:     192.168.136.11
  MAC:    3c:07:54:72:4d:27

macmini2:
  Model:  Macmini6,1
  Memory: 8GB
  CPU:    4 logical / 2 CPUs x Intel(R) Core(TM) i5-3210M CPU @ 2.50GHz
  Disk:   250GB SSD
  IP:     192.168.136.12
  MAC:    68:5b:35:85:fa:fa

macmini3:
  Model:  Macmini6,2
  Memory: 16GB
  CPU:    8 logical / 4 CPUs x Intel(R) Core(TM) i7-3615QM CPU @ 2.30GHz
  Disk:   1TB SSD
  IP:     192.168.136.13
  MAC:    0c:4d:e9:b2:43:ff

```

### Runbooks
1. All operations have been encapsulated into **tasks**:
   ```shell
   # From repo root
   task --list
   ```

### Notes
1. Enable LetsEncrypt certificates for Proxmox nodes:
   [https://www.smarthomebeginner.com/proxmox-ssl-certificate-with-letsencrypt/](https://www.smarthomebeginner.com/proxmox-ssl-certificate-with-letsencrypt/)
