#!/bin/bash
cd /home/ubuntu/my-app
sudo docker login -u AWS -p $(aws ecr get-login-password --region eu-north-1) 443526375408.dkr.ecr.eu-north-1.amazonaws.com/devops-app
sudo docker-compose pull