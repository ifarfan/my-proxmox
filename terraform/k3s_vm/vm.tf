resource "proxmox_vm_qemu" "vm_server" {
  for_each = { for index, server in local.servers : server.hostname => server }

  name        = "${each.value.hostname}.${local.domain}"
  desc        = each.value.description
  target_node = each.value.target_node

  agent     = local.qemu_agent
  boot      = local.boot
  clone     = local.template
  cores     = local.server.cores
  ipconfig0 = "ip=${each.value.ip}/24,gw=${local.gw_ip}"
  memory    = local.server.memory
  onboot    = local.onboot
  os_type   = local.os_type
  scsihw    = local.disk.scsihw
  sockets   = local.sockets
  sshkeys   = local.sshkeys

  disk {
    size    = local.server.disk.size
    storage = local.disk.storage
    type    = local.disk.type
  }

  network {
    bridge = local.network.bridge
    model  = local.network.model
  }

  vga {
    memory = local.vga.memory
    type   = local.vga.type
  }

  tags = local.tags
}

resource "proxmox_vm_qemu" "vm_agent" {
  for_each = { for index, agent in local.agents : agent.hostname => agent }

  name        = "${each.value.hostname}.${local.domain}"
  desc        = each.value.description
  target_node = each.value.target_node

  agent     = local.qemu_agent
  boot      = local.boot
  clone     = local.template
  cores     = local.agent.cores
  ipconfig0 = "ip=${each.value.ip}/24,gw=${local.gw_ip}"
  memory    = local.agent.memory
  onboot    = local.onboot
  os_type   = local.os_type
  scsihw    = local.disk.scsihw
  sockets   = local.sockets
  sshkeys   = local.sshkeys

  disk {
    size    = local.agent.disk.size
    storage = local.disk.storage
    type    = local.disk.type
  }

  network {
    bridge = local.network.bridge
    model  = local.network.model
  }

  vga {
    memory = local.vga.memory
    type   = local.vga.type
  }

  tags = local.tags
}

resource "proxmox_vm_qemu" "vm_data" {
  for_each = { for index, data in local.data : data.hostname => data }

  name        = "${each.value.hostname}.${local.domain}"
  desc        = each.value.description
  target_node = each.value.target_node

  agent     = local.qemu_agent
  boot      = local.boot
  clone     = local.template
  cores     = local.datum.cores
  ipconfig0 = "ip=${each.value.ip}/24,gw=${local.gw_ip}"
  memory    = local.datum.memory
  onboot    = local.onboot
  os_type   = local.os_type
  scsihw    = local.disk.scsihw
  sockets   = local.sockets
  sshkeys   = local.sshkeys

  disk {
    size    = local.datum.disk.size
    storage = local.disk.storage
    type    = local.disk.type
  }

  network {
    bridge = local.network.bridge
    model  = local.network.model
  }

  vga {
    memory = local.vga.memory
    type   = local.vga.type
  }

  tags = local.tags
}
