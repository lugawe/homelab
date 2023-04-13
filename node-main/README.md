# node-main

node-main setup

<b>traefik + authelia</b>

<b>heimdall</b>

<b>gitea</b>

<b>nextcloud</b>

<b>vaultwarden</b>

<b>jellyfin</b>

## init

```shell
# portainer
lxc config device add node-main portainer9443 proxy listen=tcp:0.0.0.0:9443 connect=tcp:0.0.0.0:9443

# traefik
lxc config device add node-main traefik80 proxy listen=tcp:0.0.0.0:80 connect=tcp:0.0.0.0:80
lxc config device add node-main traefik443 proxy listen=tcp:0.0.0.0:443 connect=tcp:0.0.0.0:443

# c_data
lxc config device add node-main c_data disk source=/mnt/c_data path=/mnt/c_data

# gitea
mkdir -p -m 777 /mnt/c_data/gitea

# nextcloud
mkdir -p -m 777 /mnt/c_data/nextcloud

# vaultwarden
mkdir -p -m 777 /mnt/c_data/vaultwarden

# jellyfin
lxc config device add node-main jellyfin14003 proxy listen=tcp:0.0.0.0:14003 connect=tcp:0.0.0.0:4003
lxc config device add node-main extern_disk disk source=/mnt/extern_disk path=/mnt/extern_disk
```

## nextcloud

Check nextcloud config:

```
/config/www/nextcloud/config/config.php

Configure: 'trusted_domains'
Configure: 'trusted_proxies'
Set: 'check_data_directory_permissions' => false
Set: 'overwriteprotocol' => 'https'
```

## jellyfin
