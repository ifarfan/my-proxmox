# Fetch values from terraform.tfvars
variable "proxmox_api_url" {
  type = string
}

variable "proxmox_user" {
  type = string
}

variable "proxmox_password" {
  type      = string
  sensitive = true
}

variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}
