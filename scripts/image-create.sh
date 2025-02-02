#!/bin/bash
set -e

target_dir=~/.homecloud

mkdir -p $target_dir

image_name=$1

if [ -z "$image_name" ]; then
    read -p "Enter name: " image_name
fi

new_size=$2

if [ -z "$new_size" ]; then
    read -p "Enter size in GB: " new_size
fi

image_file=$target_dir/$image_name.img
image_mount_dir=/mnt/$image_name

if [ -f $image_file ]; then
    echo "Image $image_file already exists"
    exit 1
fi

if [ -d $image_mount_dir ]; then
    echo "Mount dir $image_mount_dir already exists"
    exit 1
else
    sudo mkdir $image_mount_dir
fi

dd if=/dev/zero of=$image_file bs=1G count=$new_size status=progress

cryptsetup luksFormat --type luks2 -q --verify-passphrase $image_file

sudo cryptsetup luksOpen $image_file $image_name
sudo mkfs.ext4 /dev/mapper/$image_name
sudo mount /dev/mapper/$image_name $image_mount_dir

echo "$image_mount_dir"
echo "Done."
