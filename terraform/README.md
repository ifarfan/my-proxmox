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
For virtually all **Terraform** plans, from `terraform` root folder:

1. Create `template` folder + symlink appropriate secret values files
   ```shell
   mkdir new-template && cd new-template
   ln -s ../proxmox.auto.tfvars    proxmox.auto.tfvars
   ln -s ../cloudflare.auto.tfvars cloudflare.auto.tfvars
   ```
2. Copy template contents and edit accordingly:

   Template code for `main.tf`
   ```ruby
   cat > main.tf <<EOF
   module "<< NAME_THIS_STACK >>" {
     source = "../modules/stacks"

     mac1_vms = local.mac1_vms
     mac2_vms = local.mac2_vms
     mac3_vms = local.mac3_vms
   }
   EOF
   ```

   Template code for `vars.tf`
   ```ruby
   cat > vars.tf <<EOF
   variable "proxmox_pwd" {
     type = string
   }

   locals {
     mac1_vms = [
       {
         name        = "server_1",
         description = "server 1",
         cores       = 1,
         memory      = 1024,
         disk        = "16G",
         ip          = "192.168.136.XXX"
       },
       [...]
     ]

     mac2_vms = []
     mac3_vms = []
   }
   EOF
   ```
   :warning: **NOTE**:
   - Ensure `ip` addresses are unique per `VM`
   - Combined `cores`, `memory` and `disk` values don't exceed each **Proxmox** `node` capacity

1. Proceed with `Terrafom` as usual
   ```shell
   tf init
   tf validate && tf fmt
   tf plan -compact-warnings
   tf apply -auto-approve
   ```

## Notes
- Password variables are stored under `terraform.tfvars` and are invoked automatically
- Use `terraform.tfvars.sample` as a reference file
- **NOTE**: ensure they are never checked into **git** :warning:


## Troubleshooting
- To enable `Terraform` debugging:
  `export TF_LOG=TRACE`
- To disable `Terraform` debugging:
  ` export TF_LOG=ERROR`
- Error messages will show under `terraform/logs/NODE_X.log`
