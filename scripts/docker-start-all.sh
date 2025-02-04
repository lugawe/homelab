#!/bin/bash

services=../services

server_files="$services/server"
monitoring_files="$services/monitoring"
vaultwarden_files="$services/vaultwarden"
jellyfin_files="$services/jellyfin"
gitea_files="$services/gitea"
collabora_files="$services/collabora"
nextcloud_files="$services/nextcloud"

env_file="$services/.env"

docker compose --file "$server_files/compose.yml" --env-file "$env_file" --project-name server up -d
docker compose --file "$monitoring_files/compose.yml" --env-file "$env_file" --project-name monitoring up -d
docker compose --file "$vaultwarden_files/compose.yml" --env-file "$env_file" --project-name vaultwarden up -d
docker compose --file "$jellyfin_files/compose.yml" --env-file "$env_file" --project-name jellyfin up -d
docker compose --file "$gitea_files/compose.yml" --env-file "$env_file" --project-name gitea up -d
docker compose --file "$collabora_files/compose.yml" --env-file "$env_file" --project-name collabora up -d
docker compose --file "$nextcloud_files/compose.yml" --env-file "$env_file" --project-name nextcloud up -d
