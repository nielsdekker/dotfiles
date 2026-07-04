# Containers

Voor containers is het handig om een script in `~/.local/bin` te zetten met
daarin een command om de container op te starten:

```bash
#!/bin/bash
PWD=$(pwd)

podman run \
    # Start interactief
    -it \

    # Geen checks of data opslag
    --no-healthcheck \
    --transient-store \

    # Zorg ervoor dat we met hetzelfde user ID werken
    --userns=keep-id \
    --user=$(whoami)

    # Mount alleen de huidige folder en zet het als de working dir voor volgende
    # commands
    --volume=$PWD:$PWD \
    --workdir=$PWD \

    # Voor git en SSH toegang
    --volume=$HOME/.gitconfig:$HOME/.gitconfig:ro \
    --volume $SSH_AUTH_SOCK:$SSH_AUTH_SOCK \
    --env SSH_AUTH_SOCK=$SSH_AUTH_SOCK \

    # Geen security labels, fixt een hele boel issues met mounting
    --security-opt label=disable \

    # Hergebruik het huidige netwerk
    --network=host \

    # Command om op te starten, `$@` zijn alle opvolgende argumenten
    localhost/nvim nvim $@
```

> Kopieer wat nodig is voor een specifiek image
