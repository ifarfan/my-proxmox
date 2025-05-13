source "proxmox-clone" "ubuntu-clone" {
  # Proxmox
  node        = var.proxmox_node
  password    = var.proxmox_password
  proxmox_url = var.proxmox_api_url
  username    = var.proxmox_user

  # VM
  clone_vm                 = var.clone_vm
  insecure_skip_tls_verify = true
  os                       = local.os
  qemu_agent               = true
  template_description     = "${var.vm_description} (${local.build_timestamp})"
  template_name            = local.template_name
  vm_name                  = var.vm_name

  # SSH
  ssh_password = local.ssh_password
  ssh_timeout  = local.ssh_timeout
  ssh_username = local.ssh_username

  # HW
  cores    = var.vm_cores
  cpu_type = local.cpu_type
  memory   = var.vm_memory
  sockets  = local.sockets

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
  name        = "from_clone_build"
  description = "Build Proxmox template from VM clone/template"

  # ! 1. PRE_SEED: Create VM from template
  sources = ["source.proxmox-clone.ubuntu-clone"]

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
      vm_description = "${var.vm_description} (${local.build_timestamp})"
      vm_name        = var.vm_name
    }
  }
}
