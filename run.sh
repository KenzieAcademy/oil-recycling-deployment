#!/usr/bin/env sh

# repository this script is in
REPO="oil-recycling-deployment"
# which server we're building (either "frontend" or "backend"
SERVER="$1"

# which tag to use when fetching the docker image
TAG="$2"
TAG=${TAG:=latest}

echo "Cleaning up from previous deployment..."
rm -rf master.zip $REPO-master

# Unzip repository archive, descend into it, and launch the appropriate script
echo "Downloading deploymnent scripts..."
wget -c "https://github.com/KenzieAcademy/$REPO/archive/master.zip"
unzip master.zip && cd "$REPO-master" && ./launch-$SERVER.sh $TAG
