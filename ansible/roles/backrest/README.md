# BackRest

Use `BackRest` at [https://github.com/garethgeorge/backrest](https://github.com/garethgeorge/backrest) to automate behind-the-scenes backups via `restic`

Also considered using [resticprofile](https://github.com/creativeprojects/resticprofile) but settled on using a web GUI, instead

All backups are preconfigured to:
1. Automatically backup local `/opt` folder ("docker-compose" folder), job runs every `4` hours (from the time Ansible role is installed)
1. Backup to `/mnt/backups` NFS share, with each **host** creating and initializing its own sub-folder
1. Automated monthly **restic** `prune` and `checks`, with randomized hours/minutes to prevent hitting the NFS share at the same time
1. All backups use the same `restic` password, stored in [Doppler](https://dashboard.doppler.com/), under `my-proxmox` > `BACKREST`
1. Use `telegram` bot to alert when errors occur
1. Initial `config.json` file has all of the above settings dynamically written to disk, but only on 1st install; backrest will add additional JSON nodes and Ansible role WON'T overwrite that file once it exists
