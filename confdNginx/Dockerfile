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

FROM nginx:alpine as nginx
COPY --from=confd /go /go
COPY confd_sample1 /etc/confd
COPY nginx_init.conf /etc/nginx/nginx.conf
COPY www_website /var/www/website.html

ADD start_service.sh ./start/entrypoint.sh
ADD reload_nginx.sh ./run/reload_nginx.sh
RUN chmod +x ./start/entrypoint.sh
RUN chmod +x ./run/reload_nginx.sh
CMD /bin/sh ./start/entrypoint.sh
