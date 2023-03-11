#!/bin/bash
set -e

echo Enter name:
read IMAGE_NAME

IMAGE_PATH=~/data/$IMAGE_NAME.img
CONTAINER_DIR=~/container/$IMAGE_NAME

if [ ! -f $IMAGE_PATH ]; then
    echo Image does not exist
    exit 1
fi

if [ ! -d $CONTAINER_DIR ]; then
    echo Dir does not exist
    exit 1
fi

sudo cryptsetup luksOpen $IMAGE_PATH $IMAGE_NAME
sudo mount /dev/mapper/$IMAGE_NAME $CONTAINER_DIR

echo Done.
