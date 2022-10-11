locals {
  hostname     = "portainer"
  description  = "The man, the legend"
  cores        = 4
  memory       = 8192
  onboot       = true
  unprivileged = false # privileged = true
  ip           = "192.168.136.23"

  # Disks
  rootfs_size = "4G"
  mountpoint = {
    mp   = "/var/lib/docker"
    size = "20G"
  }

  # Launch in this Proxmox node
  target_node = "macmini3"
}
