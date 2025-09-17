#!/bin/bash
sudo apt-get update
sudo apt-get install -y docker.io docker-compose awscli
sudo systemctl start docker
sudo systemctl enable docker