# Talos Cluster

Create `talos` stack of **3** servers and **6** agents on `proxmox` cluster

Ensure `terraform.tfvars` is symlink-ed to the copy on `terraform\`

#### Terraform provisioning
```shell
# To launch stack
terraform init
terraform plan -compact-warnings
terraform apply -auto-approve

# To destroy stack
terraform destroy -auto-approve -compact-warnings
```
