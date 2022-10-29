source "proxmox" "iso_install" {
  # Proxmox
  node        = var.proxmox_node
  password    = var.proxmox_password
  proxmox_url = local.proxmox_url
  username    = local.proxmox_username

  # VM
  insecure_skip_tls_verify = true
  os                       = local.os
  qemu_agent               = true
  template_description     = var.vm_description
  template_name            = local.template_name
  vm_name                  = var.vm_name

  # ISO
  boot_command   = local.boot_command
  boot_wait      = local.boot_wait
  http_directory = local.http_directory
  iso_file       = local.iso_file
  unmount_iso    = true

  # SSH
  ssh_password = local.ssh_password
  ssh_timeout  = local.ssh_timeout
  ssh_username = local.ssh_username

  # HW
  cores    = var.vm_cores
  cpu_type = local.cpu_type
  memory   = var.vm_memory
  sockets  = local.sockets

  disks {
    disk_size = var.vm_disksize
    # format            = local.disk_format
    storage_pool      = local.disks.storage_pool
    storage_pool_type = local.disks.storage_pool_type
    type              = local.disks.type
  }

  network_adapters {
    bridge = local.network.bridge
    model  = local.network.model
  }

  vga {
    memory = local.vga.memory
    type   = local.vga.type
  }
}

build {
  name        = "from_iso_build"
  description = "Build Proxmox template from ISO"

  #  ! 1. PRE_SEED: Create VM from ISO
  sources = ["source.proxmox.iso_install"]

  # ! 2. PROVISION: Apply Ansible role(s)
  provisioner "ansible" {
    pause_before        = "15s"
    ansible_env_vars    = local.map_ansible_vars
    inventory_directory = local.inventory_folder
    playbook_file       = local.build_playbook
    use_proxy           = false
    extra_arguments = [
      "--extra-vars", "ansible_ssh_pass=${local.ssh_password}"
    ]
  }

  # ! 3. TEST: Test Ansible role(s)
  provisioner "ansible" {
    pause_before        = "5s"
    ansible_env_vars    = local.map_ansible_vars
    inventory_directory = local.inventory_folder
    playbook_file       = local.test_playbook
    use_proxy           = false
    extra_arguments = [
      "--extra-vars", "ansible_ssh_pass=${local.ssh_password}"
    ]
  }

  # ! 4. POST-STEPS: Store "build" metadata
  post-processor "manifest" {
    output     = local.manifest_file
    strip_path = true
    custom_data = {
      vm_description = var.vm_description
      vm_name        = var.vm_name
    }
  }
}
