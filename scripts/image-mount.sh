#!/bin/bash
set -e

TARGET_DIR=/var/lib/homelab/image

IMAGE_NAME=$1

if [ -z "$IMAGE_NAME" ]; then
    read -p "Enter name: " IMAGE_NAME
fi

IMAGE_FILE=$TARGET_DIR/$IMAGE_NAME.img
IMAGE_MOUNT_DIR=/mnt/$IMAGE_NAME

if [ ! -f $IMAGE_FILE ]; then
    echo "Image $IMAGE_NAME does not exist"
    exit 1
fi

if [ ! -d $IMAGE_MOUNT_DIR ]; then
    echo "Mount dir $IMAGE_MOUNT_DIR does not exist"
    exit 1
fi

sudo cryptsetup luksOpen $IMAGE_FILE $IMAGE_NAME
sudo mount /dev/mapper/$IMAGE_NAME $IMAGE_MOUNT_DIR

echo "Done."
