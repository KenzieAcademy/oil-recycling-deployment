#!/usr/bin/env sh

# force remove all containers
echo "removing ALL containers..."
docker rm --force $(docker ps -aq)


# force remove all images
echo "removing ALL images..."
docker rmi --force $(docker images -q)


# calling script to clean docker container
./clean-docker.sh

# start a mongodb container
docker run --name oil-recycling-db -d mongo:latest

# Tag of the image we want to grab
TAG="$1"

# start backend container pointing to mongo container
MONGO_HOST=$(docker inspect -f '{{.NetworkSettings.IPAddress}}' oil-recycling-db)
docker run -e MONGO_HOST=$MONGO_HOST --name oil-recycling-node -p 80:8080 -d kenzieacademy/oil-recycling-node:$TAG
