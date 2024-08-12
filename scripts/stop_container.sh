#!/bin/bash

# Get the container ID of the running container
container_id=$(docker ps -q)
#
# Check if a container ID was found
if [ -n "$container_id" ]; then
# Stop the Docker container
   docker stop "$container_id"
   docker rm "$container_id"
else
   echo "No running containers found."
fi

