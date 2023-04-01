# node2

node2 setup

## init

Before docker-compose:

```shell
# link to c_data image
lxc config device add node2 c_data disk source=~/image/c_data path=/mnt/c_data

# create nextcloud dirs
mkdir -p -m 777 ~/image/docs/nextcloud
mkdir -p -m 777 ~/image/docs/nextcloud/config
mkdir -p -m 777 ~/image/docs/nextcloud/data

# create code-server dirs
mkdir -p -m 777 ~/image/docs/code-server
mkdir -p -m 777 ~/image/docs/code-server/config

# expose port
lxc config device add node2 nextcloud20443 proxy listen=tcp:0.0.0.0:20443 connect=tcp:0.0.0.0:443
lxc config device add node2 code-server28443 proxy listen=tcp:0.0.0.0:28443 connect=tcp:0.0.0.0:8443
```
