#!/bin/bash
set -e

curl -fsSL https://get.docker.com | sh

# usermod -aG docker $USER
# systemctl disable docker.service
# systemctl disable docker.socket
