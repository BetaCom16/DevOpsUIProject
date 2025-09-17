#!/bin/bash

# 1. Update system and install dependencies (Docker)
sudo apt-get update -y
sudo apt-get install -y docker.io docker-compose python3 python3-pip

# 2. Add the ubuntu user to the docker group
sudo usermod -aG docker ubuntu

# 3. Start Docker services
sudo systemctl start docker
sudo systemctl enable docker

# 4. Install AWS CLI using pip with --break-system-packages
sudo pip3 install awscli --break-system-packages

# 5. Use 'su' to run docker-compose commands as the ubuntu user
su - ubuntu -c "cd /home/ubuntu/my-app && \
aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin 443526375408.dkr.ecr.eu-north-1.amazonaws.com && \
docker-compose down && \
docker-compose up -d --pull always"