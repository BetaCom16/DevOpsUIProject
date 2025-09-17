#!/bin/bash
aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 443526375408.dkr.ecr.eu-north-1.amazonaws.com
docker-compose pull