# Add git branch
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT=$'\n''%F{cyan}%~ %F{red}${vcs_info_msg_0_}'$'\n''%B$b '
RPROMPT="%F{white}%*"
zstyle ':vcs_info:git:*' formats '[%b]'

# Swag
neofetch
