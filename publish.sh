#!/bin/bash
set -e

GIT_HASH=$(git rev-parse HEAD)
echo "using git hash $GIT_HASH"

docker login

docker buildx build -t beta64js .
docker tag beta64js gmanthemarioguy/beta64js:latest
docker push gmanthemarioguy/beta64js:latest
docker tag beta64js gmanthemarioguy/beta64js:$GIT_HASH
docker push gmanthemarioguy/beta64js:$GIT_HASH
