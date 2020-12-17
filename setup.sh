#!/bin/bash
minikube delete

minikube start --cpus=2 --memory=4096mb --driver=hyperkit

minikube addons enable metrics-server && minikube addons enable dashboard && minikube addons enable metallb

eval $(minikube docker-env)

# secret for metallb
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"


# secrets
kubectl apply -f ./srcs/k8s/mysql-root-pass.yaml
kubectl apply -f ./srcs/k8s/influx-admin-pass.yaml


kubectl apply -f ./srcs/k8s/configmap.yaml


# persistent volumes
kubectl apply -f ./srcs/k8s/storage-class-name.yaml
kubectl apply -f ./srcs/k8s/persistent_volume_mysql.yaml
kubectl apply -f ./srcs/k8s/persistent_volume_influx.yaml


# nginx
docker build -t nginx-image -f ./srcs/nginx_service/Dockerfile_nginx ./srcs/nginx_service/
kubectl apply -f ./srcs/nginx_service/nginx.yaml


# mysql
docker build -t mysql-image -f ./srcs/mysql_service/Dockerfile_mysql ./srcs/mysql_service/
kubectl apply -f ./srcs/mysql_service/persistent_volume_claim_mysql.yaml
kubectl apply -f ./srcs/mysql_service/mysql.yaml


# phpmyadmin
docker build -t php-image -f ./srcs/php_service/Dockerfile_php ./srcs/php_service/
kubectl apply -f ./srcs/php_service/php.yaml


# wp
docker build -t wp-image -f ./srcs/wp_service/Dockerfile_wp ./srcs/wp_service/
kubectl apply -f ./srcs/wp_service/wp.yaml


# influx
docker build -t influx-image -f ./srcs/influx_service/Dockerfile_influx ./srcs/influx_service/
kubectl apply -f ./srcs/influx_service/persistent_volume_claim_influx.yaml
kubectl apply -f ./srcs/influx_service/influx.yaml


# grafana
docker build -t grafana-image -f ./srcs/grafana_service/Dockerfile_grafana ./srcs/grafana_service/
kubectl apply -f ./srcs/grafana_service/grafana.yaml


# ftps
docker build -t ftps-image -f ./srcs/ftps_service/Dockerfile_ftps ./srcs/ftps_service/
kubectl apply -f ./srcs/ftps_service/ftps.yaml
