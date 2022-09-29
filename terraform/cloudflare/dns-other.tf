resource "cloudflare_record" "root_record" {
  zone_id = lookup(data.cloudflare_zones.macminis_zone.zones[0], "id")
  name    = local.root.name
  value   = local.root.ip
  type    = local.root.type
  ttl     = local.root.ttl
}

resource "cloudflare_record" "www_record" {
  zone_id = lookup(data.cloudflare_zones.macminis_zone.zones[0], "id")
  name    = local.www.name
  value   = local.www.ip
  type    = local.www.type
  ttl     = local.www.ttl
}

resource "cloudflare_record" "portainer_record" {
  zone_id = lookup(data.cloudflare_zones.macminis_zone.zones[0], "id")
  name    = local.portainer.name
  value   = local.portainer.ip
  type    = local.portainer.type
  ttl     = local.portainer.ttl
}

resource "cloudflare_record" "nas_record" {
  zone_id = lookup(data.cloudflare_zones.macminis_zone.zones[0], "id")
  name    = local.nas.name
  value   = local.nas.ip
  type    = local.nas.type
  ttl     = local.nas.ttl
}

# resource "cloudflare_record" "others_records" {
#   for_each = { for index, other in local.others : other.name => other }

#   zone_id = lookup(data.cloudflare_zones.macminis_zone.zones[0], "id")
#   name    = each.value.name
#   value   = each.value.ip
#   type    = each.value.type
#   ttl     = each.value.ttl
# }
