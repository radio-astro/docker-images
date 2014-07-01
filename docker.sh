#!/bin/bash -e
#
# Example file on how to run Docker.
#
# Note that this is not written in stone or best practice. Feel
# free to do use it however you want or write your own scripts.
#

CONTAINER_NAME="papino"
IMAGE_NAME="gijzelaerr/${CONTAINER_NAME}"

if [ "$#" -ne 2 ]; then
    echo "USAGE: $0 <datafolder> <notebookfolder>"
    DATA=`pwd`/data/
    NOTEBOOKS=`pwd`/notebooks
else
    DATA=`readlink -m $1`
    NOTEBOOKS=`readlink -m $2`
fi

echo "using ${DATA} for data, ${NOTEBOOKS} for notebooks"

echo "building docker image ${IMAGE_NAME}"
docker build -t ${IMAGE_NAME} .

echo "removing old container ${CONTAINER_NAME}"
docker stop ${CONTAINER_NAME} || true
docker rm ${CONTAINER_NAME} || true


echo "running image ${IMAGE_NAME} as container ${CONTAINER_NAME}"
docker run \
    -d \
    -t \
    -v ${NOTEBOOKS}:/notebooks:rw \
    -v ${DATA}:/data:ro \
    -p 8888:8888 \
    -p 2222:22 \
    --name ${CONTAINER_NAME} \
    ${IMAGE_NAME}

echo -n " * ssh server runs on:"
docker port ${CONTAINER_NAME} 22
echo 
echo -n " * ipython notebook runs on: "
docker port ${CONTAINER_NAME} 8888
echo 

