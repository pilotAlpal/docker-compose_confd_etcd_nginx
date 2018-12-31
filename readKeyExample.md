# Test etcd server

> 1st check network name with docker network ls

## Get inserted keys with etcdctl docker
```bash
docker run -it --rm --network docker-compose_confd_etcd_nginx_app-tier --env ALLOW_NONE_AUTHENTICATION=yes bitnami/etcd:latest etcdctl --endpoints http://etcd-server:2379 get /myapp/database/url
```

## Check etcd server version via curl docker
```bash
docker run -it --rm --network dockercomposeconfdetcdnginx_app-tier --env ALLOW_NONE_AUTHENTICATION=yes appropriate/curl -L http://etcd-server:2379/version
```

## Insert key value (message, "Hello")

```bash
docker run -it --rm --network dockercomposeconfdetcdnginx_app-tier --env ALLOW_NONE_AUTHENTICATION=yes appropriate/curl -L http://etcd-server:2379/v2/keys/message -XPUT -d value="Hello"
```

## Read value of key message

```bash
docker run -it --rm --network dockercomposeconfdetcdnginx_app-tier --env ALLOW_NONE_AUTHENTICATION=yes appropriate/curl http://etcd-server:2379/v2/keys/message
```
