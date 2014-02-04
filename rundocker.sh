#!/bin/sh

DATA=`pwd`/data/

sudo docker run \
    -v `pwd`/notebooks:/notebooks:rw \
    -v ${DATA}:/data:ro \
    -p 8888:8888 \
    -t -i gijzelaerr/papino
