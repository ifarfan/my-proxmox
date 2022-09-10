variable "proxmox_pwd" {
  type = string
}

locals {
  mac1_vms = [
    {
      name        = "k8s_master_1",
      description = "k8s master 1",
      cores       = 1,
      memory      = 1024,
      disk        = "16G",
      ip          = "192.168.136.201"
    },
    {
      name        = "k8s_node_1",
      description = "k8s node 1",
      cores       = 2,
      memory      = 4096,
      disk        = "16G",
      ip          = "192.168.136.211"
    },
    {
      name        = "k8s_node_2",
      description = "k8s node 2",
      cores       = 2,
      memory      = 4096,
      disk        = "16G",
      ip          = "192.168.136.212"
    }
  ]

  mac2_vms = [
    {
      name        = "k8s_master_2",
      description = "k8s master 1",
      cores       = 1,
      memory      = 1024,
      disk        = "16G",
      ip          = "192.168.136.202"
    },
    {
      name        = "k8s_node_3",
      description = "k8s node 3",
      cores       = 2,
      memory      = 4096,
      disk        = "16G",
      ip          = "192.168.136.213"
    }
  ]

  mac3_vms = [
    {
      name        = "k8s_master_3",
      description = "k8s master 3",
      cores       = 1,
      memory      = 1024,
      disk        = "16G",
      ip          = "192.168.136.203"
    },
    {
      name        = "k8s_node_4",
      description = "k8s node 4",
      cores       = 2,
      memory      = 4096,
      disk        = "16G",
      ip          = "192.168.136.214"
    },
    {
      name        = "k8s_node_5",
      description = "k8s node 5",
      cores       = 2,
      memory      = 4096,
      disk        = "16G",
      ip          = "192.168.136.215"
    }
  ]
}
