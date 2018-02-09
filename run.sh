#!/usr/bin/env sh

REPO="oil-recycling-deployment"
SERVER="$1"
echo $SERVER
wget -c "https://github.com/KenzieAcademy/$REPO/archive/master.zip"
unzip master.zip && cd "$REPO-master" && ./launch-$SERVER.sh