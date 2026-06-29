#!/bin/bash

CMD=$@
PWD=$(pwd)
CONTAINER="blue-tools"
CONTAINER_NAME="$CONTAINER${PWD//\//-}"

if [[ -z $CONTAINER ]]; then
    echo "Geen container gespecificeerd"
    return
fi

if [[ $PWD == $HOME ]]; then
    echo "Kan niet starten vanuit de home folder"
    exit 1
fi

# Wanneer de container niet draait starten we deze op in detached mode
if [[ -z $(podman ps --filter "name=^$CONTAINER_NAME$" --format "{{ .Names }}") ]]; then
    podman run \
        -it \
        --userns=keep-id \
        --volume=$PWD:$PWD \
        --workdir=$PWD \
        --env HOME=$HOME \
        --volume=$HOME \
        --volume=$HOME/.bashrc:$HOME/.bashrc \
        --security-opt label=disable \
        --network=host \
        --user=$(whoami) \
        --name=$CONTAINER_NAME \
        --replace \
        --detach \
        localhost/$CONTAINER \
        sh -c 'trap "exit" TERM; while true; do sleep 1; done' \
        > /dev/null
fi

# En nu kunnen we ons commando draaien
if [[ -z $CMD ]]; then
    podman exec -it $CONTAINER_NAME $SHELL
else
    podman exec -i $CONTAINER_NAME $CMD
fi
