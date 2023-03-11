#!/bin/bash

echo Enter name:
read IMAGE_NAME

IMAGE_MOUNT_DIR=~/image/$IMAGE_NAME

if [ ! -d $IMAGE_MOUNT_DIR ]; then
    echo Dir does not exist
    exit 1
fi

sudo umount $IMAGE_MOUNT_DIR
sudo cryptsetup close $IMAGE_NAME

echo Done.
