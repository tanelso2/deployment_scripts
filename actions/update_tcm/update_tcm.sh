#!/usr/bin/env bash

set -x
set -e

if [ ! -z "$IMAGE_TAG" ]; then
    export FULL_DOCKER_TAG="$IMAGE_TAG"
else
    export IMAGE_TAG=gh-$(git rev-parse --short HEAD)
    export FULL_DOCKER_TAG="$GCR_REPO/$REPO_NAME:$IMAGE_TAG"
fi

curl -X PATCH \
    -H "Authorization: Basic ${TCM_KEY}" \
    -d "$FULL_DOCKER_TAG" \
    --fail \
    https://${TCM_ADDR}/container/${REPO_NAME}/image
