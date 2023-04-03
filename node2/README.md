# node2

node2 setup

## init

```shell
# link to c_data image
lxc config device add node2 c_data disk source=~/image/c_data path=/mnt/c_data

# create nextcloud dirs
mkdir -p -m 777 ~/image/c_data/nextcloud
mkdir -p -m 777 ~/image/c_data/nextcloud/config
mkdir -p -m 777 ~/image/c_data/nextcloud/data

# create vaultwarden dirs
mkdir -p -m 777 ~/image/c_data/vaultwarden
mkdir -p -m 777 ~/image/c_data/vaultwarden/data

# expose ports
lxc config device add node2 nextcloud20443 proxy listen=tcp:0.0.0.0:20443 connect=tcp:0.0.0.0:443
lxc config device add node2 vaultwarden21080 proxy listen=tcp:0.0.0.0:21080 connect=tcp:0.0.0.0:1080
```
