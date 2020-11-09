FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add mariadb-server mariadb-client

EXPOSE 3306

CMD /bin/sh
