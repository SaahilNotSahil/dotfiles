#!/bin/bash

args=($@)
numArgs=${#args[@]}

if [ $numArgs -eq 0 ]; then
    echo "Usage: ./container-pytorch.sh <container-name> <host-path> <image> <OPTIONAL: tag>"
    exit 1
elif [ $numArgs -lt 3 ] && [ $numArgs -gt 0 ]; then
    echo "Error: Not enough arguments"
    echo "Usage: ./container-pytorch.sh <container-name> <host-path> <image> <OPTIONAL: tag>"
    exit 1
elif [ $numArgs -eq 3 ]; then
    images=$(docker image ls | grep ${args[2]})
elif [ $numArgs -eq 4 ]; then
    images=$(docker image ls | grep ${args[2]} | grep ${args[3]})
fi

images=($images)

docker container run -it --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 --net host --gpus all --name ${args[0]} -v ${args[1]}:/workspace ${images[0]}:${images[1]} /bin/bash -c "cd /workspace && bash"
