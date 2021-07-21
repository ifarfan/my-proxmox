# Build Proxmox Templates via Packer
Pass the proxmox `root` password via the `PROXMOX_PWD` environment variable at the command prompt

####  Build Ubuntu 20.04 template
```shell
read -s -p "Proxmox root password: " hold_pwd
PACKER_LOG=1 PACKER_LOG_PATH=logs/packer_hcl.log packer build -timestamp-ui -force -var proxmox_password=${hold_pwd} ubuntu_20.04.pkr.hcl
```

#### Requirements
- Ensure `packer` is installed
- Ensure ISO files specified under `variables`.`iso_filename` are present under folder `/var/lib/vz/templates/iso`
