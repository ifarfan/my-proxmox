# Proxmox overwriteable values
locals {
  # ?
  # ? Stack variables
  # ?

  # ? Proxmox servers
  proxmox_nodes = [
    "macmini1",
    "macmini2",
    "macmini3"
  ]

  # ? k3s servers
  servers = [
    {
      hostname    = "k3s-server-1",
      description = "k3s server node 1",
      target_node = local.proxmox_nodes.0,
      ip          = "192.168.136.31"
    },
    {
      hostname    = "k3s-server-2",
      description = "k3s server node 2",
      target_node = local.proxmox_nodes.1,
      ip          = "192.168.136.32"
    },
    {
      hostname    = "k3s-server-3",
      description = "k3s server node 3",
      target_node = local.proxmox_nodes.2,
      ip          = "192.168.136.33"
    }
  ]

  # ? k3s agents
  agents = [
    {
      hostname    = "k3s-agent-1",
      description = "k3s agent node 1",
      target_node = local.proxmox_nodes.0,
      ip          = "192.168.136.34"
    },
    {
      hostname    = "k3s-agent-2",
      description = "k3s agent node 2",
      target_node = local.proxmox_nodes.1,
      ip          = "192.168.136.35"
    },
    {
      hostname    = "k3s-agent-3",
      description = "k3s agent node 3",
      target_node = local.proxmox_nodes.2,
      ip          = "192.168.136.36"
    }
  ]

  # ? k3s data/storage
  data = [
    {
      hostname    = "k3s-data-1",
      description = "k3s data node 1",
      target_node = local.proxmox_nodes.0,
      ip          = "192.168.136.37"
    },
    {
      hostname    = "k3s-data-2",
      description = "k3s data node 2",
      target_node = local.proxmox_nodes.1,
      ip          = "192.168.136.38"
    },
    {
      hostname    = "k3s-data-3",
      description = "k3s data node 3",
      target_node = local.proxmox_nodes.2,
      ip          = "192.168.136.39"
    }
  ]

  # ? Server settings
  server = {
    cores  = 1,
    memory = 2048,

    # Disks
    rootfs_size = "2G"
    mountpoint = {
      mp   = "/var/lib/docker"
      size = "4G"
    }
  }

  # ? Agent settings
  agent = {
    cores  = 4,
    memory = 8192,

    # Disks
    rootfs_size = "4G"
    mountpoint = {
      mp   = "/var/lib/docker"
      size = "20G"
    }
  }

  # ? Data settings
  datum = {
    cores  = 4,
    memory = 8192,

    # Disks
    rootfs_size = "4G",
    mountpoint = {
      mp   = "/var/lib/docker"
      size = "20G"
    }
  }
}
