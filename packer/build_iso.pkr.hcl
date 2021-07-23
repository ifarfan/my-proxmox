source "proxmox" "iso_install" {
  boot_command             = local.boot_command
  boot_wait                = local.boot_wait
  cores                    = var.vm_cores
  cpu_type                 = local.cpu_type
  http_directory           = local.http_directory
  insecure_skip_tls_verify = true
  iso_file                 = local.iso_file
  memory                   = var.vm_memory
  node                     = var.proxmox_node
  os                       = local.os
  password                 = var.proxmox_password
  proxmox_url              = local.proxmox_url
  qemu_agent               = true
  ssh_password             = local.ssh_password
  ssh_timeout              = local.ssh_timeout
  ssh_username             = local.ssh_username
  template_description     = var.vm_description
  template_name            = local.template_name
  unmount_iso              = true
  username                 = local.proxmox_username
  vm_name                  = var.vm_name

  disks {
    disk_size         = var.vm_disksize
    storage_pool      = local.disk_storage_pool
    storage_pool_type = local.disk_storage_pool_type
    type              = local.disk_type
  }

  network_adapters {
    bridge = local.network_bridge
    model  = local.network_model
  }

  vga {
    memory = local.vga_memory
    type   = local.vga_type
  }
}

build {
  description = "Build Proxmox template from ISO"

  #  ! 1. PRE_SEED: Create VM from ISO
  sources = ["source.proxmox.iso_install"]

  # #  ! 2. PROVISION: Apply Ansible role(s)
  # provisioner "ansible" {
  #   pause_before        = "15s"
  #   ansible_env_vars    = local.map_ansible_vars
  #   inventory_directory = local.inventory_folder
  #   playbook_file       = local.build_playbook
  #   use_proxy           = false
  # }

  # #  ! 3. TEST: Test Ansible role(s)
  # provisioner "ansible" {
  #   pause_before        = "5s"
  #   ansible_env_vars    = local.map_ansible_vars
  #   inventory_directory = local.inventory_folder
  #   playbook_file       = local.test_playbook
  #   use_proxy           = false
  # }

  #  ! 4. POST-STEPS: Store "build" metadata
  post-processor "manifest" {
    output     = local.manifest_file
    strip_path = true
    custom_data = {
      vm_description = var.vm_description
      vm_name        = var.vm_name
    }
  }
}
