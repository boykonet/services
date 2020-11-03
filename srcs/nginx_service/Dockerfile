FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx

RUN mkdir /etc/nginx/ssl/
COPY ./srcs_nginx/nginx.crt /etc/nginx/ssl/
COPY ./srcs_nginx/nginx.key /etc/nginx/ssl/

COPY ./srcs_nginx/wp_phpmyadmin_nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs_nginx/server.sh /files/server.sh
RUN chmod +u /files/server.sh
RUN mkdir -p /run/nginx/

EXPOSE 80 443
CMD /bin/sh /files/server.sh
