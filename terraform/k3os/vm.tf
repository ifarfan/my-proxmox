# ? k3os Servers (smaller VMs)
resource "proxmox_vm_qemu" "servers" {
  for_each = { for index, server in local.servers : server.hostname => server }

  name        = "${each.value.hostname}.${local.domain}"
  desc        = each.value.description
  target_node = each.value.target_node

  cores    = local.server.cores
  iso      = local.iso
  memory   = local.server.memory
  onboot   = local.onboot
  oncreate = local.oncreate
  os_type  = local.os_type
  scsihw   = local.scsihw

  disk {
    type    = local.disk.type
    storage = local.disk.storage
    size    = local.server.disk.size
  }

  network {
    bridge   = local.network.bridge
    firewall = local.network.firewall
    model    = local.network.model
  }
}

# ? k3os Agents (larger VMs)
resource "proxmox_vm_qemu" "agents" {
  for_each = { for index, agent in local.agents : agent.hostname => agent }

  name        = "${each.value.hostname}.${local.domain}"
  desc        = each.value.description
  target_node = each.value.target_node

  cores    = local.agent.cores
  iso      = local.iso
  memory   = local.agent.memory
  onboot   = local.onboot
  oncreate = local.oncreate
  os_type  = local.os_type
  scsihw   = local.scsihw

  disk {
    type    = local.disk.type
    storage = local.disk.storage
    size    = local.agent.disk.size
  }

  network {
    bridge   = local.network.bridge
    firewall = local.network.firewall
    model    = local.network.model
  }
}


# ? k3os Data (larger VMs)
resource "proxmox_vm_qemu" "data" {
  for_each = { for index, data in local.data : data.hostname => data }

  name        = "${each.value.hostname}.${local.domain}"
  desc        = each.value.description
  target_node = each.value.target_node

  cores    = local.datum.cores
  iso      = local.iso
  memory   = local.datum.memory
  onboot   = local.onboot
  oncreate = local.oncreate
  os_type  = local.os_type
  scsihw   = local.scsihw

  disk {
    type    = local.disk.type
    storage = local.disk.storage
    size    = local.datum.disk.size
  }

  network {
    bridge   = local.network.bridge
    firewall = local.network.firewall
    model    = local.network.model
  }
}
