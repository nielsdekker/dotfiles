# Add git branch
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT=$'%{$reset_color%}\n%{%F{cyan}%}%~ %{%F{red}%}${vcs_info_msg_0_}'$'\n''$ %{$reset_color%}'
RPROMPT="%{%F{white}%}%*"
zstyle ':vcs_info:git:*' formats '[%b]'

# Swag
PF_ASCII="Catppuccin" PF_INFO="palette ascii os kernel uptime memory" ~/.config/zsh/pfetch
