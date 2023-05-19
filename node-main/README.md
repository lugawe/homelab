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
lxc config device add node-main traefik2222 proxy listen=tcp:0.0.0.0:2222 connect=tcp:0.0.0.0:2222

# c_data
lxc config device add node-main c_data disk source=/mnt/c_data path=/mnt/c_data

# create container dirs
mkdir -p -m 777 /mnt/c_data/traefik
mkdir -p -m 777 /mnt/c_data/authelia
mkdir -p -m 777 /mnt/c_data/gotify
mkdir -p -m 777 /mnt/c_data/heimdall
mkdir -p -m 777 /mnt/c_data/gitea
mkdir -p -m 777 /mnt/c_data/vscode
mkdir -p -m 777 /mnt/c_data/nextcloud
mkdir -p -m 777 /mnt/c_data/vaultwarden
mkdir -p -m 777 /mnt/c_data/jellyfin

# jellyfin
lxc config device add node-main jellyfin18096 proxy listen=tcp:0.0.0.0:18096 connect=tcp:0.0.0.0:18096
lxc config device add node-main extern_disk disk source=/mnt/extern_disk path=/mnt/extern_disk
```
