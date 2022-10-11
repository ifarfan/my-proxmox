resource "proxmox_lxc" "lxc_server" {
  for_each = { for index, server in local.servers : server.hostname => server }

  hostname    = "${each.value.hostname}.${local.domain}"
  description = each.value.description
  target_node = each.value.target_node

  cores           = local.server.cores
  memory          = local.server.memory
  onboot          = local.onboot
  ostemplate      = local.ostemplate
  ssh_public_keys = local.ssh_public_keys
  start           = local.start
  unprivileged    = local.unprivileged

  rootfs {
    storage = local.rootfs.storage
    size    = local.server.rootfs_size
  }

  mountpoint {
    key     = local.mountpoint.key
    slot    = local.mountpoint.slot
    storage = local.mountpoint.storage
    mp      = local.server.mountpoint.mp
    size    = local.server.mountpoint.size
  }

  network {
    name     = local.network.name
    bridge   = local.network.bridge
    firewall = local.network.firewall
    gw       = local.network.gw
    ip       = "${each.value.ip}/32"
  }

  features {
    keyctl  = local.features.keyctl
    nesting = local.features.nesting
  }
}

resource "proxmox_lxc" "lxc_agent" {
  for_each = { for index, agent in local.agents : agent.hostname => agent }

  hostname    = "${each.value.hostname}.${local.domain}"
  description = each.value.description
  target_node = each.value.target_node

  cores           = local.agent.cores
  memory          = local.agent.memory
  onboot          = local.onboot
  ostemplate      = local.ostemplate
  ssh_public_keys = local.ssh_public_keys
  start           = local.start
  unprivileged    = local.unprivileged

  rootfs {
    storage = local.rootfs.storage
    size    = local.agent.rootfs_size
  }

  mountpoint {
    key     = local.mountpoint.key
    slot    = local.mountpoint.slot
    storage = local.mountpoint.storage
    mp      = local.agent.mountpoint.mp
    size    = local.agent.mountpoint.size
  }

  network {
    name     = local.network.name
    bridge   = local.network.bridge
    firewall = local.network.firewall
    gw       = local.network.gw
    ip       = "${each.value.ip}/32"
  }

  features {
    keyctl  = local.features.keyctl
    nesting = local.features.nesting
  }
}

resource "proxmox_lxc" "lxc_data" {
  for_each = { for index, data in local.data : data.hostname => data }

  hostname    = "${each.value.hostname}.${local.domain}"
  description = each.value.description
  target_node = each.value.target_node

  cores           = local.datum.cores
  memory          = local.datum.memory
  onboot          = local.onboot
  ostemplate      = local.ostemplate
  ssh_public_keys = local.ssh_public_keys
  start           = local.start
  unprivileged    = local.unprivileged

  rootfs {
    storage = local.rootfs.storage
    size    = local.datum.rootfs_size
  }

  mountpoint {
    key     = local.mountpoint.key
    slot    = local.mountpoint.slot
    storage = local.mountpoint.storage
    mp      = local.datum.mountpoint.mp
    size    = local.datum.mountpoint.size
  }

  network {
    name     = local.network.name
    bridge   = local.network.bridge
    firewall = local.network.firewall
    gw       = local.network.gw
    ip       = "${each.value.ip}/32"
  }

  features {
    keyctl  = local.features.keyctl
    nesting = local.features.nesting
  }
}
