#!/bin/bash

cd ~/dotfiles
echo "Maak alle toolbox containers opnieuw aan"

for IMG in $(/usr/bin/ls containers | grep '.dockerfile'); do
    NAME="${IMG%.dockerfile}"

    podman stop $NAME
    podman rm $NAME
    podman build -f containers/$IMG -t localhost/$NAME containers/.
done

echo "Containers aangemaakt"
