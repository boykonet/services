#!/bin/bash

minikube delete

# ip address: 192.168.99.0 - 192.168.99.254
minikube start --cpus=2 memory=3096mb --driver=hyperkit

minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable metallb

eval $(minikube docker-env)

# secret for metallb
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# secret for influxdb
kubectl create secret generic influxdb-secret --from-literal=INFLUXDB_DATABASE=local_monitoring --from-literal=INFLUXDB_USERNAME=gkarina --from-literal=INFLUXDB_PASSWORD=gkarina42 --from-literal=INFLUXDB_HOST=influxdb

# secret for grafana
kubectl create secret generic grafana-secret --from-literal=GF_SECURITY_ADMIN_USER=gkarina --from-literal=GF_SECURITY_ADMIN_PASSWORD=gkarina42


kubectl apply -f ./srcs/k8s/configmap.yaml

# nginx
docker build -t nginx-image -f ./srcs/nginx_service/Dockerfile_nginx ./srcs/nginx_service/
kubectl apply -f ./srcs/nginx_service/nginx.yaml

# # mysql
# docker build -t mysql-image -f ./srcs/mysql_service/mysql.yaml ./srcs/mysql_service/
# kubectl apply -f ./srcs/mysql_service/mysql.yaml
# kubectl apply -f ./srcs/mysql_service/persistent_volume_mysql.yaml
# kubectl apply -f ./srcs/mysql_service/persistent_volume_claim_mysql.yaml

# phpmyadmin
docker build -t php-image -f ./srcs/php_service/Dockerfile_php ./srcs/php_service/
kubectl apply -f ./srcs/php_service/php.yaml


# wp
docker build -t wp-image -f ./srcs/wp_service/Dockerfile_wp ./srcs/wp_service/
kubectl apply -f ./srcs/wp_service/wp.yaml


# influx
docker build -t influx-image -f ./srcs/influx_service/Dockerfile_influx ./srcs/influx_service/
kubectl apply -f ./srcs/influx_service/persistent_volume_influx.yaml
kubectl apply -f ./srcs/influx_service/persistent_volume_claim_influx.yaml
kubectl apply -f ./srcs/influx_service/influx.yaml

# # telegraf
# docker build -t telegraf-image -f ./srcs/telegraf_service/Dockerfile_telegraf ./srcs/telegraf_service/
# kubectl apply -f ./srcs/telegraf_service/telegraf.yaml

# grafana
# docker build -t grafana-image -f ./srcs/grafana_service/Dockerfile_grafana ./srcs/grafana_service/
# kubectl apply -f ./srcs/grafana_service/grafana.yaml


# # ftps
# docker build -t ftps-image -f ./srcs/ftps_service/Dockerfile_ftps ./srcs/ftps_service/
# kubectl apply -f ./srcs/ftps_service/ftps.yaml
