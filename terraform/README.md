# Terraform
Use Terraform for `IaC` with **Proxmox**

## Installation
Install **Terraform** via `tfenv`
```shell
brew install tfenv
tfenv install 0.15.5
tfenv use 0.15.5
tfenv list
```

## Usage
For virtually all **Terraform** plans, don't forget to pass the Proxmox `password`:
```shell
export PM_PASS="UR-PASSWORD-GOES-HERE!"
terraform init
terraform plan
terraform apply
```
