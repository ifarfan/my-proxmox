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

  # ? Talos servers
  servers = [
    {
      hostname    = "talos-server-01",
      description = "Talos Server 01",
      target_node = local.proxmox_nodes.0,
      ip          = "192.168.136.31"
    },
    {
      hostname    = "talos-server-02",
      description = "Talos Server 02",
      target_node = local.proxmox_nodes.1,
      ip          = "192.168.136.32"
    },
    {
      hostname    = "talos-server-03",
      description = "Talos Server 03",
      target_node = local.proxmox_nodes.2,
      ip          = "192.168.136.33"
    }
  ]

  # ? Talos agents
  agents = [
    {
      hostname    = "talos-agent-01",
      description = "Talos Agent 01",
      target_node = local.proxmox_nodes.0,
      ip          = "192.168.136.34"
    },
    {
      hostname    = "talos-agent-02",
      description = "Talos Agent 02",
      target_node = local.proxmox_nodes.1,
      ip          = "192.168.136.35"
    },
    {
      hostname    = "talos-agent-03",
      description = "Talos Agent 03",
      target_node = local.proxmox_nodes.2,
      ip          = "192.168.136.36"
    }
  ]

  # ? Talos data/storage
  data = [
    {
      hostname    = "talos-data-01",
      description = "Talos Data 01",
      target_node = local.proxmox_nodes.0,
      ip          = "192.168.136.37"
    },
    {
      hostname    = "talos-data-02",
      description = "Talos Data 02",
      target_node = local.proxmox_nodes.1,
      ip          = "192.168.136.38"
    },
    {
      hostname    = "talos-data-03",
      description = "Talos Data 03",
      target_node = local.proxmox_nodes.2,
      ip          = "192.168.136.39"
    }
  ]

  # ? VM defaults
  iso      = "/mnt/pve/remote-nfs/template/iso/talos-amd64.iso"
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
    cores  = 2,
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

  # ? DNS vip record
  vip_dns_record = {
    name  = "talos",
    value = "192.168.136.30"
  }
}
