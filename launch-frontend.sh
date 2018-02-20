#!/usr/bin/env sh

# force remove all containers
echo "removing ALL containers..."
docker rm --force $(docker ps -aq)


# force remove all images
echo "removing ALL images..."
docker rmi --force $(docker images -q)


# Tag of the image we want to grab
TAG="$1"

BACKEND_API=http://18.219.106.221

docker run -e REACT_APP_OIL_RECYCLING_API=$BACKEND_API --name oil-recycling-fe -p 80:3000 -d kenzieacademy/oil-recycling-project-fe:$TAG
