resource "proxmox_lxc" "lxc" {
  hostname    = local.hostname
  description = local.description
  target_node = var.target_node

  cores           = local.cores
  memory          = local.memory
  onboot          = local.onboot
  ostemplate      = local.ostemplate
  ssh_public_keys = local.ssh_public_keys
  start           = local.start
  unprivileged    = local.unprivileged

  rootfs {
    storage = local.rootfs.storage
    size    = local.rootfs.size
  }

  dynamic "mountpoint" {
    for_each = var.mountpoint == null ? [] : [1]
    content {
      key     = local.mountpoint.key
      slot    = local.mountpoint.slot
      storage = local.mountpoint.storage
      mp      = var.mountpoint.mp
      size    = var.mountpoint.size
    }
  }

  network {
    name     = local.network.name
    bridge   = local.network.bridge
    firewall = local.network.firewall
    gw       = local.network.gw
    ip       = local.network.ip
  }

  features {
    keyctl  = local.features.keyctl
    nesting = local.features.nesting
  }
}
