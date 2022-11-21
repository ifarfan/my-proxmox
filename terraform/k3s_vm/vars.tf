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

  # ? k3s servers
  servers = [
    {
      hostname    = "k3s-server-01",
      description = "k3s Server 01",
      target_node = local.proxmox_nodes.0,
      ip          = "192.168.136.41"
    },
    {
      hostname    = "k3s-server-02",
      description = "k3s Server 02",
      target_node = local.proxmox_nodes.1,
      ip          = "192.168.136.42"
    },
    {
      hostname    = "k3s-server-03",
      description = "k3s Server 03",
      target_node = local.proxmox_nodes.2,
      ip          = "192.168.136.43"
    }
  ]

  # ? k3s agents
  agents = [
    {
      hostname    = "k3s-agent-01",
      description = "k3s Agent 01",
      target_node = local.proxmox_nodes.0,
      ip          = "192.168.136.44"
    },
    {
      hostname    = "k3s-agent-02",
      description = "k3s Agent 02",
      target_node = local.proxmox_nodes.1,
      ip          = "192.168.136.45"
    },
    {
      hostname    = "k3s-agent-03",
      description = "k3s Agent 03",
      target_node = local.proxmox_nodes.2,
      ip          = "192.168.136.46"
    }
  ]

  # ? k3s data/storage
  data = [
    {
      hostname    = "k3s-data-01",
      description = "k3s Data 01",
      target_node = local.proxmox_nodes.0,
      ip          = "192.168.136.47"
    },
    {
      hostname    = "k3s-data-02",
      description = "k3s Data 02",
      target_node = local.proxmox_nodes.1,
      ip          = "192.168.136.48"
    },
    {
      hostname    = "k3s-data-03",
      description = "k3s Data 03",
      target_node = local.proxmox_nodes.2,
      ip          = "192.168.136.49"
    }
  ]

  # ? VM defaults
  boot       = "cdn" # boot order: hard disk (c), CD-ROM (d), or network (n)
  gw_ip      = "192.168.136.1"
  onboot     = true # start at boot
  os_type    = "cloud-init"
  qemu_agent = 1
  sockets    = 1
  sshkeys    = join("\n", data.github_user.my_username.ssh_keys)
  tags       = "Terraform"
  template   = "ubuntu-22-04-iso-tmpl"

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
    type   = "vmware"
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

  # ? VM "data" overrides
  datum = {
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

  # ? DNS kube-vip record
  kube_vip_dns_record = {
    name  = "k3s",
    value = "192.168.136.40"
  }
}
