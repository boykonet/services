#!/bin/sh

# influxd -config /etc/influx.conf > /dev/null 2>&1 &

# sleep 4

# # start-stop-daemon --wait 3000 --background --start --exec /usr/bin/influxd --make-pidfile --pidfile /var/run/influxd.pid

# influx -username admin -password admin -execute "CREATE USER \"admin\" WITH PASSWORD 'admin' WITH ALL PRIVILEGES"
# influx -username admin -password admin -execute "CREATE USER \"telegraf\" WITH PASSWORD 'telegraf'"
# influx -username admin -password admin -execute "CREATE DATABASE telegraf"
# influx -username admin -password admin -execute "GRANT ALL ON \"telegraf\" TO \"telegraf\""

# # start-stop-daemon --stop --exec /usr/bin/influxd --pidfile /var/run/influxd.pid

# pkill influxd

supervisord -c /etc/supervisord.conf
