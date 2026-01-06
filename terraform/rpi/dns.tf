resource "cloudflare_record" "dns_record" {
  for_each = { for index, rpi in local.rpis : rpi.hostname => rpi }

  zone_id = lookup(data.cloudflare_zones.domain_zone.zones[0], "id")
  name    = each.value.hostname
  value   = each.value.ip
  type    = "A"
  ttl     = 3600
}

resource "cloudflare_record" "cname_records" {
  for_each = local.cname_records_map

  zone_id = lookup(data.cloudflare_zones.domain_zone.zones[0], "id")
  name    = each.value.cname_record
  value   = "${each.value.cname_value}.${local.domain}"
  type    = "CNAME"
  ttl     = 1 # auto
}
