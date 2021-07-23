# Build Proxmox Templates via Packer

Build **Proxmox** VM templates

## Installation
Install **packer**:
```shell
brew install packer
packer version
```

## Usage
**build** script:
```shell
$> ./build -h

Usage: build --node <NODE> --template <TEMPLATE>

Parameters:
--node|-n <NODE>:
  Available node(s): macmini1 macmini2 macmini3

--template|-t <TEMPLATE>:
  Available templates(s): ubuntu-20-04
```


Build **Ubuntu** template on `macmini1` noder:
```shell
./build -n macmini1 -t ubuntu-20-04
```
