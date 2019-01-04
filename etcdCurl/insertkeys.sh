#!/bin/bash
#curl -L http://etcd-server:2379/version
curl -L http://etcd-server:2379/v2/keys/myapp/subdomain -XPUT -d value="localhost"
curl -L http://etcd-server:2379/v2/keys/myapp/location -XPUT -d value="get-time"
curl -L http://etcd-server:2379/v2/keys/myapp/proxytarget -XPUT -d value="py-app:8081/dtime"
#curl -L http://etcd-server:2379/v2/keys/myapp/upstream/app2 -XPUT -d value="10.0.1.100:80"
#curl -L http://etcd-server:2379/v2/keys/myapp/upstream/app1 -XPUT -d value="10.0.1.101:80"
