#####
# Prompt
#####
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats '[%b]'

PROMPT=$'\n%{%F{yellow}%}%(1j.[%j] .)%{%F{cyan}%}%~ %{%F{red}%}${vcs_info_msg_0_}\n%{$reset_color%}$ '

#####
# Default environment
#####
export EDITOR="nvim"

#####
# Setup zinit plugin manager
#####
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi 

source "$ZINIT_HOME/zinit.zsh"

####
# Install plugins
#####
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting

#####
# Setup completions
#####
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' default-color ''
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:ls:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:cat:*' fzf-preview 'head -n 5 $realpath'

# FZF shell integration
eval "$(fzf --zsh)"

####
# Keybinds
#####

# Allows jumping words with ctrl+arrow keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Aliases for tools
alias gs='git switch'
alias gp='git fetch; git pull;'
alias gm='git merge'
alias k='kubectl'
alias n='nvim'
alias tf='terraform'

# Run opencode in a sandboxed container environment
# The sandbox provides isolation for running untrusted code safely
alias opencode='podman run -it \
    -e TERM=$TERM \
    -e MISTRAL_API_KEY=$MISTRAL_API_KEY \
    -v $HOME/.config/opencode/:/root/.config/opencode/:rw,z \
    -v $HOME/.local/share/opencode/:/root/.local/share/opencode/:rw,z \
    -v $HOME/.local/state/opencode/:/root/.local/state/opencode/:rw,z \
    -v $(pwd)/:$(pwd)/:rw,z \
    -w $(pwd) \
    opencode-image'

#####
# Overwrites
#####
alias ls="ls -lh --color"

function expand-alias() {
	zle _expand_alias
	zle self-insert
}
zle -N expand-alias
bindkey -M main ' ' expand-alias

