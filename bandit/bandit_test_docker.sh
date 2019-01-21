#!/bin/bash 
cd ..
DOCKERFILE='bandit/bandit.Dockerfile'
PWD=$(pwd)
set -e
# TODO : decide if the image is to be built every run or pulled from docker repository or existent in local docker repository
docker build -t ${BANDIT_IMAGE}:${BANDIT_TAG} -f ${DOCKERFILE} .
docker run --name ${CONTAINER} -v ${PWD}/bandit/reports:/app_tmp/bandit/reports ${BANDIT_IMAGE}:${BANDIT_TAG}