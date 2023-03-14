# homelab

My Ubuntu Server 22.04 LTS Homelab

## Info

Steps to reproduce my homelab stuff.

Use at your own risk.

## Scripts

The following scripts store the encrypted data in <b>~/image</b>.

image-create.sh: Create a luks2 encrypted image file and mount it

image-mount.sh: Open and mount

image-umount.sh: Unmount and close

## Create and manage containers

### Setup lxc/lxd

```shell script
sudo lxd init
image-create.sh server
lxc storage create image-server-pool dir source=~/image/server
```
