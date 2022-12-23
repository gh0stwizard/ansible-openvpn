## Description

Setup OpenVPN server and create client configurations for personal usage.

At the moment only Debian 10+ is supported.


## Quickstart

### Inventory

Edit the `inventory/hosts` file:

```
[openvpn]
host1 ansible_host=10.10.1.1
```

### Setup passwords and vault

Currently the playbook is expecting root ssh password.

```
% echo -n 'my_ssh_password' > passwords/ssh
% echo -n 'my_vault_password' > passwords/vault
% ./create-vault.sh
```

See also, [group_vars](inventory/group_vars/all/vars.yml).

### Run

```
% ansible-playbook site.yml
```

