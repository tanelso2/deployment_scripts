#!/bin/bash

set -e
set -x

export FULL_DOCKER_TAG="$ECR_REPO/$REPO_NAME:$VERSION"

echo "tag=${FULL_DOCKER_TAG}" >> $GITHUB_OUTPUT

docker tag $REPO_NAME:$VERSION $FULL_DOCKER_TAG
docker push $FULL_DOCKER_TAG

