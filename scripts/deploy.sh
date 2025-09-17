#!/bin/bash

# 1. Update system and install dependencies (Docker)
sudo apt-get update -y
sudo apt-get install -y docker.io docker-compose python3 python3-pip

# 2. Install AWS CLI using pip
sudo pip3 install awscli

# 3. Start Docker services
sudo systemctl start docker
sudo systemctl enable docker

# 4. Navigate to the app directory
cd /home/ubuntu/my-app

# 5. Login to ECR
sudo docker login -u AWS -p $(aws ecr get-login-password --region <DEINE_REGION>) <DEINE_ECR_REPOSITORY_URL>

# 6. Pull the latest image and start the application
sudo docker-compose pull
sudo docker-compose up -d