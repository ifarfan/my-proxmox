locals {
  hostname     = "homelab"
  description  = "Homelab LXC"
  cores        = 4
  memory       = 8192
  onboot       = true
  unprivileged = false # privileged = true
  ip           = "192.168.136.25"

  # Disks
  rootfs_size = "20G"
  mountpoint = {
    mp   = "/var/lib/docker"
    size = "30G"
  }

  # Launch in this Proxmox node
  target_node = "macmini3"

  # Additional DNS aliases/CNAMEs
  dns_aliases = [
    "dozzle",
    "grafana",
    "homer",
    "loki",
    "minio",
    "n8n",
    "outline",
    "prometheus",
    "snippet-box",
    "speedtest-tracker",
    "traefik",
    "uptime-kuma",
    "portainer",
    "homepage",
    "wud",
    "bookstack",
    "linkace",
    "joplin",
    "wallabag",
    "home-assistant",
    "linkding",
    "rustdesk",
    "navidrome",
    "guacamole",
    "swingmusic",
  ]
}


