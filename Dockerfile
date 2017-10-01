# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: glibc
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM node:8-alpine

MAINTAINER Michael Parker, <docker@parkervcp.com>

RUN         apk update \
            && apk upgrade \
            && apk add --no-cache curl ca-certificates openssl \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]
