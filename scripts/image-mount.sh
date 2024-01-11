#!/bin/bash
set -e

target_dir=/var/cimage

image_name=$1

if [ -z "$image_name" ]; then
    read -p "Enter name: " image_name
fi

image_file=$target_dir/$image_name.img
image_mount_dir=/mnt/$image_name

if [ ! -f $image_file ]; then
    echo "Image $image_name does not exist"
    exit 1
fi

if [ ! -d $image_mount_dir ]; then
    echo "Mount dir $image_mount_dir does not exist"
    exit 1
fi

sudo cryptsetup luksOpen $image_file $image_name
sudo mount /dev/mapper/$image_name $image_mount_dir

echo "Done."
