#!/bin/bash 
cd ..
DOCKERFILE='bandit/bandit.Dockerfile'
PWD=$(pwd)
set -e
mkdir reports
# TODO : decide if the image is to be built every run or pulled from docker repository or existent in local docker repository
docker build -t ${BANDIT_IMAGE}:${BANDIT_TAG} -f ${DOCKERFILE} .
docker run -i --name ${CONTAINER} -v ${PWD}:/app_src ${BANDIT_IMAGE}:${BANDIT_TAG} bash