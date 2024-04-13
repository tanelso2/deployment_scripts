#!/bin/bash

set -e
set -x

export IMAGE_TAG=gh-$(git rev-parse --short HEAD)

export FULL_DOCKER_TAG="$ECR_REPO/$REPO_NAME:$IMAGE_TAG"

echo "tag=${FULL_DOCKER_TAG}" >> $GITHUB_OUTPUT

docker build -t $REPO_NAME:latest .

docker tag $REPO_NAME:latest $FULL_DOCKER_TAG
docker push $FULL_DOCKER_TAG

