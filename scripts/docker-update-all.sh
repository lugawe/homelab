#!/bin/bash

services=../services

server_files="$services/server"
monitoring_files="$services/monitoring"
nextcloud_files="$services/nextcloud"
code_files="$services/code"

env_file="$services/.env"

docker compose --file "$server_files/compose.yml" --env-file "$env_file" --project-name server pull
docker compose --file "$monitoring_files/compose.yml" --env-file "$env_file" --project-name monitoring pull
docker compose --file "$nextcloud_files/compose.yml" --env-file "$env_file" --project-name nextcloud pull
docker compose --file "$code_files/compose.yml" --env-file "$env_file" --project-name code up -d
