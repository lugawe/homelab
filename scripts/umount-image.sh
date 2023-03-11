#!/bin/bash

echo Enter name:
read IMAGE_NAME

CONTAINER_DIR=~/container/$IMAGE_NAME

sudo umount $CONTAINER_DIR
sudo cryptsetup close $IMAGE_NAME

echo Done.
