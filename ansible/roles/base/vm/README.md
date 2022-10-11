# Ubuntu 22.04 (Jammy Jellyfish)

Base `Ubuntu 22.04` role with default OS configurations

Configuring the following items:
- `apt` (behavior update configs)
- `aws`-cli (AWS)
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
