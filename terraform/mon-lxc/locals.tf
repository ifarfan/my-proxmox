locals {
  hostname     = "mon-lxc"
  description  = "monitoring LXC"
  cores        = 4
  memory       = 8192
  onboot       = true
  unprivileged = false # privileged = true
  tags         = "mon"
  ip           = "192.168.136.25"

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
    "traefik-mon-lxc",
    "backrest-mon-lxc",
  ]
}
