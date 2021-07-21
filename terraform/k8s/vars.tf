locals {
  gw_ip       = "192.168.136.1"
  vm_os_type  = "cloud-init"
  vm_tag      = "terraform"
  vm_template = "ubuntu-2004-template"

  vm_ssh_keys = <<-EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIgjDNPF6qWWgfXWzXxrejnbX/HhXr4gMk0wKuJKLcJ9 ifarfan@gmx.com
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCNaVP0USq5F3TYVQ6JKdwJzrbXwgg2Wvod2nKDM+T0dBsiI0jjrFEnYQoyawyUt8yQgQ2gx2PBnbwP/UTnpT1LKiwKG1Lqc3N5WAqJTf3Ih+H9i5QWL/9Nzjcnl6zT6LklegqOtv8pHzBcwpTUXKiwXO0Q3K38hgLJq4LVvrfpONalwTipWFak1h001VW3y/FCio7JWbuD7XCE5NSxSBRbzzIYvxm6cukbn4b3e1/lDH66IgliopPg9v0yS1nJmtUWUWPdXzmvJmPDOYDBm7o5vbyhQkcGJA9sf/PD+nrkUduD0UY9HaCImj+waIdD6S8h4CWnNzrrq3OuKvvGVSN9tU2mmeBCPPq8sYc3V8V8uz5MXvT/w/FtChby5Fg5rES/k1sRkMhb7LHRe/p8HBBI2EDanfUIxv8yVZ00JegoGlvbVCffbFl2rTdcl7eyKMDlaiVjC9sH1pAXRcZuA7psVao5TKIHYc6ohzUgZ7m7jfmEV1BZHBW6MDkXeMSh2v94vCKkzC+LQmwzoxnW0CnmUvEQ/CvOe0oxiVOJpM4I12gKB/VhIJ/uHBrZJ4taywcx54hrZCDYXhy2FH4wxQHbG7BclXE2tv1ceOtoGCqsQTXTcObjDOx6JXfuP45piNY85USIDSKKufmCTi1rb1YVbqZQqOXXtjLq0Yo2XEbiQ== ansible@local
  EOF

  disk_storage   = "local-lvm"
  disk_type      = "scsi"
  network_bridge = "vmbr0"
  network_model  = "virtio"
  vga_memory     = 32
  vga_type       = "vmware"

  proxmox_user = "root@pam"
  proxmox_nodes = {
    mac1 = "192.168.136.11",
    mac2 = "192.168.136.12",
    mac3 = "192.168.136.13"
  }

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
