FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add wget tar

RUN mkdir -p /var/www/
RUN wget -O wordpress.tar.gz -P /var/www/ https://wordpress.org/latest.tar.gz
RUN tar -C /var/www/ -xzvf /var/www/latest.tar.gz
RUN rm -rf /var/www/latest.tar.gz
COPY ./srcs/wp-config-sample.php /var/www/wordpress/wp-config.php
RUN chown -R www-data:www-data /var/www/wordpress/

EXPOSE 5000 3360
CMD /bin/sh
