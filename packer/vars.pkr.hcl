# Proxmox
variable "proxmox_node" {
  type    = string
  default = ""
}

variable "proxmox_ip" {
  type    = string
  default = ""
}

variable "proxmox_password" {
  type      = string
  sensitive = true
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
  default = 1
}

variable "vm_disksize" {
  type    = string
  default = "8G"
}

variable "vm_memory" {
  type    = string
  default = 2048
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
  # Proxmox
  proxmox_url      = "https://${var.proxmox_ip}:8006/api2/json"
  proxmox_username = "root@pam"

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
    "linux /casper/vmlinuz --- autoinstall ds='nocloud-net;seedfrom=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.vm_name}/'<enter><wait3s>",
    "initrd /casper/initrd<enter><wait3s>",
    "boot<enter><wait3s>",
    "<f10><wait3s>"

    # "<esc><wait>",
    # "install",
    # " initrd=initrd.gz",
    # " auto=true",
    # " priority=critical",
    # " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.vm_name}.preseed.cfg",
    # " --- <wait>",
    # "<enter><wait>"
  ]
  boot_wait      = "10s"
  http_directory = "http"
  iso_file       = "remote-nfs:iso/${var.iso_file}"

  # VM
  os            = "l26"
  template_name = "${var.vm_name}-tmpl"

  # Hardware
  cpu_type = "host"
  sockets  = 1

  disk_storage_pool      = "local-lvm"
  disk_storage_pool_type = "lvm"
  disk_type              = "scsi"

  # disk_storage_pool      = "remote-nfs"
  # disk_storage_pool_type = "nfs"
  # disk_type              = "scsi"
  # disk_format            = "qcow2"
  # # scsi_controller = "virtio-scsi-single"

  network_bridge = "vmbr0"
  network_model  = "virtio"

  vga_memory = 32
  vga_type   = "qxl" # qxl=SPICE, std=Standard

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
    "ANSIBLE_GATHERING=explicit",
    "ANSIBLE_GATHER_TIMEOUT=20",
    "ANSIBLE_HOST_KEY_CHECKING=False",
    "ANSIBLE_NOCOWS=1",
    "ANSIBLE_PIPELINING=True",
    "ANSIBLE_PYTHON_INTERPRETER=/usr/bin/python3",
    "ANSIBLE_RETRY_FILES_ENABLED=False",
    "ANSIBLE_SSH_ARGS='-o ControlMaster=auto -o ControlPersist=60s'",
    "ANSIBLE_STDOUT_CALLBACK=yaml",
    "ANSIBLE_TIMEOUT=20"
  ]
  inventory_folder = "./ansible/inventory"
  build_playbook   = "./ansible/playbooks/${var.vm_name}_build.yml"
  test_playbook    = "./ansible/playbooks/${var.vm_name}_test.yml"
  manifest_file    = "./manifests/${var.vm_name}.json"
}
