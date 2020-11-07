FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add wget tar

RUN mkdir -p /var/www/
RUN wget -O wordpress.tar.gz https://wordpress.org/latest.tar.gz
RUN tar -C /var/www/ -xzvf /wordpress.tar.gz
RUN rm -rf /wordpress.tar.gz
COPY ./srcs_wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
COPY ./srcs_wordpress/import-users-from-csv-with-meta.zip /
RUN unzip /import-users-from-csv-with-meta.zip -d /var/www/phpmyadmin/

EXPOSE 5000 3360
CMD /bin/sh tail -f /dev/null
