#!/usr/bin/env sh

# calling script to clean docker container
./clean-docker.sh

# start a mongodb container
docker run --name oil-recycling-db -d mongo:latest

# Tag of the image we want to grab
TAG="$1"

# start backend container pointing to mongo container
MONGO_HOST=$(docker inspect -f '{{.NetworkSettings.IPAddress}}' oil-recycling-db)
docker run -e MONGO_HOST=$MONGO_HOST --name oil-recycling-node -p 80:8080 -d kenzieacademy/oil-recycling-node:$TAG
