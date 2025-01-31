#!/bin/bash

services=../docker

server_files="$services/server"
monitoring_files="$services/monitoring"
vaultwarden_files="$services/vaultwarden"
jellyfin_files="$services/jellyfin"
gitea_files="$services/gitea"
collabora_files="$services/collabora"
nextcloud_files="$services/nextcloud"

env_file="../docker/.env"

docker compose --file "$server_files/docker-compose.yml" --env-file "$env_file" --project-name server pull
docker compose --file "$monitoring_files/docker-compose.yml" --env-file "$env_file" --project-name monitoring pull
docker compose --file "$vaultwarden_files/docker-compose.yml" --env-file "$env_file" --project-name vaultwarden pull
docker compose --file "$jellyfin_files/docker-compose.yml" --env-file "$env_file" --project-name jellyfin pull
docker compose --file "$gitea_files/docker-compose.yml" --env-file "$env_file" --project-name gitea pull
docker compose --file "$collabora_files/docker-compose.yml" --env-file "$env_file" --project-name collabora pull
docker compose --file "$nextcloud_files/docker-compose.yml" --env-file "$env_file" --project-name nextcloud pull
