# homelab
My homelab server configs

## File Structure

All Files are stored in `/mnt/homecloud`.

All internal (apps, configs, databases, ...) files are stored in `/mnt/homecloud/data`.

All external (usb stick, ssd, ...) files are stored in `/mnt/homecloud/extern` and can only be read by homecloud, not written to.

## Setup

Run the following commands to setup homecloud:

```bash
# homecloud
sudo mkdir /mnt/homecloud
scripts/permissions.sh /mnt/homecloud

mkdir /mnt/homecloud/data
mkdir /mnt/homecloud/extern

# env file
cp services/.env.template services/.env
vim services/.env

# server
mkdir /mnt/homecloud/data/server

mkdir /mnt/homecloud/data/server/traefik
mkdir /mnt/homecloud/data/server/traefik/config
mkdir /mnt/homecloud/data/server/traefik/certificates
mkdir /mnt/homecloud/data/server/traefik/logs

mkdir /mnt/homecloud/data/server/authelia
mkdir /mnt/homecloud/data/server/authelia/config
cp services/server/authelia/config/* /mnt/homecloud/data/server/authelia/config

mkdir /mnt/homecloud/data/server/tailscale
mkdir /mnt/homecloud/data/server/tailscale/app

# monitoring
mkdir /mnt/homecloud/data/monitoring

mkdir /mnt/homecloud/data/monitoring/grafana
mkdir /mnt/homecloud/data/monitoring/grafana/app

mkdir /mnt/homecloud/data/monitoring/prometheus
mkdir /mnt/homecloud/data/monitoring/prometheus/database
mkdir /mnt/homecloud/data/monitoring/prometheus/config
cp services/monitoring/prometheus/config/prometheus.yml /mnt/homecloud/data/monitoring/prometheus/config

# nextcloud
mkdir /mnt/homecloud/data/nextcloud
mkdir /mnt/homecloud/data/nextcloud/app
mkdir /mnt/homecloud/data/nextcloud/database

# gitea
mkdir /mnt/homecloud/data/gitea
mkdir /mnt/homecloud/data/gitea/app
mkdir /mnt/homecloud/data/gitea/database

# finish
scripts/permissions.sh /mnt/homecloud

```

## Included Services

### Server

Traefik: reverse proxy

Authelia: authentication

Tailscale: vpn

### Monitoring

Grafana: dashboards to visualize prometheus data

Prometheus: database to store metrics

Prometheus-Node-Exporter: export system stats (cpu load, mem load, ...)

### Nextcloud

Nextcloud is used to store personal data. Postgres is used as database.

### Gitea

Gitea is used to store git projects. Postgres is used as database.
