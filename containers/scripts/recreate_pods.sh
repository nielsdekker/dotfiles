#!/bin/bash

cd ~/dotfiles

POD_EXE=$(cat <<EOF
#!/bin/bash
PWD=\$(pwd)
podman run \\
    -it \\
    --no-healthcheck \\
    --transient-store \\
    --userns=keep-id \\
    --volume=\$PWD:\$PWD \\
    --workdir=\$PWD \\
    --security-opt label=disable \\
    --network=host \\
    --user=\$(whoami)
EOF
)

for IMG in $(/usr/bin/ls containers | grep '.dockerfile'); do
    NAME="${IMG%.dockerfile}"

    echo "Bouw container voor command $NAME opnieuw"
    podman build \
        -f containers/$IMG \
        -t localhost/$NAME \
        --build-arg HOME=$HOME \
        --build-arg UID=$(id -u) \
        .

    EXE="$HOME/.local/bin/$NAME"
    echo "Maak een executable aan"
    echo "$POD_EXE localhost/$NAME $NAME \$@" > $EXE
    chmod +x $EXE
done

echo "Containers aangemaakt"
