variable "pm_api_url" {
  type    = string
  default = "https://192.168.136.11:8006/api2/json"
}

variable "pm_user" {
  type    = string
  default = "root@pam"
}

locals {
  # ? Proxmox server nodes
  proxmox_nodes = [
    "macmini1",
    "macmini2",
    "macmini3"
  ]

  # ? k3os Servers
  servers = [
    {
      name        = "k3os-00",
      desc        = "k3os Server 00",
      target_node = local.proxmox_nodes.0
    },
    {
      name        = "k3os-01",
      desc        = "k3os Server 01",
      target_node = local.proxmox_nodes.1
    },
    {
      name        = "k3os-02",
      desc        = "k3os Server 02",
      target_node = local.proxmox_nodes.2
    }
  ]

  # ? k3os Agents
  agents = [
    {
      name        = "k3os-agent-00",
      desc        = "k3os Agent 00",
      target_node = local.proxmox_nodes.0
    },
    {
      name        = "k3os-agent-01",
      desc        = "k3os Agent 01",
      target_node = local.proxmox_nodes.0
    },
    {
      name        = "k3os-agent-02",
      desc        = "k3os Agent 02",
      target_node = local.proxmox_nodes.1
    },
    {
      name        = "k3os-agent-03",
      desc        = "k3os Agent 03",
      target_node = local.proxmox_nodes.1
    },
    {
      name        = "k3os-agent-04",
      desc        = "k3os Agent 04",
      target_node = local.proxmox_nodes.2
    },
    {
      name        = "k3os-agent-05",
      desc        = "k3os Agent 05",
      target_node = local.proxmox_nodes.2
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
      size = "8G"
    }
  }

  # ? VM "agent" overrides
  agent = {
    cores  = 2,
    memory = 4096,

    disk = {
      size = "32G"
    }
  }
}
