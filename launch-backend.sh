#!/usr/bin/env sh

# Repo and tag of the image we want to grab
REPO="kenzieacademy"
TAG="$1"


# force stop back-end container
echo "killing back-end container..."
docker rm --force oil-recycling-node oil-recycling-db

# update back-end image to latest
echo "updating images..."
docker pull "$REPO/oil-recycling-node:$TAG"


# start a mongodb container
docker run --name oil-recycling-db -v /usr/src/app/data/db:/data/db -d mongo:latest


# start backend container pointing to mongo container
MONGO_HOST=$(docker inspect -f '{{.NetworkSettings.IPAddress}}' oil-recycling-db)

SUPER_USER_EMAIL=admin@kenzie.academy
SUPER_USER_PASSWORD=password
docker run -e MONGO_HOST=$MONGO_HOST -e SUPER_USER_EMAIL=$SUPER_USER_EMAIL -e SUPER_USER_PASSWORD=$SUPER_USER_PASSWORD --name oil-recycling-node -p 80:8080 -d kenzieacademy/oil-recycling-node:$TAG npm run prod

echo "Removing old artifacts"
docker system prune -af
