resource "proxmox_vm_qemu" "k8s_vm_mac3" {
  provider    = proxmox.mac3
  target_node = local.proxmox_nodes["mac3"]
  count       = length(local.mac3_vms)

  agent     = 1
  clone     = local.vm_template
  cores     = local.mac3_vms[count.index].cores
  desc      = local.mac3_vms[count.index].description
  ipconfig0 = "ip=${local.mac3_vms[count.index].ip}/24,gw=${local.gw_ip}"
  memory    = local.mac3_vms[count.index].memory
  name      = local.mac3_vms[count.index].name
  os_type   = local.vm_os_type
  sockets   = 1
  sshkeys   = local.vm_ssh_keys

  disk {
    size    = local.mac3_vms[count.index].disk
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
