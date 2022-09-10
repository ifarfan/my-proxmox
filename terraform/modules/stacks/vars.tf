variable "proxmox_pwd" {
  type = string
}

variable "mac1_vms" {
  type = list
  default = []
}

variable "mac2_vms" {
  type = list
  default = []
}

variable "mac3_vms" {
  type = list
  default = []
}

locals {
  # Proxmox
  proxmox_user = "root@pam"
  proxmox_nodes = {
    mac1 = {
      name = "macmini1",
      ip = "192.168.136.11"
    },
    mac2 = {
      name = "macmini2",
      ip =  "192.168.136.12"
    }
    mac3 = {
      name = "macmini3",
      ip = "192.168.136.13"
    }
  }

  # VM settings
  gw_ip = "192.168.136.1"

  vm_boot     = "cdn"               # boot order: hard disk (c), CD-ROM (d), or network (n)
  vm_onboot   = false               # start at boot
  vm_os_type  = "cloud-init"
  vm_tag      = "terraform"
  vm_template = "ubuntu-20-04-iso-tmpl"
  vm_ssh_keys = <<-EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIgjDNPF6qWWgfXWzXxrejnbX/HhXr4gMk0wKuJKLcJ9 ifarfan@gmx.com
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCNaVP0USq5F3TYVQ6JKdwJzrbXwgg2Wvod2nKDM+T0dBsiI0jjrFEnYQoyawyUt8yQgQ2gx2PBnbwP/UTnpT1LKiwKG1Lqc3N5WAqJTf3Ih+H9i5QWL/9Nzjcnl6zT6LklegqOtv8pHzBcwpTUXKiwXO0Q3K38hgLJq4LVvrfpONalwTipWFak1h001VW3y/FCio7JWbuD7XCE5NSxSBRbzzIYvxm6cukbn4b3e1/lDH66IgliopPg9v0yS1nJmtUWUWPdXzmvJmPDOYDBm7o5vbyhQkcGJA9sf/PD+nrkUduD0UY9HaCImj+waIdD6S8h4CWnNzrrq3OuKvvGVSN9tU2mmeBCPPq8sYc3V8V8uz5MXvT/w/FtChby5Fg5rES/k1sRkMhb7LHRe/p8HBBI2EDanfUIxv8yVZ00JegoGlvbVCffbFl2rTdcl7eyKMDlaiVjC9sH1pAXRcZuA7psVao5TKIHYc6ohzUgZ7m7jfmEV1BZHBW6MDkXeMSh2v94vCKkzC+LQmwzoxnW0CnmUvEQ/CvOe0oxiVOJpM4I12gKB/VhIJ/uHBrZJ4taywcx54hrZCDYXhy2FH4wxQHbG7BclXE2tv1ceOtoGCqsQTXTcObjDOx6JXfuP45piNY85USIDSKKufmCTi1rb1YVbqZQqOXXtjLq0Yo2XEbiQ== ansible@local
  EOF

  disk_scsihw  = "virtio-scsi-pci"
  disk_storage = "local-lvm"
  disk_type    = "scsi"

  network_bridge = "vmbr0"
  network_model  = "virtio"

  vga_memory = 32
  vga_type   = "vmware"
}

