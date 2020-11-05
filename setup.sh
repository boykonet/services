#!/bin/bash

#minikube start --vm-driver=virtualbox
minikube addons enable metallb
eval $(minikube docker-env)

docker build -t nginx-image -f ./srcs/nginx_service/Dockerfile ./srcs/nginx_service/
#docker build -t phpmyadmin_image -f ./srcs/nginx_service/Dockerfile ./srcs/phpmyadmin_service/
#docker build -t wordpress_image -f ./srcs/nginx_service/Dockerfile ./srcs/wordpress_service/
#docker build -t grafana_image -f ./srcs/nginx_service/Dockerfile ./srcs/grafana_service/
#docker build -t influxdb_image -f ./srcs/nginx_service/Dockerfile ./srcs/influxdb_service/
#docker build -t ftps_image -f ./srcs/nginx_service/Dockerfile ./srcs/ftps_service/
#docker build -t mysql_image -f ./srcs/nginx_service/Dockerfile ./srcs/mysql_service/
#docker build -t telegraf_image -f ./srcs/nginx_service/Dockerfile ./srcs/telegraf_service/

kubectl apply -f ./srcs/nginx_service/nginx.yaml
kubectl apply -f ./configmap.yaml
