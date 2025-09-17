#!/bin/bash

# 1. Update system and install dependencies (Docker)
sudo apt-get update -y
sudo apt-get install -y docker.io docker-compose python3 python3-pip

# 2. Add the ubuntu user to the docker group
sudo usermod -aG docker ubuntu

# 3. Start Docker services
sudo systemctl start docker
sudo systemctl enable docker

# 4. Navigate to the app directory
cd /home/ubuntu/my-app

# 5. Login to ECR
sudo pip3 install awscli --break-system-packages
sudo docker login -u AWS -p $(aws ecr get-login-password --eu-north-1) 443526375408.dkr.ecr.eu-north-1.amazonaws.com/devops-app

# 6. Stop and remove the old container
docker-compose down

# 7. Pull the latest image and start the application in detached mode
docker-compose up -d --pull always