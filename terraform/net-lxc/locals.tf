locals {
  hostname     = "net-lxc"
  description  = "net LXC"
  cores        = 4
  memory       = 8192
  onboot       = true
  unprivileged = false # privileged = true
  tags         = "net"
  ip           = "192.168.136.23"

  # Disks
  rootfs_size = "30G"
  mountpoint = [
    {
      mp   = "/var/lib/docker"
      size = "8G"
    },
    {
      mp   = "/opt"
      size = "50G"
    }
  ]

  # Launch in this Proxmox node
  target_node = "macmini1"

  # Additional DNS aliases/CNAMEs
  dns_aliases = [
    "traefik-net-lxc",
    "portainer-net-lxc",
    "rustdesk"
  ]
}
