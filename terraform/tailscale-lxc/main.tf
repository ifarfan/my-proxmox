module "my_lxc" {
  source = "../modules/lxc"

  # ? Secrets
  proxmox_api_url      = var.proxmox_api_url
  proxmox_user         = var.proxmox_user
  proxmox_password     = var.proxmox_password
  cloudflare_api_token = var.cloudflare_api_token

  # ? LXC Settings
  hostname    = local.hostname
  description = local.description

  cores        = local.cores
  dns_aliases  = local.dns_aliases
  ip           = local.ip
  memory       = local.memory
  mountpoint   = local.mountpoint
  onboot       = local.onboot
  rootfs_size  = local.rootfs_size
  target_node  = local.target_node
  unprivileged = local.unprivileged
  tags         = local.tags
}
