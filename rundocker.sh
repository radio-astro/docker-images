#!/bin/bash -e


if [ "$#" -ne 2 ]; then
    echo "USAGE: $0 <datafolder> <notebookfolder>"
    DATA=`pwd`/data/
    NOTEBOOKS=`pwd`/notebooks
else
    DATA=`readlink -m $1`
    NOTEBOOKS=`readlink -m $2`
fi

echo "using ${DATA} for data, ${NOTEBOOKS} for notebooks"

docker run \
    -v ${NOTEBOOKS}:/notebooks:rw \
    -v ${DATA}:/data:ro \
    -p 8888:8888 \
    -t -i gijzelaerr/papino
