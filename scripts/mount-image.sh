#!/bin/bash
set -e

echo Enter name:
read IMAGE_NAME

IMAGE_FILE=~/image/$IMAGE_NAME.img
IMAGE_MOUNT_DIR=~/image/$IMAGE_NAME

if [ ! -f $IMAGE_FILE ]; then
    echo Image does not exist
    exit 1
fi

if [ ! -d $CONTAINER_DIR ]; then
    echo Dir does not exist
    exit 1
fi

sudo cryptsetup luksOpen $IMAGE_FILE $IMAGE_NAME
sudo mount /dev/mapper/$IMAGE_NAME $IMAGE_MOUNT_DIR

echo Done.
