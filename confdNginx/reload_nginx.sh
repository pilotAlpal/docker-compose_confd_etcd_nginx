#!/bin/bash
if [ -s /var/run/nginx.pid ]; then
   nginx -s reload
fi
