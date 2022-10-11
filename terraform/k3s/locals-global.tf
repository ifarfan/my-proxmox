locals {
  # ?
  # ? Global variables
  # ?
  domain          = "macminis.net"
  github_username = "ifarfan"
  pm_node         = "m1"

  # ? Proxmox
  pm_api_url = "https://${local.pm_node}.${local.domain}:8006/api2/json"
  pm_user    = "root@pam"

  # ? LXC machine
  onboot          = true
  ostemplate      = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  ssh_public_keys = join("\n", data.github_user.my_username.ssh_keys)
  start           = true
  unprivileged    = false # privileged = true

  rootfs = {
    storage = "local-lvm"
  }

  mountpoint = {
    key     = "0"
    slot    = 0
    storage = "local-lvm"
  }

  network = {
    name     = "eth0"
    bridge   = "vmbr0"
    firewall = true
    gw       = "192.168.136.1"
  }

  features = {
    keyctl  = true
    nesting = true
  }

  # ? DNS record defaults
  dns_record = {
    ttl  = 3600,
    type = "A"
  }
}
