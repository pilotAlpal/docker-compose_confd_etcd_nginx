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
COPY conf.d /etc/confd/conf.d
COPY templates /etc/confd/templates


FROM gcr.io/etcd-development/etcd:v3.3.10
ENV ETCDCTL_API 3
# Add keys https://github.com/kelseyhightower/confd/blob/master/docs/quick-start-guide.md#add-keys-1
CMD ["etcdctl","--endpoints","http://etcd-server:2379","put","/myapp/subdomain","myapp"]
CMD ["etcdctl","--endpoints","http://etcd-server:2379","put","/myapp/upstream/app2","10.0.1.100:80"]
CMD ["etcdctl","--endpoints","http://etcd-server:2379","put","/myapp/upstream/app1","10.0.1.101:80"]
CMD ["etcdctl","--endpoints","http://etcd-server:2379","put","/yourapp/subdomain","yourapp"]
CMD ["etcdctl","--endpoints","http://etcd-server:2379","put","/yourapp/upstream/app2","10.0.1.100:80"]
CMD ["etcdctl","--endpoints","http://etcd-server:2379","put","/yourapp/upstream/app1","10.0.1.101:80"]
COPY --from=confd /go/bin/confd /usr/local/bin/confd
CMD /usr/local/bin/confd -onetime -backend etcd -node http://etcd-server:2379
