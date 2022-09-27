variable "pm_api_url" {
  type    = string
  default = "https://192.168.136.11:8006/api2/json"
}

variable "pm_user" {
  type    = string
  default = "root@pam"
}

locals {
  # ? LXC defaults
  hostname    = "portainer"
  description = "Portainer, the legend"
  target_node = "macmini1"

  cores           = 4
  memory          = 8192
  onboot          = true
  ostemplate      = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  ssh_public_keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIgjDNPF6qWWgfXWzXxrejnbX/HhXr4gMk0wKuJKLcJ9 ifarfan@gmx.com"
  start           = true
  unprivileged    = true

  rootfs = {
    size    = "2G"
    storage = "local-lvm"
  }

  mountpoint = {
    key     = "0"
    slot    = 0
    storage = "local-lvm"
    mp      = "/var/lib/docker"
    size    = "16G"
  }

  network = {
    name     = "eth0"
    bridge   = "vmbr0"
    firewall = true
    gw       = "192.168.136.1"
    ip       = "192.168.136.70/32"
  }

  features = {
    keyctl  = true
    nesting = true
  }
}
