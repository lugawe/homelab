#!/bin/bash
set -e

docker ps -aq | xargs docker stop | xargs docker rm
docker network prune -f
