FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx openssl

RUN mkdir /etc/nginx/ssl/
COPY ./srcs/nginx.crt ./srcs/nginx.key /etc/nginx/ssl/

COPY ./srcs/wp_phpmyadmin_nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443
CMD /files/server.sh
