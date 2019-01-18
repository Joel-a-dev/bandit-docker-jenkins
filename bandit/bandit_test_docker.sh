#!/bin/bash 
cd ..
PWD=$(pwd)
DOCKERFILE='bandit/bandit.Dockerfile'

chmod +x bandit/run_bandit.sh

set -e
# TODO: decide if the image is to be built every run or pulled from docker repository or existent in local docker
#if [[ "$(docker images -q ${BANDIT_IMAGE}:${BANDIT_TAG} 2> /dev/null)" == "" ]]; then
#  echo "docker image does not exist, building..."
  docker build -t ${BANDIT_IMAGE}:${BANDIT_TAG} -f ${DOCKERFILE} .
#else
#  echo "docker image already exists, skipping build..."
#fi
docker run --name ${CONTAINER} -v ${PWD}/bandit/:/bandit/bandit ${BANDIT_IMAGE}:${BANDIT_TAG} 
