#!/bin/bash
set -e

mkdir -p ~/data
mkdir -p ~/container

echo Enter name:
read IMAGE_NAME

IMAGE_PATH=~/data/$IMAGE_NAME.img
CONTAINER_DIR=~/container/$IMAGE_NAME

if [ -f $IMAGE_PATH ]; then
    echo Image already exists
    exit 1
fi

if [ -d $CONTAINER_DIR ]; then
    echo Dir already exists
    exit 1
else
    mkdir $CONTAINER_DIR
fi

echo Enter size in GB:
read SIZE

dd if=/dev/zero of=$IMAGE_PATH bs=1G count=$SIZE status=progress

cryptsetup luksFormat --type luks2 -q --verify-passphrase $IMAGE_PATH

sudo cryptsetup luksOpen $IMAGE_PATH $IMAGE_NAME
sudo mkfs.btrfs /dev/mapper/$IMAGE_NAME
sudo mount /dev/mapper/$IMAGE_NAME $CONTAINER_DIR

echo $CONTAINER_DIR
echo Done.
