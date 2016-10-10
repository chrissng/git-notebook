#!/bin/bash

source "docker-env.sh"

# image name
__image=datagovsg/git-notebook

# run image
docker run -d \
           --volume=$ABSOLUTE_BASE_DIR:$ABSOLUTE_BASE_DIR \
           --workdir=$ABSOLUTE_BASE_DIR \
           --publish=$PORT_HOST:$PORT_CNTR \
           --env-file=docker-env.sh \
            $__image
