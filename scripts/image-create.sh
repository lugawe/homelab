#!/bin/bash
set -e

mkdir -p ~/image

IMAGE_NAME=$1

if [ -z "$IMAGE_NAME" ]; then
    read -p "Enter name: " IMAGE_NAME
fi

IMAGE_FILE=~/image/$IMAGE_NAME.img
IMAGE_MOUNT_DIR=~/image/$IMAGE_NAME

if [ -f $IMAGE_FILE ]; then
    echo "Image $IMAGE_FILE already exists"
    exit 1
fi

if [ -d $IMAGE_MOUNT_DIR ]; then
    echo "Mount dir $IMAGE_MOUNT_DIR already exists"
    exit 1
else
    mkdir $IMAGE_MOUNT_DIR
fi

read -p "Enter size in GB: " SIZE

dd if=/dev/zero of=$IMAGE_FILE bs=1G count=$SIZE status=progress

cryptsetup luksFormat --type luks2 -q --verify-passphrase $IMAGE_FILE

sudo cryptsetup luksOpen $IMAGE_FILE $IMAGE_NAME
sudo mkfs.btrfs /dev/mapper/$IMAGE_NAME
sudo mount /dev/mapper/$IMAGE_NAME $IMAGE_MOUNT_DIR

echo "$IMAGE_MOUNT_DIR"
echo "Done."
