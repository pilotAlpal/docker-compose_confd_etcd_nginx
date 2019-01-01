# confd - docker-compose - etcd

Implementation of [confd - Quick Start Guide](https://github.com/kelseyhightower/confd/blob/master/docs/quick-start-guide.md#quick-start-guide) simple example using etcd as backend and docker-compose for deploying three services as docker containers:

- confd: Manages file _/tmp/myconfig.conf_ acording to etcd-server data, also outputs managed file
- etcd-server: [etcd](https://github.com/etcd-io/etcd) key value store
- etcd-curl: Inserts example's keys to etcd-server via curl


