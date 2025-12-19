locals {
  hostname     = "arr-lxc"
  description  = "*Arr LXC"
  cores        = 4
  memory       = 12288
  onboot       = true
  unprivileged = false # privileged = true
  tags         = "apps"
  ip           = "192.168.136.26"

  # Disks
  rootfs_size = "20G"
  mountpoint = [
    {
      mp   = "/var/lib/docker"
      size = "30G"
    },
    {
      mp   = "/opt"
      size = "85G"
    }
  ]

  # Launch in this Proxmox node
  target_node = "macmini2"

  # Additional DNS aliases/CNAMEs
  dns_aliases = [
    "traefik-arr-lxc",
    "portainer-arr-lxc",
    "stash",
    "prowlarr",
    "sonarr",
    "radarr",
    "lidarr",
    "qbittorrent",
    "flaresolverr",
    "lazylibrarian",
    "bazarr",
    "booklore",
    "metube"
  ]
}
