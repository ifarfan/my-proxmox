variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

locals {
  # ? Global variables
  domain = "macminis.net"

  rpis = [
    {
      hostname    = "rpi0",
      description = "RaspberryPi DNS 0",
      ip          = "192.168.136.2"
    },
    {
      hostname    = "rpi1",
      description = "RaspberryPi DNS 1",
      ip          = "192.168.136.3"
    }
  ]

  # ? DNS record defaults
  dns_record = {
    ttl  = 3600,
    type = "A"
  }
}
