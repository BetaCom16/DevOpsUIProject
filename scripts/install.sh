#!/bin/bash

# 1. Update system and install dependencies (Docker, Python, Pip)
sudo apt-get update -y
sudo apt-get install -y docker.io docker-compose python3 python3-pip

# 2. Add the ubuntu user to the docker group
sudo usermod -aG docker ubuntu

# 3. Start Docker services
sudo systemctl start docker
sudo systemctl enable docker

# 4. Install AWS CLI using pip with --break-system-packages
sudo pip3 install awscli --break-system-packages

# 5. Wait for the group change to take effect
sleep 10