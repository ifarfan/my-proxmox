resource "proxmox_vm_qemu" "vm" {
  hostname    = local.hostname
  description = local.description
  target_node = var.target_node


  memory          = local.memory
  onboot          = local.onboot
  ostemplate      = local.ostemplate
  ssh_public_keys = local.ssh_public_keys
  start           = local.start

  bios       = local.bios
  vm_state   = local.vm_state
  protection = local.protection
  agent      = local.agent
  scsihw     = local.scsihw
  tags       = local.tags
  os_type    = local.os_type

  cpu = {
    cores = local.cores
  }

  vga = {
    type = local.vga_type
  }

  network = {
    id     = local.network.id
    model  = local.network.model
    bridge = local.network.bridge
    mtu    = local.network.mtu
  }

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

  # network {
  #   name     = local.network.name
  #   bridge   = local.network.bridge
  #   firewall = local.network.firewall
  #   gw       = local.network.gw
  #   ip       = local.network.ip
  # }

  features {
    keyctl  = local.features.keyctl
    nesting = local.features.nesting
  }
}
