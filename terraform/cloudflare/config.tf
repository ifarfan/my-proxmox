terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {
}

data "cloudflare_zones" "macminis_zone" {
  filter {
    name = local.domain
  }
}
