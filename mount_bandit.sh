#!/bin/bash 

export BANDIT_IMAGE='bandit'
export BANDIT_TAG='python3-alpine'
export CONTAINER='bandit'
DOCKERFILE='bandit.Dockerfile'
PWD=$(pwd)
chmod +x ./shared/run_bandit.sh

set -e

docker build -t ${BANDIT_IMAGE}:${BANDIT_TAG} -f ${DOCKERFILE} .
docker run --name ${CONTAINER} -v ${PWD}/shared/:/bandit/app ${BANDIT_IMAGE}:${BANDIT_TAG} 
docker rm ${CONTAINER}
docker rmi ${BANDIT_IMAGE}:${BANDIT_TAG} 