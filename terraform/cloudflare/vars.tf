variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

locals {
  domain = "macminis.net"

  # ? "A" DNS records
  as = [
    {
      desc  = "macmini1 proxmox node",
      name  = "m1",
      value = "192.168.136.11"
    },
    {
      desc  = "macmini2 proxmox node",
      name  = "m2",
      value = "192.168.136.12"
    },
    {
      desc  = "macmini3 proxmox node",
      name  = "m3",
      value = "192.168.136.13"
    },
    {
      desc  = "www for Cloudflare",
      name  = "www",
      value = "192.168.136.11"
    },
    {
      desc  = "root for Cloudflare",
      name  = "macminis.net",
      value = "192.168.136.11"
    },
    {
      desc  = "DS0 NAS",
      name  = "ds0",
      value = "192.168.136.20"
    },
    {
      desc  = "DS1 NAS port 1",
      name  = "ds1",
      value = "192.168.136.21"
    },
    {
      desc  = "Oracle Cloud box",
      name  = "cloudy-box",
      value = "150.136.116.1"
    }
  ]

  # ? "CNAME" DNS records
  cnames = [
    {
      desc  = "Synology NAS",
      name  = "nas",
      value = "ds1.${local.domain}"
    },
    {
      desc  = "Plex on NAS via traefik",
      name  = "plex",
      value = "homelab.${local.domain}"
    },
  ]
}
