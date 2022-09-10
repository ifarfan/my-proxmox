terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "~>2.9.0"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_user         = var.pm_user
  pm_parallel     = 3
  pm_tls_insecure = true

  #  Enable logging
  pm_log_enable = true
  pm_log_file   = "./logs/terraform-plugin-proxmox.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}
