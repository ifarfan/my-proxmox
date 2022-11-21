# k3s

Launch a `k3s` **kubernetes** cluster infrastructure
- Create multiple `Proxmox` **VMs**
- Create corresponding **DNS records** on `Cloudflare`

Comprised of `3` types of nodes:
- `server`: **3** small VMs w/ *control plane*
- `agent`:  **3** large VMs w/ *ephemeral data*
- `data`:   **3** medium VMs w/ *persitant data via longhorn*
