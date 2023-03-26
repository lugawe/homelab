#!/bin/bash
set -e

node_nr=$1

if [ -z "$node_nr" ]; then
    read -p "Enter node number (1-4): " node_nr
fi

if ! [[ $node_nr =~ ^[1-4]$ ]]; then
    echo "invalid input"
    exit 1
fi

node_name="node$node_nr"

if [[ $(lxc ls | grep $node_name) ]]; then
    echo "already exists"
    exit 1
fi

new_passwd=$(uuidgen)

# create container

lxc launch ubuntu:22.04 $node_name --storage image-server-pool
lxc exec $node_name -- sh -c "apt update && apt upgrade -y"
lxc exec $node_name -- sh -c "adduser --disabled-password --gecos '' $node_name && adduser $node_name sudo && echo '$node_name:$new_passwd' | chpasswd"
lxc exec $node_name -- sh -c "usermod -s /usr/sbin/nologin root && usermod -s /usr/sbin/nologin ubuntu"
# lxc exec $node_name -- sh -c "sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config"

lxc config set $node_name security.nesting true

lxc restart $node_name

echo "$node_name@$node_name : $new_passwd"
echo "Done."
