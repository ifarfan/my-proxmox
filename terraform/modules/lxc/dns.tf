resource "cloudflare_record" "dns_record" {
  zone_id = lookup(data.cloudflare_zones.domain_zone.zones[0], "id")
  name    = local.dns_record.name
  value   = local.dns_record.ip
  type    = local.dns_record.type
  ttl     = local.dns_record.ttl
}

resource "cloudflare_record" "cname_records" {
  count = length(var.dns_aliases)

  zone_id = lookup(data.cloudflare_zones.domain_zone.zones[0], "id")
  name    = var.dns_aliases[count.index]
  value   = "${cloudflare_record.dns_record.name}.${local.domain}"
  type    = "CNAME"
  ttl     = 1 # auto
}
