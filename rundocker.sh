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

# Figure out the container id
CONTAINER_ID=$(docker run \
    -d \
    -v ${NOTEBOOKS}:/notebooks:rw \
    -v ${DATA}:/data:ro \
    -p 8888:8888 \
    -p 22 \
    -t -i gijzelaerr/papino-dev)

# Show a human readable container id
CONTAINER_ID=$(echo ${CONTAINER_ID} | sed -r 's/^([ABCDEFabcdef0-9]{8}).*?/\1/g')

# Figure out the SSH port
SSH_PORT=$(docker port ${CONTAINER_ID} 22)
# Strip out the IP data
SSH_PORT=$(echo ${SSH_PORT} | sed 's/.*://g')
# Figure out the iPython port
IPYTHON_PORT=$(docker port ${CONTAINER_ID} 8888)
# Strip out the IP data
IPYTHON_PORT=$(echo ${IPYTHON_PORT} | sed 's/.*://g')

echo
echo "Container ID: ${CONTAINER_ID}"
echo

echo "The following stops the container:"
echo
echo "docker stop ${CONTAINER_ID}"
echo 

echo "SSH port is ${SSH_PORT}. Run the following for a port forwarded SSH session."
echo "  # ssh -Y -p ${SSH_PORT} root@localhost"
echo "iPython port is ${IPYTHON_PORT}"
