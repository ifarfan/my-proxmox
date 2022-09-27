
resource "proxmox_lxc" "yatch" {
  hostname    = local.hostname
  description = local.description
  target_node = local.target_node

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

  mountpoint {
    key     = local.mountpoint.key
    slot    = local.mountpoint.slot
    storage = local.mountpoint.storage
    mp      = local.mountpoint.mp
    size    = local.mountpoint.size
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
