#!/bin/bash
#rc-service nginx start
nginx
/go/bin/confd -onetime -backend etcd -node http://etcd-server:2379 
cat /tmp/myapp.conf
#nginx -g 'daemon off;'
