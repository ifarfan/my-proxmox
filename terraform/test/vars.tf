variable "proxmox_pwd" {
  type = string
}

locals {
  mac1_vms = [
    {
      name        = "test-1",
      description = "test 1",
      cores       = 1,
      memory      = 2048,
      disk        = "16G",
      ip          = "192.168.136.181"
    }
  ]

  mac2_vms = [
    {
      name        = "test-2",
      description = "test 2",
      cores       = 1,
      memory      = 2048,
      disk        = "16G",
      ip          = "192.168.136.182"
    }
  ]

  mac3_vms = [
    {
      name        = "test-3",
      description = "test 3",
      cores       = 1,
      memory      = 2048,
      disk        = "16G",
      ip          = "192.168.136.183"
    }
  ]
}
