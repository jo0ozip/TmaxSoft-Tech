# !/bin/bash

find ../webtob5 -type d -exec chmod 750 {} +
find ../webtob5 -type f -exec chmod 640 {} +
find ../webtob5/bin -type f -exec chmod u+x {} +

DOCKERFILE="Dockerfile.webtob"
docker build -f ./$DOCKERFILE --no-cache --force-rm -t localhost/web/webtob5:latest ../
