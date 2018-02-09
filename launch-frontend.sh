#!/usr/bin/env sh

# calling script to clean docker container
./clean-docker.sh

docker run --name oil-recycling-fe -p 80:3000 -d kenzieacademy/oil-recycling-project-fe
