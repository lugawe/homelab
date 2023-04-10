#!/bin/bash
set -e

node_name=$1

if [ -z "$node_name" ]; then
    read -p "Enter name: " node_name
fi

lxc exec $node_name -- sh -c "sudo apt update && sudo apt upgrade -y"

echo "Done."
