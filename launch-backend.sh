#!/usr/bin/env sh

# Repo and tag of the image we want to grab
REPO="kenzieacademy"
TAG="$1"


# force stop front-end React container
echo "killing React container..."
docker rm --force oil-recycling-node oil-recycling-db

# update React image to latest
echo "updating images..."
docker pull "$REPO/oil-recycling-node:$TAG"


# start a mongodb container
docker run --name oil-recycling-db -d mongo:latest


# start backend container pointing to mongo container
MONGO_HOST=$(docker inspect -f '{{.NetworkSettings.IPAddress}}' oil-recycling-db)
docker run -e MONGO_HOST=$MONGO_HOST -v /usr/src/app/data/db:/data/db --name oil-recycling-node -p 80:8080 -d kenzieacademy/oil-recycling-node:$TAG
