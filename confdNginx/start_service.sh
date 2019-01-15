#!/bin/bash
/go/bin/confd -onetime -backend etcd -node http://etcd-server:2379 
cat /tmp/*.conf
nginx -g 'daemon off; include /tmp/*.conf;'
