#Adapted from https://github.com/kelseyhightower/confd/blob/master/docs/installation.md
FROM golang:1.9-alpine as confd
ARG CONFD_VERSION=0.16.0
ADD https://github.com/kelseyhightower/confd/archive/v${CONFD_VERSION}.tar.gz /tmp/
RUN apk add --no-cache \
    bzip2 \
    make && \
  mkdir -p /go/src/github.com/kelseyhightower/confd && \
  cd /go/src/github.com/kelseyhightower/confd && \
  tar --strip-components=1 -zxf /tmp/v${CONFD_VERSION}.tar.gz && \
  go install github.com/kelseyhightower/confd && \
  rm -rf /tmp/v${CONFD_VERSION}.tar.gz


FROM gcr.io/etcd-development/etcd:v3.3.10
# Add keys https://github.com/kelseyhightower/confd/blob/master/docs/quick-start-guide.md#add-keys-1
COPY confd_sample1 /etc/confd
COPY --from=confd /go/bin/confd /usr/local/bin/confd
CMD etcdctl --endpoints http://etcd-server:2379 set /myapp/database/url db.example.com && etcdctl --endpoints http://etcd-server:2379 set /myapp/database/user rob && /usr/local/bin/confd -onetime -backend etcd -node http://etcd-server:2379 && cat /tmp/myconfig.conf
