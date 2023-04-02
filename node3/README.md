# node3

node3 setup

## init

```shell
# link to c_data image
lxc config device add node3 c_data disk source=~/image/c_data path=/mnt/c_data

# link to extern disk
lxc config device add node3 extern_disk disk source=~/extern_disk path=/mnt/extern_disk

# create jellyfin dirs
mkdir -p -m 777 ~/extern_disk/.docker/jellyfin/config

# expose port
lxc config device add node3 jellyfin38096 proxy listen=tcp:0.0.0.0:38096 connect=tcp:0.0.0.0:8096
```
