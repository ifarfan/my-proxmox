# k3s

Launch a `k3s` **kubernetes** cluster infrastructure
- Create multiple `Proxmox` **LXCs**
- Create corresponding **DNS records** on `Cloudflare`

Comprised of `3` types of nodes:
- `server`: **3** small LXCs w/ *control plane*
- `agent`:  **3** large LXCs w/ *ephemeral data*
- `data`:   **3** medium LXCs w/ *persitant data via longhorn*

#### Terraform provisioning
```shell
# Set environment variables
export CLOUDFLARE_API_TOKEN="my-super-duper-api-token-goes-here"
export PM_PASS="my-super-duper-password-goes-here"

# To launch stack
terraform init
terraform plan
terraform apply -auto-approve

# To destroy stack
terraform destroy -auto-approve
```
