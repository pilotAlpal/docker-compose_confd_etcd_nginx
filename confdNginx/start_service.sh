#!/bin/bash
#rc-service nginx start
#nginx 
nginx -g 'daemon off;' &
/go/bin/confd -onetime -backend etcd -node http://etcd-server:2379 
cat /tmp/myapp.conf
#nginx -s quit
#nginx -g 'daemon off;'

