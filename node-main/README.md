# node-main

node-main setup

## init

```shell
# portainer
lxc config device add node-main portainer19443 proxy listen=tcp:0.0.0.0:19443 connect=tcp:0.0.0.0:9443

# traefik
lxc config device add node-main traefik80 proxy listen=tcp:0.0.0.0:80 connect=tcp:0.0.0.0:80
lxc config device add node-main traefik443 proxy listen=tcp:0.0.0.0:443 connect=tcp:0.0.0.0:443

# c_data
lxc config device add node-main c_data disk source=/mnt/c_data path=/mnt/c_data

# nextcloud
mkdir -p -m 777 /mnt/c_data/nextcloud
mkdir -p -m 777 /mnt/c_data/nextcloud/config
mkdir -p -m 777 /mnt/c_data/nextcloud/data
```

## nextcloud

Check nextcloud config:

```
/config/www/nextcloud/config/config.php

Configure: trusted_domains
Set 'check_data_directory_permissions' => false
Set 'overwriteprotocol' => 'https'
```
