packer {
  required_version = ">= 1.8.3, <= 1.12.0"

  required_plugins {
    ansible = {
      version = "~> 1"
      source = "github.com/hashicorp/ansible"
    }
    proxmox = {
      version = "1.2.2"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}
