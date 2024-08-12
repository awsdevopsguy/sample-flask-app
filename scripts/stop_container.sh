#!/bin/bash

# Define the container name
CONTAINER_NAME="my-flask-app"

# Get the container ID of the running container with the specified name
container_id=$(docker ps -q --filter "name=$CONTAINER_NAME")

# Check if a container ID was found
if [ -n "$container_id" ]; then
    echo "Stopping and removing container..."
    docker stop "$container_id"
    docker rm "$container_id"
else
    echo "No running container with name $CONTAINER_NAME found."
fi
