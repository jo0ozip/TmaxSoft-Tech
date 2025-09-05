# !/bin/bash

find ../jeus8 -type d -exec chmod 750 {} +
find ../jeus8 -type f -exec chmod 640 {} +
find ../jeus8/bin -type f -exec chmod u+x {} +

DOCKERFILE="Dockerfile.jeus"
docker build -f ./$DOCKERFILE --no-cache --force-rm -t localhost/was/jeus85:latest ../

