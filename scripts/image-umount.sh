#!/bin/bash

IMAGE_NAME=$1

if [ -z "$IMAGE_NAME" ]; then
    read -p "Enter name: " IMAGE_NAME
fi

IMAGE_MOUNT_DIR=~/image/$IMAGE_NAME

if [ ! -d $IMAGE_MOUNT_DIR ]; then
    echo "Mount dir $IMAGE_MOUNT_DIR does not exist"
    exit 1
fi

sudo umount $IMAGE_MOUNT_DIR
sudo cryptsetup close $IMAGE_NAME

echo "Done."
