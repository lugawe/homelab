#!/bin/bash
set -e

docker ps -aq | xargs docker stop | xargs docker rm
