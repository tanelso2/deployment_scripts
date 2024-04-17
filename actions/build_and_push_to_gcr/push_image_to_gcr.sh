#!/bin/bash

set -e
set -x

export GOOGLE_APPLICATION_CREDENTIALS="./service-account.json"

if [ -z "$VERSION" ]; then
    export IMAGE_TAG=gh-$(git rev-parse --short HEAD)
else
    export IMAGE_TAG="${VERSION}"
fi

gcloud auth activate-service-account --key-file="./service-account.json"
gcloud auth configure-docker --quiet

export FULL_DOCKER_TAG="$GCR_REPO/$REPO_NAME:$IMAGE_TAG"

echo "tag=${FULL_DOCKER_TAG}" >> $GITHUB_OUTPUT

docker build -t $REPO_NAME:latest .

docker tag $REPO_NAME:latest $FULL_DOCKER_TAG
docker push $FULL_DOCKER_TAG

