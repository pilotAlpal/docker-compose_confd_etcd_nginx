#!/bin/bash
#curl -L http://etcd-server:2379/version
curl -L http://etcd-server:2379/v2/keys/myapp/database/url -XPUT -d value="db.example.com"
curl -L http://etcd-server:2379/v2/keys/myapp/database/user -XPUT -d value="rob"
