# Build Proxmox Templates via Packer

Build **Proxmox** VM templates with Packer

### Installation
Install **packer**:
```shell
brew install packer
packer version
```

Symlink secret values from `terraform` folder into `magic`/`autoloading` variables file
```shell
cd packer
ln -s ../terraform/proxmox.auto.tfvars proxmox.auto.pkrvars.hcl
```

### Usage
**build** script:
```shell
$> ./build -h

Usage: build --node <NODE> --template <TEMPLATE>

Parameters:
--node|-n <NODE>:
  Available node(s): macmini1 macmini2 macmini3

--template|-t <TEMPLATE>:
  Available templates(s): ubuntu-22-04-iso ubuntu-20-04-iso
```


Build **Ubuntu 22.04** Proxmox template on `macmini1` node:
```shell
./build -n macmini1 -t ubuntu-22-04-iso
```
