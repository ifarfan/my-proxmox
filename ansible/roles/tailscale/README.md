# Tailscale

Run **tailscale** as a `container` running as a **subnet route**

See https://tailscale.com/kb/1282/docker
Examples: https://github.com/tailscale-dev/docker-guide-code-examples

# LXC Permissions Issue
Update `LXC` to launch **Tailscale** w/ enough privileges, see::
  - https://github.com/portainer/portainer/issues/8478
  - https://forum.proxmox.com/threads/how-to-enable-tun-tap-in-a-lxc-container.25339/#post-126984
  - https://pve.proxmox.com/wiki/OpenVPN_in_LXC

1. Go to `/etc/pve/lxc` on Proxmox host
2. Make a backup of ###.conf LXC file
3. Append the following lines to the end of file + save

```shell
lxc.apparmor.profile: unconfined
lxc.cap.drop:
lxc.cgroup2.devices.allow: c 10:200 rwm
lxc.mount.entry: /dev/net dev/net none bind,create=dir
```
4. Restart LXC container
