# Traefik

Run **traefik** as a `container` proxying sited hosted via `portainer`

In addition, take control of DNS entries via `Cloudflare` integration

# Issue w/ AppArmor
See:
- https://github.com/opencontainers/runc/issues/4968#issue-3593655843
- https://www.reddit.com/r/selfhosted/comments/1otehoy/docker_containers_fail_to_start_with_permission/

1. Go to `/etc/pve/lxc` on Proxmox host
2. Make a backup of ###.conf LXC file
3. Append the following lines to the end of file + save

```shell
lxc.apparmor.profile: unconfined
lxc.mount.entry: /dev/null sys/module/apparmor/parameters/enabled none bind 0 0
```
4. Restart LXC container
