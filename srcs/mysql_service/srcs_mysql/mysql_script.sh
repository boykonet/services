#!/bin/sh

# openrc default
# mysql_upgrade
# mysql_install_db --skip-test-db —user=mysql —datadir=/var/lib/mysql
# mysql_install_db --skip-test-db —user=mysql —datadir=/var/lib/mysql
# mysql_upgrade --user=root

mysql_install_db --skip-test-db --user=mysql --datadir=/var/lib/mysql
# /etc/init.d/mariadb start
# mysqld --protocol=TCP --user=mysql --basedir=/usr --datadir=/var/lib/mysql --init-command=/files/mysql_secure_installation.sql
mysqld --user=mysql --datadir=/var/lib/mysql --init-file=/files/mysql_database.sql

# mysqladmin password "gkarina42-password"
# mysql --user="root" --password="gkarina42-password" mysql < /files/mysql_secure_installation.sql
# mysql --user="root" --password="gkarina42-password" mysql < /files/mysql_database.sql
# /etc/init.d/mariadb stop
# /usr/bin/mysqld_safe --datadir='/var/lib/mysql'
