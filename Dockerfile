ARG ALPINE_VERSION=3.17
FROM alpine:${ALPINE_VERSION}

ARG MARIADB_VERSION=10.6.12-r0

RUN apk add --no-cache mysql-client=${MARIADB_VERSION}

ARG MYSQL_USER=mysql
ARG MYSQL_GROUP=mysql
ARG MYSQL_UID=1000
ARG MYSQL_GID=1000

RUN addgroup -g ${MYSQL_GID} ${MYSQL_GROUP} && \
    adduser -u ${MYSQL_UID} --disabled-password ${MYSQL_USER} -G ${MYSQL_GROUP} && \
    mkdir -p /home/${MYSQL_USER} && \
    chown -R ${MYSQL_USER}:${MYSQL_GROUP} /home/${MYSQL_USER}

USER ${MYSQL_USER}
WORKDIR /home/${MYSQL_USER}

CMD ["mysql", "--version"]
