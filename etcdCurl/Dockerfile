#Adapted from https://github.com/kelseyhightower/confd/blob/master/docs/installation.md
FROM appropriate/curl:latest
ADD insertkeys.sh ./insert/entrypoint.sh
RUN chmod +x ./insert/entrypoint.sh
CMD /bin/sh ./insert/entrypoint.sh
