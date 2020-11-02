#!/bin/bash

docker build -t nginx_image - < ./nginx/Dockerfile

kubectl apply -f ./nginx/nginx.yaml
