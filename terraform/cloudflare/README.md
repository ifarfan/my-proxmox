# Cloudflare

Manage `cloudflare` via Terraform

#### API Token
Get it here: [https://dash.cloudflare.com/profile/api-tokens](https://dash.cloudflare.com/profile/api-tokens)

#### Terraform provisioning
```shell
# Pass API token prior to execution
export CLOUDFLARE_API_TOKEN=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

# To launch stack
terraform init
terraform fmt && terraform validate
terraform plan
terraform apply -auto-approve

# To destroy stack
terraform destroy -auto-approve
```
