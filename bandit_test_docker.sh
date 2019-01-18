#!/bin/bash 

DOCKERFILE='bandit.Dockerfile'
PWD=$(pwd)
chmod +x ./shared/run_bandit.sh

set -e

docker build -t ${BANDIT_IMAGE}:${BANDIT_TAG} -f ${DOCKERFILE} .
docker run --name ${CONTAINER} -v ${PWD}/shared/:/bandit/app ${BANDIT_IMAGE}:${BANDIT_TAG} 
