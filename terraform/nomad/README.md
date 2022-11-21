# Nomad

Launch a **nomad** cluster
- Create multiple `Proxmox` **VMs**
- Create corresponding **DNS records** on `Cloudflare`

Comprised of `2` types of nodes:
- `server`:  **3** medium VMs w/ *ephemeral data*
- `agent`:   **3** large VMs w/ *ephemeral data*
