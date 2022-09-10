provider "proxmox" {
  alias = "mac1"

  pm_api_url      = "https://${local.proxmox_nodes["mac1"]["ip"]}:8006/api2/json"
  pm_user         = local.proxmox_user
  pm_password     = var.proxmox_pwd
  pm_tls_insecure = true

  #  Enable logging
  pm_log_enable = true
  pm_log_file   = "../logs/mac1.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

provider "proxmox" {
  alias = "mac2"

  pm_api_url      = "https://${local.proxmox_nodes["mac2"]["ip"]}:8006/api2/json"
  pm_user         = local.proxmox_user
  pm_password     = var.proxmox_pwd
  pm_tls_insecure = true

  #  Enable logging
  pm_log_enable = true
  pm_log_file   = "../logs/mac2.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

provider "proxmox" {
  alias = "mac3"

  pm_api_url      = "https://${local.proxmox_nodes["mac3"]["ip"]}:8006/api2/json"
  pm_user         = local.proxmox_user
  pm_password     = var.proxmox_pwd
  pm_tls_insecure = true

  #  Enable logging
  pm_log_enable = true
  pm_log_file   = "../logs/mac3.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}
