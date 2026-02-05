
# Infra

Das ist meine "homecloud". Alles wird lokal in "/mnt/homecloud" gespeichert.

Es wird mit k3s on-prem bei mir daheim gehostet. Und es wird mit Kubernetes und
Kustomize gearbeitet. Helm (Charts) werden NICHT verwendet.

## Aufbau

### SSO

Es gibt ein single sign on System mit Keycloak. Alle Dienste sollen nur erreichbar sein
wenn man sich einfach einmalig mit Keycloak angemeldet hat.

### VPN

Externer Zugriff ist nur via VPN möglich. Hier mit Tailscale auf Kubernetes.

### Grafana (SSO/OIDC)

Es wird Grafana gehosted um Logs und Metrics zu sammeln.

### Nextcloud (SSO/OIDC)

Es wird eine Nextcloud gehosted.

### Gitea (SSO/OIDC)

Es wird Gitea gehosted.

### Secrets

Secrets werden mit Kustomize secretGenerator und einer lokalen .env Datei verwaltet.

## Infos

Das ganze System soll soweit wie möglich komplett reproduzierbar sein. Ohne dass man
wenn man es neu aufsetzen möchte erstmal "100" Config Einträge ändern muss.

