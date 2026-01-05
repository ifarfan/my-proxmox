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
      aliases = [
        "traefik-rpi0",
      ]
    },
    {
      hostname    = "rpi1",
      description = "RaspberryPi DNS 1",
      ip          = "192.168.136.3"
      aliases = [
        "traefik-rpi1",
        "pulse"
      ]
    }
  ]

  # Flattened list of CNAME records so we can create them in a single resource
  cname_records_list = flatten([
    for rpi in local.rpis : [
      for alias in rpi.aliases : {
        key          = "${rpi.hostname}-${alias}"
        cname_record = alias
        cname_value  = rpi.hostname
      }
    ]
  ])

  cname_records_map = {
    for instance in local.cname_records_list :
    instance.key => instance
  }
}
