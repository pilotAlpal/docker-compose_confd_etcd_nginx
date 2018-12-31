# docker-compose_confd_etcd_nginx

Implementation of [confd - Quick Start Guide](https://github.com/kelseyhightower/confd/blob/master/docs/quick-start-guide.md#quick-start-guide) simple example using docker-compose.

docker-compose runs two containers:

- etcd-server: [etcd](https://github.com/etcd-io/etcd) key value store
- etcd-client: File, _/tmp/myconfig.conf_, managed by confd using as etcd-server backend that also insert example's keys to the server via etcdctl and outputs updated file


