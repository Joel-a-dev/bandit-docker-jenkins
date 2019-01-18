#!/bin/bash 
cd ..

DOCKERFILE='shared/bandit.Dockerfile'
PWD=$(pwd)
chmod +x run_bandit.sh

set -e
# TODO: decide if the image is to be built every run or pulled from docker repository or existent in local docker
docker build -t ${BANDIT_IMAGE}:${BANDIT_TAG} -f ${DOCKERFILE} .
docker run --name ${CONTAINER} -v ${PWD}/shared/:/bandit/shared ${BANDIT_IMAGE}:${BANDIT_TAG} 
