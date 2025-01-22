#!/bin/sh

# Useful build commands
docker buildx bake --load --set *.platform=linux/amd64 x64-amd
#docker buildx bake --pull --load --set *.platform=linux/amd64 x64-intel
#docker buildx bake --pull --load --set *.platform=linux/amd64 x64-amd x64-intel
#docker buildx bake --pull --load amd64-acfl

# For multi-platform build, need buildx multi-platform builder:
# docker buildx create --use
# docker buildx build --platform=linux/amd64,linux/arm64 .