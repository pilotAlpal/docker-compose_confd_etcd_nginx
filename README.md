# confd - docker-compose - etcd

## Abstract

This practice follows [confd - Quickstart Guide - Advanced Example](https://github.com/kelseyhightower/confd/blob/master/docs/quick-start-guide.md#advanced-example).

docker-compose manages the following services:
- etcd-server: key-value store, backend for confd
- confd-nginx: nginx server managed by confd acording to the values inserted to etcd-server. Requests to localhost are routed to the python app
- etcd-curl: inserts values to etcd-server via curl
- py-app: simple python flask server, target of nginx proxy

---

## Flow
- etcd-server: listens requests to http://etcd-server:2379/v2/
- etcd-curl: inserts into etcd-server the following key-values (K , V):
	- (/myapp/subdomain , localhost)
	- (/myapp/location , get-time)
	- (/myapp/proxytarget , py-app:8081/dtime)
- py-app: listens to requests to http://py-app:8081
- confd-nginx: confd updates nginx conf file in accordance with to values at etcd-server (setted by etcd-curl) and launches nginx acording to the file:
	- Requests to localhost/get-time/ will be routed to http://py-app:8081/dtime   
## Test

Build and run services
```bash
docker-compose up --build
```
(From another shell) Request nginx and get python app´s response
```bash
curl localhost/get-time/
```

## Sources and related links

- [confd](https://github.com/kelseyhightower/confd#confd)
- [confd - Instalation](https://github.com/kelseyhightower/confd/blob/master/docs/installation.md#installation)
- [etcd](https://coreos.com/etcd/docs/latest/op-guide/configuration.html#member-flags)
- [etcd - getting started](https://github.com/etcd-io/etcd#getting-started) 
- [docker - etcd](https://github.com/bitnami/bitnami-docker-etcd)
- [etcd - releases](https://github.com/etcd-io/etcd/releases)
- [nginx - command line params.](http://nginx.org/en/docs/switches.html)
- [nginx - core module - daemon](http://nginx.org/en/docs/ngx_core_module.html#daemon)
- [nginx - request processing](http://nginx.org/en/docs/http/request_processing.html)
- [nginx - Starting, Stopping and Restarting](https://www.nginx.com/resources/wiki/start/topics/tutorials/commandline/) 
- [alpine - Init Scripts](https://wiki.alpinelinux.org/wiki/Writing_Init_Scripts) - Not used
- [nginx alpine - Dockerfile](https://github.com/nginxinc/docker-nginx/blob/master/stable/alpine/Dockerfile)
- [alpine - nginx](https://wiki.alpinelinux.org/wiki/Nginx) - Not used
