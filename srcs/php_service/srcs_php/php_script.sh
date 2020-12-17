#!/bin/sh

rc-update add php-fpm7 default
rc-update add nginx default

supervisord -c /etc/supervisord.conf
