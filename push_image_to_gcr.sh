#!/bin/bash

set -e
set -x

export GOOGLE_APPLICATION_CREDENTIALS="./service-account.json"

export IMAGE_TAG=gh-$(git rev-parse --short HEAD)

gcloud auth activate-service-account --key-file="./service-account.json"
gcloud auth configure-docker --quiet

export FULL_DOCKER_TAG="$GCR_REPO/$REPO_NAME:$IMAGE_TAG"

docker build -t $REPO_NAME:latest .

docker tag $REPO_NAME:latest $FULL_DOCKER_TAG
docker push $FULL_DOCKER_TAG

