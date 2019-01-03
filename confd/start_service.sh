#!/bin/sh
/go/bin/confd -onetime -backend etcd -node http://etcd-server:2379 
cat /tmp/myconfig.conf

