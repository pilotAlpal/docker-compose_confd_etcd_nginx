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

FROM nginx:alpine
COPY --from=confd /go/bin/confd /usr/local/bin/confd
COPY conf.d /etc/confd/conf.d
COPY templates /etc/confd/templates


FROM gcr.io/etcd-development/etcd:v3.3.10
CMD ["etcdctl","--endpoints","http://etcd-server:2379","put","/message","Hello"]
