#!/bin/bash

source "docker-env.sh"

# image name
__image=lab41/keras-cuda-jupyter

# run image
docker run -d \
           --volume=$VOL_HOST:$VOL_CNTR \
           --workdir=$VOL_CNTR \
           --publish=$PORT_HOST:$PORT_CNTR \
           --env-file=docker-env.sh \
            $__image
