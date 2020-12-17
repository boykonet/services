#!/bin/sh

ssh-keygen -A

supervisord -c /etc/supervisord.conf
