#!/bin/bash

# Define the container name and image
CONTAINER_NAME="my-flask-app"
IMAGE_NAME="awsdevopsguy/sample-flask-app:v2"

# Pull the latest Docker image
docker pull $IMAGE_NAME

# Stop and remove any existing container with the same name
if docker ps -q --filter "name=$CONTAINER_NAME" > /dev/null; then
    echo "Stopping and removing existing container..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Run a new container with the latest image
echo "Starting new container with the latest image..."
docker run -d --name $CONTAINER_NAME --restart unless-stopped -p 5000:5000 $IMAGE_NAME

