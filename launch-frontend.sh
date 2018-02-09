#!/usr/bin/env sh

# calling script to clean docker container
./clean-docker.sh

# Tag of the image we want to grab
TAG="$1"

BACKEND_API=http://18.219.106.221

docker run -e REACT_APP_OIL_RECYCLING_API=$BACKEND_API --name oil-recycling-fe -p 80:3000 -d kenzieacademy/oil-recycling-project-fe:$TAG
