#!/bin/sh

echo -e "root42\nroot42" | passwd root

# start vsftpd
rc-service vsftpd start
rc-update add vsftpd

tail -f /dev/null
