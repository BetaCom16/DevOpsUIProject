#!/bin/bash

# 1. Update system and install dependencies (Docker, AWS CLI)
sudo apt-get update -y
sudo apt-get install -y docker.io docker-compose awscli python3 python3-pip

# 2. Start Docker services
sudo systemctl start docker
sudo systemctl enable docker

# 3. Navigate to the app directory
cd /home/ubuntu/my-app

# 4. Login to ECR
sudo aws ecr get-login-password --region eu-north-1 | sudo docker login --username AWS --password-stdin 443526375408.dkr.ecr.eu-north-1.amazonaws.com

# 5. Stop and remove the old container
sudo docker-compose down

# 6. Pull the latest image and start the application in detached mode
sudo docker-compose up -d --pull always