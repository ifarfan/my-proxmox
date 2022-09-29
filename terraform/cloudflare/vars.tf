locals {
  domain = "macminis.net"

  # ? Macminis
  macminis = [
    {
      desc = "macmini1 proxmox node",
      ip   = "192.168.136.11",
      name = "m1",
      ttl  = 1, # auto
      type = "A"
    },
    {
      desc = "macmini2 proxmox node",
      ip   = "192.168.136.12",
      name = "m2",
      ttl  = 1, # auto
      type = "A"
    },
    {
      desc = "macmini3 proxmox node",
      ip   = "192.168.136.13",
      name = "m3",
      ttl  = 1, # auto
      type = "A"
    }
  ]

  # ? Other DNS records
  www = {
    desc = "www for Cloudflare",
    ip   = local.macminis[0].ip,
    name = "www",
    ttl  = 3600,
    type = "A"
  }

  root = {
    desc = "root for Cloudflare",
    ip   = local.macminis[0].ip,
    name = "@",
    ttl  = 3600,
    type = "A"
  }

  portainer = {
    desc = "portainer lxc",
    ip   = "192.168.136.70",
    name = "portainer",
    ttl  = 3600,
    type = "A"
  }

  nas = {
    desc = "DS1 NAS port 1",
    ip   = "192.168.136.21",
    name = "ds1",
    ttl  = 3600,
    type = "A"
  }
}
