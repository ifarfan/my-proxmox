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

resource "cloudflare_record" "dns_record" {
  zone_id = lookup(data.cloudflare_zones.domain_zone.zones[0], "id")
  name    = local.dns_record.name
  value   = local.dns_record.ip
  type    = local.dns_record.type
  ttl     = local.dns_record.ttl
}
