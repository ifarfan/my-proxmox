terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "~>2.9.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}
