# Ubuntu 24.04 (Jammy Jellyfish)

Base `Ubuntu 24.04` role with default OS configurations

Configuring the following items:
- `apt` (behavior update configs)
- `chrony` (NTP replacement)
- `cron` (configs + removing default files)
- `files` (some /etc/ files)
- `locale` (US values)
- `logrotate` (install logrotation client)
- `motd` (message-of-the-day on SSH/login)
- `pam` (security/authentication modules)
- `rsyslog` (syslog daemon)
- `ssh` (SSH security tweaks)
- `sysctl` (kernel tweaks for VM performance)
- `timezone` (UTC)

Use `is_lxc == true` as a way to differentiate installation steps between a `VM` and a `LXC` instance
Use `is_rpi == true` for specific Raspberry Pi configurations
