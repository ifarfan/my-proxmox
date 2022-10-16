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
      desc  = "DS1 NAS port 1",
      name  = "ds1",
      value = "192.168.136.21"
    },
    {
      desc  = "k3s kube-vip",
      name  = "k3s",
      value = "192.168.136.30"
    },
    {
      desc  = "k3os kube-vip",
      name  = "k3os",
      value = "192.168.136.40"
    },
    {
      desc  = "Oracle Cloud box",
      name  = "cloudybox",
      value = "150.136.116.1"
    }
  ]

  # ? "CNAME" DNS records
  cnames = [
    {
      desc  = "Synology NAS",
      name  = "nas",
      value = "portainer.${local.domain}"
    },
    {
      desc  = "Synology NAS",
      name  = "plex",
      value = "portainer.${local.domain}"
    },
    {
      desc  = "Traefik reverse proxy",
      name  = "traefik",
      value = "portainer.${local.domain}"
    },
    {
      desc  = "Heimdall dashboard",
      name  = "heimdall",
      value = "portainer.${local.domain}"
    },
    {
      desc  = "Uptime-kuma monitoring",
      name  = "kuma",
      value = "portainer.${local.domain}"
    },
    {
      desc  = "Grafana monitoring",
      name  = "grafana",
      value = "portainer.${local.domain}"
    },
    {
      desc  = "Prometheus monitoring",
      name  = "prometheus",
      value = "portainer.${local.domain}"
    },
    {
      desc  = "Dashy home dashboard",
      name  = "dashy",
      value = "portainer.${local.domain}"
    },
    {
      desc  = "Loki log aggregation",
      name  = "loki",
      value = "portainer.${local.domain}"
    }
  ]
}
