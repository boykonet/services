#!/bin/sh

/usr/bin/supervisord -c /etc/supervisord.conf

tail -f /dev/null
