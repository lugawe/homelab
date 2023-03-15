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

if [[ $(lxc ls | grep $node_name) ]]; then
    echo "already exists"
    exit 1
fi

new_passwd=$(uuidgen)

host_port="$node_nr"
host_port+="0022"

device_name="ssh$host_port"

# create container

lxc launch ubuntu:22.04 $node_name --storage image-server-pool
lxc exec $node_name -- sh -c "apt update && apt upgrade -y"
lxc exec $node_name -- sh -c "adduser --disabled-password --gecos '' $node_name && adduser $node_name sudo && echo '$node_name:$new_passwd' | chpasswd"
lxc exec $node_name -- sh -c "sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config"

lxc config set $node_name security.nesting true
lxc config device add $node_name $device_name proxy listen=tcp:0.0.0.0:$host_port connect=tcp:0.0.0.0:22

lxc restart $node_name

echo "$node_name@$node_name : $new_passwd"
echo "Done."
