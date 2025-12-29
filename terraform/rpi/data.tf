data "cloudflare_zones" "domain_zone" {
  filter {
    name = local.domain
  }
}
