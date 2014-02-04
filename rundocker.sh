#!/bin/sh

DATA=`pwd`/data/
NOTEBOOKS=`pwd`/notebooks

# on jake:
#DATA=/home/oms/Waterhole/RP-3C147/
#NOTEBOOKS=${DATA}

docker run \
    -v ${NOTEBOOKS}:/notebooks:rw \
    -v ${DATA}:/data:ro \
    -p 8888:8888 \
    -t -i gijzelaerr/papino
