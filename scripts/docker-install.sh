#!/bin/bash
set -e

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# usermod -aG docker $USER
# systemctl disable docker.service
# systemctl disable docker.socket
