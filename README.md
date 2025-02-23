# homelab
My homelab server configs

## File Structure

All Files are stored in `/mnt/homecloud`.

All internal (apps, configs, databases, ...) files are stored in `/mnt/homecloud/data`.

All external (usb stick, ssd, ...) files are stored in `/mnt/homecloud/extern` and can only be read by homecloud, not written to.

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
