#!/bin/bash
set -e

node_nr=$1

if [ -z "$node_nr" ]; then
    read -p "Enter node number (1-5): " node_nr
fi

if ! [[ $node_nr =~ ^[1-5]$ ]]; then
    echo "invalid input"
    exit 1
fi

node_name="node$node_nr"

lxc exec $node_name -- sh -c "sudo apt update && sudo apt upgrade -y"

echo "Done."
