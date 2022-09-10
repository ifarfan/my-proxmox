# molecule-test
Container to run `molecule` Ansible tests

It has `systemd` installed in order to test `daemons`

Don't forget to add the following to your docker host configuration –– this allows for testing **daemons** listening on both `ipv4` and `ipv6`:
```shell
  "ipv6": true,
  "fixed-cidr-v6": "fd00::/80",
```

The above addresses a known `goss` issue documented [here](https://github.com/aelsabbahy/goss/issues/149)
