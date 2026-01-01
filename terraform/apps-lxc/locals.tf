locals {
  hostname     = "apps-lxc"
  description  = "Apps LXC"
  cores        = 4
  memory       = 8192
  onboot       = true
  unprivileged = false # privileged = true
  tags         = "apps"
  ip           = "192.168.136.27"

  # Disks
  rootfs_size = "30G"
  mountpoint = [
    {
      mp   = "/var/lib/docker"
      size = "50G"
    },
    {
      mp   = "/opt"
      size = "50G"
    }
  ]

  # Launch in this Proxmox node
  target_node = "macmini3"

  # Additional DNS aliases/CNAMEs
  dns_aliases = [
    "traefik-apps-lxc",
    "portainer-apps-lxc",
    "termix",
    "homepage",
    "glances",
    "atuin",
    "dozzle",
    "plex",
    "neko",
    "speedtest-tracker",
    "wakapi",
    "snippet-box",
    "jotty",
    "booklore",
    "ephemera",
    "it-tools",
    "glance",
  ]
}
