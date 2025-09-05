# !/bin/bash

DOCKERFILE="Dockerfile.os"
docker build -f ./$DOCKERFILE --no-cache --force-rm -t localhost/os/rockylinux:latest ../
