#!/bin/bash

echo Enter name:
read IMAGE_NAME

IMAGE_MOUNT_DIR=~/image/$IMAGE_NAME

sudo umount $IMAGE_MOUNT_DIR
sudo cryptsetup close $IMAGE_NAME

echo Done.
