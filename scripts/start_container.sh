#!/bin/bash
docker stop mon-app 2>/dev/null || true
docker rm mon-app 2>/dev/null || true

aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin $ECR_URI
docker pull $ECR_URI:latest
docker run -d --name mon-app -p 80:80 --restart always $ECR_URI:latest

echo "Conteneur demarré !"