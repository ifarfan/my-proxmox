terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "~>2.7.0"
    }
  }
}

#  Note:
#  - Export PM_PASS as an environment variable
provider "proxmox" {
  alias = "mac1"

  pm_api_url      = "https://${local.proxmox_nodes["mac1"]}:8006/api2/json"
  pm_user         = local.proxmox_user
  pm_tls_insecure = true

  #  Enable logging
  pm_log_enable = true
  pm_log_file   = "logs/tf-mac1.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

provider "proxmox" {
  alias = "mac2"

  pm_api_url      = "https://${local.proxmox_nodes["mac2"]}:8006/api2/json"
  pm_user         = local.proxmox_user
  pm_tls_insecure = true

  #  Enable logging
  pm_log_enable = true
  pm_log_file   = "logs/tf-mac2.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

provider "proxmox" {
  alias = "mac3"

  pm_api_url      = "https://${local.proxmox_nodes["mac3"]}:8006/api2/json"
  pm_user         = local.proxmox_user
  pm_tls_insecure = true

  #  Enable logging
  pm_log_enable = true
  pm_log_file   = "logs/tf-mac3.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}
