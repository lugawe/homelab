#!/bin/bash

services=../docker

server_files="$services/server"
monitoring_files="$services/monitoring"
vaultwarden_files="$services/vaultwarden"
jellyfin_files="$services/jellyfin"
gitea_files="$services/gitea"
collabora_files="$services/collabora"
nextcloud_files="$services/nextcloud"

docker compose --file "$server_files/docker-compose.yml" --env-file "$server_files/.env" --project-name server pull
docker compose --file "$monitoring_files/docker-compose.yml" --env-file "$monitoring_files/.env" --project-name monitoring pull
docker compose --file "$vaultwarden_files/docker-compose.yml" --env-file "$vaultwarden_files/.env" --project-name vaultwarden pull
docker compose --file "$jellyfin_files/docker-compose.yml" --env-file "$jellyfin_files/.env" --project-name jellyfin pull
docker compose --file "$gitea_files/docker-compose.yml" --env-file "$gitea_files/.env" --project-name gitea pull
docker compose --file "$collabora_files/docker-compose.yml" --env-file "$collabora_files/.env" --project-name collabora pull
docker compose --file "$nextcloud_files/docker-compose.yml" --env-file "$nextcloud_files/.env" --project-name nextcloud pull
