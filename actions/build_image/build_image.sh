#!/usr/bin/env bash

set -e
set -x

REPO_NAME=${REPO_NAME?:"REPO_NAME was not defined"}

docker build -t $REPO_NAME:latest .
