#!/bin/bash
set -e

dir_name=$1

if [ ! -d $dir_name ]; then
    echo "dir $dir_name does not exist"
    exit 1
fi

sudo chown -R $USER: $dir_name
sudo chmod -R 740 $dir_name
