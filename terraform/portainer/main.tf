module "my_lxc" {
  source = "../modules/lxc"

  hostname     = local.hostname
  description  = local.description
  cores        = local.cores
  memory       = local.memory
  onboot       = local.onboot
  unprivileged = local.unprivileged
  ip           = local.ip
  rootfs_size  = local.rootfs_size
  mountpoint   = local.mountpoint
  target_node  = local.target_node
}
