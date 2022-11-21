data "cloudflare_zones" "domain_zone" {
  filter {
    name = local.domain
  }
}

data "github_user" "my_username" {
  username = local.github_username
}
