module "k8s" {
  source = "../modules/stacks"

  proxmox_pwd = var.proxmox_pwd

  mac1_vms = local.mac1_vms
  mac2_vms = local.mac2_vms
  mac3_vms = local.mac3_vms
}
