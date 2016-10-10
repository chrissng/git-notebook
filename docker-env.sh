## TODO docker injects variables as is
##      ensure all variables below are hardcoded and avoid string expansion
##      (i.e. VAR="VAL" and VAR=$VAL will not expand; use VAR=VAL only)

## Tip: GIT_PARENT_DIR == VOL_HOST == VOL_CNTR == (absolute dir)
GIT_PARENT_DIR=FIXME_EXAMPLE_/data
GIT_REPO_NAME=FIXME_EXAMPLE_lab41
GIT_BRANCH_NAME=FIXME_EXAMPLE_ipynb
GIT_USER=FIXME_EXAMPLE_chrissng
GIT_USER_UPSTREAM=FIXME_EXAMPLE_chrissng
GIT_EMAIL=FIXME_EXAMPLE_chris@data.gov.sg
GITHUB_ACCESS_TOKEN=FIXME

PORT_HOST=8888
PORT_CNTR=8888
VOL_HOST=/data
VOL_CNTR=/data

THEANO_FLAGS=mode=FAST_RUN,device=gpu1,floatX=float32


############################################################################
#### DO NOT EDIT BELOW THIS LINE: derived variables
############################################################################
GIT_REMOTE_URL=git@github.com:$GIT_USER/$GIT_REPO_NAME.git
GIT_REMOTE_URL_HTTPS=https://github.com/$GIT_USER/$GIT_REPO_NAME.git
GIT_REMOTE_UPSTREAM=$GIT_USER_UPSTREAM/$GIT_REPO_NAME
