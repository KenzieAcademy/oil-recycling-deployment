#!/usr/bin/env sh

# Repo and tag of the image we want to grab
REPO="kenzieacademy"
TAG="$1"


# force stop front-end React container
echo "killing React container..."
docker rm --force oil-recycling-fe

# update React image to latest
echo "updating images..."
docker pull "$REPO/oil-recycling-project-fe:$TAG"


BACKEND_API=http://18.219.106.221

docker run -e NODE_ENV=production -e REACT_APP_OIL_RECYCLING_API=$BACKEND_API --name oil-recycling-fe -p 80:3000 -d kenzieacademy/oil-recycling-project-fe:$TAG /bin/bash -c "npm run build && npm install -g serve && serve -s build -p 3000"