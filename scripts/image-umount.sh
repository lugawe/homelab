#!/bin/bash

image_name=$1

if [ -z "$image_name" ]; then
    read -p "Enter name: " image_name
fi

image_mount_dir=/mnt/$image_name

if [ ! -d $image_mount_dir ]; then
    echo "Mount dir $image_mount_dir does not exist"
    exit 1
fi

sudo umount $image_mount_dir
sudo cryptsetup close $image_name

echo "Done."
