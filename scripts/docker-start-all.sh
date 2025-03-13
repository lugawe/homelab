#!/bin/bash

services=../services

server_files="$services/server"
monitoring_files="$services/monitoring"
nextcloud_files="$services/nextcloud"
code_files="$services/code"

env_file="$services/.env"

docker compose --file "$server_files/compose.yml" --env-file "$env_file" --project-name server up -d
docker compose --file "$monitoring_files/compose.yml" --env-file "$env_file" --project-name monitoring up -d
docker compose --file "$nextcloud_files/compose.yml" --env-file "$env_file" --project-name nextcloud up -d
docker compose --file "$code_files/compose.yml" --env-file "$env_file" --project-name code up -d
