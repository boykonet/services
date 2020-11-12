#!/bin/sh

/usr/bin/supervizord -c /etc/supervizord.conf

tail -f /dev/null
