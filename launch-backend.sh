#!/usr/bin/env sh

# start a mongodb container
docker run --name oil-recycling-db -d mongo:latest

# start backend container pointing to mongo container
MONGO_HOST=$(docker inspect -f '{{.NetworkSettings.IPAddress}}' oil-recycling-db)
echo $MONGO_HOST
docker run -e MONGO_HOST=$MONGO_HOST --name oil-recycling-node -p 8080:8080 -d kenzieacademy/oil-recycling-node
