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

COPY confd_sample1 /etc/confd
CMD /go/bin/confd -onetime -backend etcd -node http://etcd-server:2379 && cat /tmp/myconfig.conf

