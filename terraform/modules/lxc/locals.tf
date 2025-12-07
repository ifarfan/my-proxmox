locals {
  # ? Global variables
  domain          = "macminis.net"
  github_username = "ifarfan"

  # ? LXC machine
  hostname    = "${var.hostname}.${local.domain}"
  description = var.description

  cores      = var.cores
  memory     = var.memory
  onboot     = var.onboot
  ostemplate = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  # ostemplate      = "local:vztmpl/ubuntu-24.04-default_amd64.tar.xz"
  ssh_public_keys = join("\n", data.github_user.my_username.ssh_keys)
  start           = true
  unprivileged    = var.unprivileged
  tags            = var.tags == "" ? "terraform" : "${var.tags};terraform"

  rootfs = {
    size    = var.rootfs_size
    storage = "local-lvm"
  }

  network = {
    name     = "eth0"
    bridge   = "vmbr0"
    firewall = true
    gw       = "192.168.136.1"
    ip       = "${var.ip}/32"
  }

  features = {
    keyctl  = true
    nesting = true
  }

  # ? DNS record
  dns_record = {
    ip   = var.ip,
    name = var.hostname,
    ttl  = 1, # auto
    type = "A"
  }
}
