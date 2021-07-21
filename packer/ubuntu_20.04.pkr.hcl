#
#  Variables
#
variable "iso_filename" {
  type    = string
  default = "ubuntu_focal_minimal.iso"
}

variable "proxmox_password" {
  type      = string
  sensitive = true
}

variable "proxmox_url" {
  type    = string
  default = "https://localhost:8006/api2/json"
}

variable "proxmox_username" {
  type    = string
  default = "root@pam"
}

variable "ssh_username" {
  type    = string
  default = "packer"
}

variable "ssh_password" {
  type      = string
  default   = "p@ck3r-t3mp!"
  sensitive = true
}

variable "template_description" {
  type    = string
  default = "Ubuntu 20.04 x86_64 template built with packer"
}

variable "vm_cores" {
  type    = string
  default = "1"
}

variable "vm_disksize" {
  type    = string
  default = "8G"
}

variable "vm_id" {
  type    = string
  default = "100"
}

variable "vm_memory" {
  type    = string
  default = "2048"
}

variable "vm_name" {
  type    = string
  default = "ubuntu-2004"
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

#
#  Source
#
source "proxmox" "install_from_iso" {
  boot_command = [
    "<esc><wait>",
    "install",
    " initrd=initrd.gz",
    " auto=true",
    " priority=critical",
    " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu_20.04.preseed.cfg",
    " --- <wait>",
    "<enter><wait>"
  ]
  boot_wait = "10s"
  cores     = var.vm_cores
  cpu_type  = "host"
  disks {
    disk_size         = var.vm_disksize
    storage_pool      = "local-lvm"
    storage_pool_type = "lvm"
    type              = "scsi"
  }
  http_directory           = "http"
  insecure_skip_tls_verify = true
  iso_file                 = "local:iso/${var.iso_filename}"
  memory                   = var.vm_memory
  network_adapters {
    bridge = "vmbr0"
    model  = "virtio"
  }
  node                 = "macmini2"
  os                   = "l26"
  password             = var.proxmox_password
  proxmox_url          = var.proxmox_url
  qemu_agent           = true
  ssh_password         = var.ssh_password
  ssh_timeout          = "30m"
  ssh_username         = var.ssh_username
  template_description = var.template_description
  template_name        = "${var.vm_name}-template"
  unmount_iso          = true
  username             = var.proxmox_username
  vga {
    memory = 32
    type   = "vmware"
  }
  vm_id   = var.vm_id
  vm_name = var.vm_name
}

#
#  Build
#
build {
  description = "Build Ubuntu 20.04 (focal) x86_64 Proxmox template"

  sources = [
    "source.proxmox.install_from_iso"
  ]

  post-processor "shell-local" {
    inline = [
      "qm set ${var.vm_id} --scsihw virtio-scsi-pci",
      "qm set ${var.vm_id} --ide2 local-lvm:cloudinit",
      "qm set ${var.vm_id} --boot c --bootdisk scsi0"
    ]
    inline_shebang = "/bin/bash -e"
  }
}
