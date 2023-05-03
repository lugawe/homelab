# homelab

My Ubuntu Server 22.04 LTS Homelab

## Info

Steps to reproduce my homelab stuff.

Use at your own risk.

## Image scripts

The following scripts store the encrypted data in <b>/var/lib/homelab/image</b>.

image-create.sh: Create a luks2 encrypted image file and mount it

image-mount.sh: Open and mount

image-umount.sh: Unmount and close

## Create and manage containers / nodes

### Setup lxc/lxd and images

```shell
# homelab init
sudo mkdir -p /var/lib/homelab
sudo chown -R $USER /var/lib/homelab

# nodes image (~40GB)
image-create.sh nodes 40

# c_data image (~512GB)
image-create.sh c_data 512

# lxc/lxd init
sudo lxd init

# disable lxc/lxd container autostart
lxc profile set default boot.autostart=false

# create lxc/lxd storage pool
lxc storage create nodes-pool btrfs source=/mnt/nodes
```

### Create nodes

```shell
node-create.sh
```

### node-main

### node-vm
