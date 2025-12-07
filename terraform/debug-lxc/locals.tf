locals {
  hostname     = "debug-lxc"
  description  = "Debug LXC"
  cores        = 2
  memory       = 2048
  onboot       = true
  unprivileged = false # privileged = true
  tags         = "dev"
  ip           = "192.168.136.24"

  # Disks
  rootfs_size = "20G"
  mountpoint = [
    {
      mp   = "/var/lib/docker"
      size = "10G"
    }
  ]

  # Launch in this Proxmox node
  target_node = "macmini2"

  # Additional DNS aliases/CNAMEs
  dns_aliases = []
}
