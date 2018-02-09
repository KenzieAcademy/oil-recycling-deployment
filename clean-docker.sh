#!/usr/bin/env sh

# force remove all containers
echo "removing ALL containers..."
docker rm --force $(docker ps -aq)


# force remove all images
echo "removing ALL images..."
docker rmi --force $(docker images -q)

