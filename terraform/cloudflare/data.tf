data "cloudflare_zones" "macminis_zone" {
  filter {
    name = local.domain
  }
}
