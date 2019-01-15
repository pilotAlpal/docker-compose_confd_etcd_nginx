#!/bin/bash
curl -L http://etcd-server:2379/v2/keys/tapp/ti/location -XPUT -d value="get-time"
curl -L http://etcd-server:2379/v2/keys/tapp/ti/proxytarget -XPUT -d value="py-app:8081/dtime"
curl -L http://etcd-server:2379/v2/keys/tapp/gr/location -XPUT -d value="be-greeted"
curl -L http://etcd-server:2379/v2/keys/tapp/gr/proxytarget -XPUT -d value="py-app:8081/greet"
curl -L http://etcd-server:2379/v2/keys/tapp/st/location -XPUT -d value="www"
curl -L http://etcd-server:2379/v2/keys/tapp/st/root -XPUT -d value="/var"
curl -L http://etcd-server:2379/v2/keys/tapp/st/index -XPUT -d value="website.html"
