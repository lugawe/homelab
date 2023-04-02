# node1

node1 setup

## init

Before docker-compose:

```shell
# expose ports

# nginx-reverse-proxy
lxc config device add node1 npm80 proxy listen=tcp:0.0.0.0:80 connect=tcp:0.0.0.0:80
lxc config device add node1 npm443 proxy listen=tcp:0.0.0.0:443 connect=tcp:0.0.0.0:443

lxc config device add node1 npm10081 proxy listen=tcp:0.0.0.0:10081 connect=tcp:0.0.0.0:81

# authelia
lxc config device add node1 authelia19091 proxy listen=tcp:0.0.0.0:19091 connect=tcp:0.0.0.0:9091

# heimdall
lxc config device add node1 heimdall11443 proxy listen=tcp:0.0.0.0:11443 connect=tcp:0.0.0.0:1443
```
