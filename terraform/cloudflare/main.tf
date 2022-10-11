resource "cloudflare_record" "a_records" {
  for_each = { for index, a in local.as : a.name => a }

  zone_id = lookup(data.cloudflare_zones.macminis_zone.zones[0], "id")
  name    = each.value.name
  value   = each.value.value
  type    = "A"
  ttl     = 1 # auto
}

resource "cloudflare_record" "cname_records" {
  for_each = { for index, cname in local.cnames : cname.name => cname }

  zone_id = lookup(data.cloudflare_zones.macminis_zone.zones[0], "id")
  name    = each.value.name
  value   = each.value.value
  type    = "CNAME"
  ttl     = 1 # auto
}
