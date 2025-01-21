#!/bin/bash

source ../.env
IMG_NAME=$IMG_BASE_NAME-ol8

# Select container engine. Priority to podman.
if command -v podman 2>&1 >/dev/null;
then
	CONTAINER_ENGINE=podman
elif command -v docker 2>&1 >/dev/null;
then
	CONTAINER_ENGINE=docker
else
    echo "No container engine found"
    exit 1
fi

$CONTAINER_ENGINE build --pull -t $IMG_NAME --pull .

# Tag version
$CONTAINER_ENGINE tag $IMG_NAME $IMG_NAME:$VERSION

# Tag image with latest git tag
export IMG_TAG=$(echo "$(git describe --tags)" | awk '{print tolower($0)}')
$CONTAINER_ENGINE tag $IMG_NAME $IMG_NAME:$IMG_TAG
