resource "proxmox_vm_qemu" "vms_mac2" {
  provider    = proxmox.mac2
  target_node = local.proxmox_nodes["mac2"]["name"]
  count       = length(var.mac2_vms)

  agent     = 1
  clone     = local.vm_template
  cores     = var.mac2_vms[count.index].cores
  desc      = var.mac2_vms[count.index].description
  ipconfig0 = "ip=${var.mac2_vms[count.index].ip}/24,gw=${local.gw_ip}"
  memory    = var.mac2_vms[count.index].memory
  name      = var.mac2_vms[count.index].name
  os_type   = local.vm_os_type
  sockets   = 1
  sshkeys   = local.vm_ssh_keys

  disk {
    size    = var.mac2_vms[count.index].disk
    storage = local.disk_storage
    type    = local.disk_type
  }

  network {
    bridge = local.network_bridge
    model  = local.network_model
  }

  vga {
    memory = local.vga_memory
    type   = local.vga_type
  }

  tags = local.vm_tag
}
