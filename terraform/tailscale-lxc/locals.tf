locals {
  hostname     = "tailscale-lxc"
  description  = "Tailscale LXC"
  cores        = 1
  memory       = 2048
  onboot       = true
  unprivileged = false # privileged = true
  tags         = "apps"
  ip           = "192.168.136.25"

  # Disks
  rootfs_size = "20G"
  mountpoint = [
    {
      mp   = "/var/lib/docker"
      size = "20G"
    }
  ]

  # Launch in this Proxmox node
  target_node = "macmini1"

  # Additional DNS aliases/CNAMEs
  dns_aliases = []
}
