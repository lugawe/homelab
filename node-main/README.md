# node-main

node-main setup

## init

```shell
# traefik
lxc config device add node-main traefik80 proxy listen=tcp:0.0.0.0:80 connect=tcp:0.0.0.0:80
lxc config device add node-main traefik443 proxy listen=tcp:0.0.0.0:443 connect=tcp:0.0.0.0:443
```
