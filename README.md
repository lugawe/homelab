# homelab

My Ubuntu Server 22.04 LTS Homelab

## Info

Steps to reproduce my homelab stuff.

Use at your own risk.

## Image scripts

The following scripts store the encrypted data in <b>/var/cimage</b>.

image-create.sh: Create a luks2 encrypted image file and mount it

image-mount.sh: Open and mount

image-umount.sh: Unmount and close

## Create and manage containers / nodes

### Setup lxc/lxd and images

```shell
# homelab init
sudo mkdir /var/cimage
sudo chown -R $USER /var/cimage

# c_data image
image-create.sh c_data

# lxc/lxd init
sudo lxd init

# disable lxc/lxd container autostart
lxc profile set default boot.autostart=false
```

### Create nodes

```shell
node-create.sh
```

### node-main

### node-vm
