#!/bin/sh

docker buildx bake --pull --load x64-amd x64-intel

# For multi-platform build, need buildx multi-platform builder:
# docker buildx create --use
# docker buildx build --platform=linux/amd64,linux/arm64 .