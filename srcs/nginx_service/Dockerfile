FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx openssh supervisor
RUN apk add --update util-linux

RUN mkdir -p /etc/nginx/ssl/ && mkdir -p /run/nginx/ && mkdir -p /var/run/sshd/
COPY ./srcs_nginx/nginx.crt /etc/nginx/ssl/
COPY ./srcs_nginx/nginx.key /etc/nginx/ssl/

COPY ./srcs_nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs_nginx/nginx.sh /files/
COPY ./srcs_nginx/supervisord.conf /etc/supervisord.conf
COPY ./srcs_nginx/sshd_config /etc/ssh/sshd_config
COPY ./srcs_nginx/create_user.sh /files/
RUN chmod +u /files/nginx.sh && chmod +u /etc/nginx/conf.d/default.conf && \
		chmod +u /etc/supervisord.conf && chmod +u /etc/ssh/sshd_config && \
			chmod +u /files/create_user.sh

EXPOSE 80 443 22
CMD /bin/sh /files/nginx.sh
