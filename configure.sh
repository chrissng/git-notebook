#!/bin/bash

# import variables
source ".env"

function wait_for_yes() {
  local __msg="$1"
  while true; do
      read -p "$__msg" yn
      case $yn in
          [Yy]* ) break;;
          [Nn]* ) echo "Waiting....";;
          * ) echo "Please answer yes or no.";;
      esac
  done
}

# on GitHub: create repo
wait_for_yes "Has $GIT_USER_UPSTREAM created repo $GIT_REPO_NAME?"

# on GitHub: fork repo
wait_for_yes "Has $GIT_USER forked $GIT_REPO_NAME from $GIT_USER_UPSTREAM?"


# create ssh keys for repo
ssh-keygen -t rsa -f config/ssh/id_rsa -N ''
cat config/ssh/id_rsa.pub


# on GitHub: add SSH key
wait_for_yes "Has $GIT_USER uploaded the public key from above (from config/ssh/id_rsa.pub) to their GitHub account?"


# clone git repository
mkdir --parents $ABSOLUTE_BASE_DIR
pushd $ABSOLUTE_BASE_DIR
git clone $GIT_REMOTE_URL_HTTPS


# add output filter to repository
cd $ABSOLUTE_BASE_DIR/$GIT_REPO_NAME
echo "*.ipynb filter=ipynb_stripout" >> .gitattributes
