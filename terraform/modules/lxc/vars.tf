# User-defined variables
variable "hostname" {
  type = string
}

variable "description" {
  type = string
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 4096
}

variable "onboot" {
  type    = bool
  default = true
}

variable "unprivileged" {
  type    = bool
  default = true
}

variable "ip" {
  type = string
}

variable "rootfs_size" {
  type    = string
  default = "2G"
}

variable "mountpoint" {
  type = object({
    mp   = string
    size = string
  })
  default = {
    mp   = "/var/lib/docker"
    size = "8G"
  }
}

# Proxmox overwriteable values
variable "pm_node" {
  type    = string
  default = "m1"
}

variable "target_node" {
  type    = string
  default = "macmini1"
}

locals {
  domain          = "macminis.net"
  github_username = "ifarfan"

  # ? Proxmox
  pm_api_url = "https://${var.pm_node}.${local.domain}:8006/api2/json"
  pm_user    = "root@pam"

  # ? LXC machine
  hostname    = "${var.hostname}.${local.domain}"
  description = var.description

  cores           = var.cores
  memory          = var.memory
  onboot          = var.onboot
  ostemplate      = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  ssh_public_keys = join("\n", data.github_user.my_username.ssh_keys)
  start           = true
  unprivileged    = var.unprivileged

  rootfs = {
    size    = var.rootfs_size
    storage = "local-lvm"
  }

  mountpoint = {
    key     = "0"
    slot    = 0
    storage = "local-lvm"
    mp      = var.mountpoint.mp
    size    = var.mountpoint.size
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
