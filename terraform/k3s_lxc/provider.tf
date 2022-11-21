provider "proxmox" {
  pm_api_url      = local.pm_api_url
  pm_user         = local.pm_user
  pm_tls_insecure = true

  #  Enable logging
  pm_log_enable = true
  pm_log_file   = "./logs/terraform-plugin-proxmox.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

provider "cloudflare" {}
provider "github" {}
