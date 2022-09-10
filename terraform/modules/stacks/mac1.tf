resource "proxmox_vm_qemu" "vms_mac1" {
  provider    = proxmox.mac1
  target_node = local.proxmox_nodes["mac1"]["name"]
  count       = length(var.mac1_vms)

  agent     = 1
  boot      = local.vm_boot
  clone     = local.vm_template
  cores     = var.mac1_vms[count.index].cores
  desc      = var.mac1_vms[count.index].description
  ipconfig0 = "ip=${var.mac1_vms[count.index].ip}/24,gw=${local.gw_ip}"
  memory    = var.mac1_vms[count.index].memory
  name      = var.mac1_vms[count.index].name
  onboot    = local.vm_onboot
  os_type   = local.vm_os_type
  scsihw    = local.disk_scsihw
  sockets   = 1
  sshkeys   = local.vm_ssh_keys

  disk {
    size    = var.mac1_vms[count.index].disk
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
