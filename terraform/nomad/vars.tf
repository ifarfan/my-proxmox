# Fetch values from terraform.tfvars
variable "proxmox_api_url" {
  type = string
}

variable "proxmox_user" {
  type = string
}

variable "proxmox_password" {
  type      = string
  sensitive = true
}

variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

locals {
  # ?
  # ? Global variables
  # ?
  domain          = "macminis.net"
  github_username = "ifarfan"

  # ? Proxmox servers
  proxmox_nodes = [
    "macmini1",
    "macmini2",
    "macmini3"
  ]

  # ? nomad servers
  servers = [
    {
      hostname    = "nomad-server-01",
      description = "Nomad Server 01",
      target_node = local.proxmox_nodes.0,
      ip          = "192.168.136.51"
    },
    {
      hostname    = "nomad-server-02",
      description = "Nomad Server 02",
      target_node = local.proxmox_nodes.1,
      ip          = "192.168.136.52"
    },
    {
      hostname    = "nomad-server-03",
      description = "Nomad Server 03",
      target_node = local.proxmox_nodes.2,
      ip          = "192.168.136.53"
    }
  ]

  # ? nomad agents
  agents = [
    {
      hostname    = "nomad-agent-01",
      description = "Nomad Agent 01",
      target_node = local.proxmox_nodes.0,
      ip          = "192.168.136.54"
    },
    {
      hostname    = "nomad-agent-02",
      description = "Nomad Agent 02",
      target_node = local.proxmox_nodes.1,
      ip          = "192.168.136.55"
    },
    {
      hostname    = "nomad-agent-03",
      description = "Nomad Agent 03",
      target_node = local.proxmox_nodes.2,
      ip          = "192.168.136.56"
    }
  ]

  # ? VM defaults
  boot         = "cdn" # boot order: hard disk (c), CD-ROM (d), or network (n)
  force_create = false
  gw_ip        = "192.168.136.1"
  nameserver   = "1.1.1.1, 1.0.0.1"
  onboot       = true # start at boot
  os_type      = "cloud-init"
  qemu_agent   = 1
  sockets      = 1
  sshkeys      = join("\n", data.github_user.my_username.ssh_keys)
  tags         = "Terraform"
  template     = "ubuntu-22-04-iso-tmpl"

  disk = {
    scsihw  = "virtio-scsi-pci"
    storage = "local-lvm"
    type    = "scsi"
  }

  network = {
    bridge = "vmbr0"
    model  = "virtio"
  }

  vga = {
    memory = 32
    type   = "qxl"
  }

  # ? VM "server" overrides
  server = {
    cores  = 1,
    memory = 3072,

    disk = {
      size = "8G"
    }
  }

  # ? VM "agent" overrides
  agent = {
    cores  = 4,
    memory = 8192,

    disk = {
      size = "20G"
    }
  }

  # ? DNS record defaults
  dns_record = {
    ttl  = 3600,
    type = "A"
  }
}
