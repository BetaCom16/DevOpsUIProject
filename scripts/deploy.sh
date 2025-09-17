#!/bin/bash

# 1. Update system and install dependencies (Docker, AWS CLI)
sudo apt-get update -y
sudo apt-get install -y docker.io docker-compose awscli
sudo systemctl start docker
sudo systemctl enable docker

# 2. Navigate to the app directory
cd /home/ubuntu/my-app

# 3. Login to ECR
sudo docker login -u AWS -p $(aws ecr get-login-password --region eu-north-1) 443526375408.dkr.ecr.eu-north-1.amazonaws.com/devops-app

# 4. Pull the latest image and start the application
sudo docker-compose pull
sudo docker-compose up -d