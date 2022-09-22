#!/usr/bin/env bash

set -x
set -e

export IMAGE_TAG=gh-$(git rev-parse --short HEAD)
export FULL_DOCKER_TAG="$GCR_REPO/$REPO_NAME:$IMAGE_TAG"

curl -X PATCH \
    -H "Authorization: Basic ${TCM_KEY}" \
    -d "$FULL_DOCKER_TAG" \
    ${TCM_ADDR}/container/${REPO_NAME}
