prompt_cmd() {
    PS1_TUN0="$(ip addr show dev tun0 2>/dev/null | grep "inet " | cut -d" " -f6)"
    PS1_GIT_BRANCH="$(git branch --show-current 2>/dev/null)"

    PS1="\n"
    if [ -n "$(jobs -p)" ]; then
        PS1+="\e[0;33m[\j]\e[0m "
    fi

    if [ -n "$PS1_TUN0" ]; then
        PS1+="\e[0;32m[${PS1_TUN0}]\e[0m "
    fi

    # Current working directory
    PS1+="\e[0;36m\w\e[0m"

    if [ -n "$PS1_GIT_BRANCH" ]; then
        PS1+=" \e[0;31m[${PS1_GIT_BRANCH}]\e[0m"
    fi

    PS1+="\n• "
}

export PROMPT_COMMAND=prompt_cmd
