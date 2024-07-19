#####
# Prompt
#####
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats '[%b]'

PROMPT=$'%{$reset_color%}\n%{%F{yellow}%}%(1j.[%j] .)%{%F{cyan}%}%~ %{%F{red}%}${vcs_info_msg_0_}'$'\n''$ %{$reset_color%}'
RPROMPT='%{%F{white}%}%*'

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

#####
# Install plugins
#####
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

#####
# Setup completions
#####
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:cat:*' fzf-preview 'head -n 5 $realpath'

# FZF shell integration
eval "$(fzf --zsh)"

####
# Keybinds
#####

# Allows jumping words with ctrl+arrow keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

#####
# Overwrites
#####
alias ls="ls -lh --color"

