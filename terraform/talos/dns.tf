resource "cloudflare_record" "dns_record_server" {
  for_each = { for index, server in local.servers : server.hostname => server }

  zone_id = lookup(data.cloudflare_zones.domain_zone.zones[0], "id")
  name    = each.value.hostname
  value   = each.value.ip
  type    = local.dns_record.type
  ttl     = local.dns_record.ttl
}

resource "cloudflare_record" "dns_record_agent" {
  for_each = { for index, agent in local.agents : agent.hostname => agent }

  zone_id = lookup(data.cloudflare_zones.domain_zone.zones[0], "id")
  name    = each.value.hostname
  value   = each.value.ip
  type    = local.dns_record.type
  ttl     = local.dns_record.ttl
}

resource "cloudflare_record" "dns_record_data" {
  for_each = { for index, data in local.data : data.hostname => data }

  zone_id = lookup(data.cloudflare_zones.domain_zone.zones[0], "id")
  name    = each.value.hostname
  value   = each.value.ip
  type    = local.dns_record.type
  ttl     = local.dns_record.ttl
}

resource "cloudflare_record" "vip_record" {
  zone_id = lookup(data.cloudflare_zones.domain_zone.zones[0], "id")
  name    = local.vip_dns_record.name
  value   = local.vip_dns_record.value
  type    = "A"
  ttl     = 1 # auto
}
