#!/bin/sh

# Useful build commands
docker buildx bake --load --set *.platform=linux/amd64 x64-amd
#docker buildx bake --pull --load --set *.platform=linux/amd64 x64-intel
#docker buildx bake --pull --load --set *.platform=linux/amd64 x64-amd x64-intel
#docker buildx bake --pull --load amd64-acfl

# To run multi-arch containers and builders:
#sudo apt-get install qemu binfmt-support qemu-user-static # Install qemu packages
#docker run --rm --privileged multiarch/qemu-user-static --reset -p yes # Execute registering scripts
#docker run --platform=linux/arm64 --rm -t mgabay/compiler-stack:arm-2024.2 uname -m

# For multi-platform build, need buildx multi-platform builder:
#docker buildx create --use
#docker buildx build --platform=linux/amd64,linux/arm64 .
