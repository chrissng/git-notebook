#!/bin/bash

# exit on errors
set -e

# ensure permissions on rsa key
chmod 0400 /root/.ssh/id_rsa

# configure git profile
git config --global user.name  $GIT_USER && \
git config --global user.email $GIT_EMAIL

# fetch the latest changes from repo
pushd $ABSOLUTE_BASE_DIR/$GIT_REPO_NAME
git fetch
popd

# start notebook with extension activated
jupyter notebook --ip=*  --NotebookApp.server_extensions="['github_commit_push']"
