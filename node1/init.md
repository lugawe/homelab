# node1

node1 setup

## init

Before docker-compose:

```shell
# expose port
lxc config device add node1 nginx11080 proxy listen=tcp:0.0.0.0:11080 connect=tcp:0.0.0.0:1080
lxc config device add node1 nginx11081 proxy listen=tcp:0.0.0.0:11081 connect=tcp:0.0.0.0:1081
lxc config device add node1 nginx11443 proxy listen=tcp:0.0.0.0:11443 connect=tcp:0.0.0.0:1443
lxc config device add node1 authelia11091 proxy listen=tcp:0.0.0.0:11091 connect=tcp:0.0.0.0:1091
lxc config device add node1 heimdall10080 proxy listen=tcp:0.0.0.0:10080 connect=tcp:0.0.0.0:80
lxc config device add node1 heimdall10443 proxy listen=tcp:0.0.0.0:10443 connect=tcp:0.0.0.0:443
```
