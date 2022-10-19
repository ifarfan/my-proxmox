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

  # ? k3os servers
  servers = [
    {
      hostname    = "k3os-server-01",
      description = "k3os Server 01",
      target_node = local.proxmox_nodes.0,
      ip          = "192.168.136.41"
    },
    {
      hostname    = "k3os-server-02",
      description = "k3os Server 02",
      target_node = local.proxmox_nodes.1,
      ip          = "192.168.136.42"
    },
    {
      hostname    = "k3os-server-03",
      description = "k3os Server 03",
      target_node = local.proxmox_nodes.2,
      ip          = "192.168.136.43"
    }
  ]

  # ? k3os agents
  agents = [
    {
      hostname    = "k3os-agent-01",
      description = "k3os Agent 01",
      target_node = local.proxmox_nodes.0,
      ip          = "192.168.136.44"
    },
    {
      hostname    = "k3os-agent-02",
      description = "k3os Agent 02",
      target_node = local.proxmox_nodes.1,
      ip          = "192.168.136.45"
    },
    {
      hostname    = "k3os-agent-03",
      description = "k3os Agent 03",
      target_node = local.proxmox_nodes.2,
      ip          = "192.168.136.46"
    }
  ]

  # ? k3os data/storage
  data = [
    {
      hostname    = "k3os-data-01",
      description = "k3os Data 01",
      target_node = local.proxmox_nodes.0,
      ip          = "192.168.136.47"
    },
    {
      hostname    = "k3os-data-02",
      description = "k3os Data 02",
      target_node = local.proxmox_nodes.1,
      ip          = "192.168.136.48"
    },
    {
      hostname    = "k3os-data-03",
      description = "k3os Data 03",
      target_node = local.proxmox_nodes.2,
      ip          = "192.168.136.49"
    }
  ]

  # ? VM defaults
  iso      = "/mnt/pve/remote-nfs/template/iso/k3os-amd64.iso"
  scsihw   = "virtio-scsi-pci"
  onboot   = true  # start VM on node boot
  oncreate = false # start VM after creation
  os_type  = "Linux 5.x - 2.6 Kernel"

  disk = {
    type    = "virtio"
    storage = "local-lvm"
  }

  network = {
    bridge   = "vmbr0"
    firewall = true
    model    = "virtio"
  }


  # ? VM "server" overrides
  server = {
    cores  = 1,
    memory = 2048,

    disk = {
      size = "4G"
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
    name  = "k3os",
    value = "192.168.136.40"
  }
}
