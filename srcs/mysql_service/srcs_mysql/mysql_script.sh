#!/bin/sh
rc default
/etc/init.d/mariadb setup
rc-service mariadb start
rc-update add mariadb default
mysqladmin password "gkarina42"
mariadb --user="root" --password="gkarina42" < /files/mysql_secure_installation.sql
mariadb --user="root" --password="gkarina42" < /files/mysql_database.sql
rc-service mariadb stop
/usr/bin/supervisord -c /etc/supervisord.conf
tail -f /dev/null
