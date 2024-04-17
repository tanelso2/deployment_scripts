#!/usr/bin/env bash

set -e
set -x

REPO_NAME=${REPO_NAME?:"REPO_NAME was not defined"}
VERSION=gh-$(git rev-parse --short HEAD)

echo "version=$VERSION" >> $GITHUB_OUTPUT

docker build -t $REPO_NAME:latest .
docker tag $REPO_NAME:latest $REPO_NAME:$VERSION
