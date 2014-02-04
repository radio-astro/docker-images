#!/bin/sh

sudo docker run -v `pwd`/data:/data:rw -p 8888:8888 -t -i ska-sa/papino
