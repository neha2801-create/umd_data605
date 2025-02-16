#!/bin/bash -xe

GIT_ROOT=$(git rev-parse --show-toplevel)

REPO_NAME=gpsaggese
IMAGE_NAME=umd_data605_dask
FULL_IMAGE_NAME=$REPO_NAME/$IMAGE_NAME

docker image ls $FULL_IMAGE_NAME

CONTAINER_NAME=$IMAGE_NAME
docker run --rm -ti \
    --name $CONTAINER_NAME \
    -p 8888:8888 \
    -p 8787:8787 \
    -v $GIT_ROOT:/data \
    $FULL_IMAGE_NAME \
    /data/tutorials/tutorial_dask/run_jupyter.sh
