zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit && compinit

# Makes completion case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
