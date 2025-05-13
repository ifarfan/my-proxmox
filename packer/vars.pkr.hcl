# Fetch values from packer.auto.pkvars.hcl
variable "proxmox_api_url" {
  type = string
}

variable "proxmox_user" {
  type = string
}

variable "proxmox_password" {
  type      = string
  sensitive = true
}

# Proxmox
variable "proxmox_node" {
  type    = string
  default = ""
}

# VM
variable "vm_name" {
  type    = string
  default = ""
}
variable "vm_description" {
  type    = string
  default = ""
}

variable "vm_cores" {
  type    = string
  default = 2
}

variable "vm_disksize" {
  type    = string
  default = "8G"
}

variable "vm_memory" {
  type    = string
  default = 4096
}

variable "iso_file" {
  type    = string
  default = ""
}

variable "clone_vm" {
  type    = string
  default = ""
}

locals {
  # Record Timestamp
  build_timestamp = formatdate("YYYY-MM-DD-hhmm", timestamp())

  # Boot
  boot_command = [
    "<esc>e<wait><wait>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "<del><del><del><del><del><del><del><del>",
    "set gfxpayload=keep<enter><wait3s>",
    "linux /casper/vmlinuz --- autoinstall ip=dhcp cloud-config-url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.vm_name}/user-data<enter><wait3s>",
    "initrd /casper/initrd<enter><wait3s>",
    "boot<enter><wait3s>",
    "<f10><wait3s>"
  ]
  boot_wait      = "10s"
  http_directory = "http"
  http_port      = 8802
  iso_file       = "remote-nfs:iso/${var.iso_file}"
  iso_type       = "scsi"

  # VM
  os            = "l26"
  template_name = "${var.vm_name}-tmpl"

  # Hardware
  cpu_type = "host"
  sockets  = 2

  # Store Template locally on each node
  disks = {
    storage_pool      = "local-lvm"
    storage_pool_type = "lvm"
    type              = "scsi"
  }

  # # Store Template in shared NFS mount
  # disks = {
  #   storage_pool      = "remote-nfs"
  #   storage_pool_type = "nfs"
  #   type              = "scsi"
  #   format            = "qcow2"
  # }

  network = {
    bridge = "vmbr0"
    model  = "virtio"
  }

  vga = {
    memory = 32
    type   = "qxl" # qxl=SPICE, std=Standard
  }

  # SSH on VM
  ssh_password = "p@ck3r-t3mp!"
  ssh_timeout  = "30m"
  ssh_username = "packer"

  # ANSIBLE
  # ? NOTES:
  # ? - This is basically how to configure without ansible.cfg
  # ? - The Ansible packer provisioner will automatically set these variables to remote in (DO NOT SET THEM YOURSELF!!!):
  # ?  - ANSIBLE_REMOTE_USER
  # ?  - ANSIBLE_SSH_PRIVATE_KEY_FILE
  map_ansible_vars = [
    "ANSIBLE_CONTROL_PATH=/tmp/ansible-ssh-%%h-%%p-%%r",
    "ANSIBLE_GATHER_TIMEOUT=20",
    "ANSIBLE_GATHERING=explicit",
    "ANSIBLE_HOST_KEY_CHECKING=False",
    "ANSIBLE_NOCOWS=1",
    "ANSIBLE_PIPELINING=True",
    "ANSIBLE_PYTHON_INTERPRETER=/usr/bin/python3",
    "ANSIBLE_RETRY_FILES_ENABLED=False",
    "ANSIBLE_STDOUT_CALLBACK=yaml",
    "ANSIBLE_TIMEOUT=20"
  ]
  map_ansible_ssh_args = [
    "-o IdentitiesOnly=yes",
    "-o ControlMaster=auto",
    "-o ControlPersist=60s",
    "-o HostKeyAlgorithms=+ssh-rsa",
    "-o PubkeyAcceptedKeyTypes=ssh-rsa"
  ]
  inventory_folder = "./ansible/inventory"
  build_playbook   = "./ansible/playbooks/${var.vm_name}_build.yml"
  test_playbook    = "./ansible/playbooks/${var.vm_name}_test.yml"
  manifest_file    = "./manifests/${var.vm_name}.json"
}
