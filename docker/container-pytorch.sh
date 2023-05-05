#!/bin/bash

echo "Usage: ./container-pytorch.sh <container-name> <host-path>"

images=$(docker image ls | grep pytorch)
images=($images)

docker container run -it --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 --net host --gpus all --name $1 -v $2:/workspace ${images[0]}:${images[1]} /bin/bash
