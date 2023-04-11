# node1

node1 setup

## init

```shell
# traefik
lxc config device add node1 traefik80 proxy listen=tcp:0.0.0.0:80 connect=tcp:0.0.0.0:80
lxc config device add node1 traefik443 proxy listen=tcp:0.0.0.0:443 connect=tcp:0.0.0.0:443
```
