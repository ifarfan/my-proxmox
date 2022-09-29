resource "cloudflare_record" "macminis_records" {
  for_each = { for index, macmini in local.macminis : macmini.name => macmini }

  zone_id = lookup(data.cloudflare_zones.macminis_zone.zones[0], "id")
  name    = each.value.name
  value   = each.value.ip
  type    = each.value.type
  ttl     = each.value.ttl
}
