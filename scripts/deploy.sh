#!/bin/bash

# 1. Navigate to the app directory
cd /home/ubuntu/my-app

# 2. Login to ECR
aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin 443526375408.dkr.ecr.eu-north-1.amazonaws.com

# 3. Stop and remove the old container
docker-compose down

# 4. Pull the latest image and start the application in detached mode
docker-compose up -d --pull always