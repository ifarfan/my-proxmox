# run_tests

Quick 'n dirty pseudo-`role` to run goss tests on remote hosts

Tasks:
- Copy `goss` tests for a role, located under `roles/{{ROLE}}/molecule/tests/*.yml` to remote host
- Tests are placed in remote host under `/tmp/goss/`
- Execute `goss` tests and report `success` or `failure`, i.e.,
  ```shell
  goss --gossfile /tmp/goss/*.yml* validate --format documentation
  ```

**NOTE**: This pseudo-role doesn't contain any `molecule` tests of its own :(
