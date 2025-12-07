locals {
  hostname     = "devbox-lxc"
  description  = "DevBox LXC"
  cores        = 6
  memory       = 12288
  onboot       = true
  unprivileged = false # privileged = true
  tags         = "dev"
  ip           = "192.168.136.28"

  # Disks
  rootfs_size = "50G"
  mountpoint = [
    {
      mp   = "/var/lib/docker"
      size = "30G"
    }
  ]

  # Launch in this Proxmox node
  target_node = "macmini1"

  # Additional DNS aliases/CNAMEs
  dns_aliases = []
}
