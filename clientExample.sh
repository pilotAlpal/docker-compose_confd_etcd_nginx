#!/bin/bash
docker run -it --rm --network docker-compose_confd_etcd_nginx_app-tier --env ALLOW_NONE_AUTHENTICATION=yes bitnami/etcd:latest etcdctl --endpoints http://etcd-server:2379 set /message Hello
