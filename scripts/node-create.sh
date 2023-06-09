#!/bin/bash
set -e

node_name=$1

if [ -z "$node_name" ]; then
    read -p "Enter name: " node_name
fi

if [[ $(lxc ls | grep $node_name) ]]; then
    echo "already exists"
    exit 1
fi

new_passwd=$(uuidgen)

# create container

lxc launch ubuntu:22.04 $node_name --storage nodes-pool

sleep 3

lxc exec $node_name -- sh -c "apt update && apt upgrade -y"
lxc exec $node_name -- sh -c "adduser --disabled-password --gecos '' node && adduser node sudo && echo 'node:$new_passwd' | chpasswd"
lxc exec $node_name -- sh -c "usermod -s /usr/sbin/nologin root"
lxc exec $node_name -- sh -c "usermod -s /usr/sbin/nologin ubuntu"
# lxc exec $node_name -- sh -c "sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config"

lxc config set $node_name security.nesting true

lxc restart $node_name

echo "node@$node_name : $new_passwd"
echo "Done."
