#!/bin/sh

ssh-keygen -A

/usr/bin/supervisord -c /etc/supervisord.conf

/bin/sh -c "/files/create_user.sh"

tail -f /dev/null
