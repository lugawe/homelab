# node2

node2 setup

## init

Before docker-compose:

```shell
# link to docs image
lxc config device add node2 docs disk source=~/image/docs path=/home/node2/docs

# create nextcloud dirs
mkdir -p -m 777 ~/image/docs/nextcloud/config
mkdir -p -m 777 ~/image/docs/nextcloud/data
```

After docker-compose:

```shell
# expose port
lxc config device add node2 nextcloud20443 proxy listen=tcp:0.0.0.0:20443 connect=tcp:0.0.0.0:443
```
