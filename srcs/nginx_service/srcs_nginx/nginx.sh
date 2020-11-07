#!/bin/sh

ssh-keygen -A

/usr/bin/supervisord -c /etc/supervisord.conf

echo "gkarina42\ngkarina42" | adduser gkarina

tail -f /dev/null
