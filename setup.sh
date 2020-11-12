#!/bin/bash

minikube delete

minikube start --vm-driver=virtualbox

minikube addons enable metallb

eval $(minikube docker-env)

kubectl apply -f ./configmap.yaml


# nginx
docker build -t nginx-image -f ./srcs/nginx_service/Dockerfile ./srcs/nginx_service/
kubectl apply -f ./srcs/nginx_service/nginx.yaml

# phpmyadmin
docker build -t php_image -f ./srcs/phpmyadmin_service/Dockerfile_php ./srcs/phpmyadmin_service/
kubectl apply -f ./srcs/phpmyadmin_service/php.yaml

# wp
docker build -t wp_image -f ./srcs/wordpress_service/Dockerfile_wp ./srcs/wordpress_service/
kubectl apply -f ./srcs/wordpress_service/wp.yaml

# grafana
docker build -t grafana_image -f ./srcs/grafana_service/Dockerfile_grafana ./srcs/grafana_service/
kubectl apply -f ./srcs/grafana_service/grafana.yaml

# influx
docker build -t influx_image -f ./srcs/influxdb_service/Dockerfile_influxdb ./srcs/influxdb_service/
kubectl apply -f ./srcs/influxdb_service/influxdb.yaml

# ftps
docker build -t ftps_image -f ./srcs/ftps_service/Dockerfile_ftps ./srcs/ftps_service/
kubectl apply -f ./srcs/ftps_service/ftps.yaml

# mysql
docker build -t mysql_image -f ./srcs/mysql_service/mysql.yaml ./srcs/mysql_service/
kubectl apply -f ./srcs/mysql_service/mysql.yaml

# telegraf
docker build -t telegraf_image -f ./srcs/telegraf_service/Dockerfile_telegraf ./srcs/telegraf_service/
kubectl apply -f ./srcs/telegraf_service/telegraf.conf

