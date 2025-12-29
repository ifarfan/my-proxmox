resource "cloudflare_record" "dns_record" {
  for_each = { for index, rpi in local.rpis : rpi.hostname => rpi }

  zone_id = lookup(data.cloudflare_zones.domain_zone.zones[0], "id")
  name    = each.value.hostname
  value   = each.value.ip
  type    = local.dns_record.type
  ttl     = local.dns_record.ttl
}
