#!/bin/bash

# script to generate the test_files/___init___.py file

# fetch tags from repo
git fetch --tags

# set variables 
GIT_COMMIT=$(git rev-parse HEAD)
GHE_VERSION=$(git describe --tags --abbrev=0)
BUILD_TIMESTAMP=$(date +'%Y-%m-%dT%H:%M:%SZ')

# Create ___init___.py file 
echo "
import os

__version__ = '$GHE_VERSION'

commit_hash = '$GIT_COMMIT'

build_timestamp = '$BUILD_TIMESTAMP'
" > test_files/___init___.py

if [ "$1" == 'fail' ]; then
  # Create test.py file 
  echo "
  import os

  __version__ = '$GHE_VERSION'

  commit_hash = '$GIT_COMMIT'

  build_timestamp = '$BUILD_TIMESTAMP'
  " > test_files/test.py
fi





