# homelab

My Ubuntu Server 22.04 LTS Homelab

## Info

Steps to reproduce my homelab stuff.

Use at your own risk.

## Image scripts

The following scripts store the encrypted data in <b>~/image</b>.

image-create.sh: Create a luks2 encrypted image file and mount it

image-mount.sh: Open and mount

image-umount.sh: Unmount and close

## Create and manage containers / nodes

### Setup lxc/lxd and images

```shell
# homelab init
sudo mkdir -p /var/lib/homelab
sudo chown -R $USER /var/lib/homelab

# lxc/lxd init
sudo lxd init

# nodes image (~40GB)
image-create.sh nodes 40
lxc storage create nodes-pool dir source=/mnt/nodes

# c_data image (~512GB)
image-create.sh c_data
```

### Create nodes

```shell
node-create.sh
```

### node1 - node3

In node1, node2 and node3 is docker and portainer installed.

Expose portainer web ui ports:

```shell
lxc config device add node1 portainer19443 proxy listen=tcp:0.0.0.0:19443 connect=tcp:0.0.0.0:9443
lxc config device add node2 portainer29443 proxy listen=tcp:0.0.0.0:29443 connect=tcp:0.0.0.0:9443
lxc config device add node3 portainer39443 proxy listen=tcp:0.0.0.0:39443 connect=tcp:0.0.0.0:9443
```

### node1

Container contains nginx-proxy-manager, authelia and heimdall.

### node2

Container contains nextcloud + code-server.

### node3

Container contains jellyfin.

### node4

Container contains virtual machines.
