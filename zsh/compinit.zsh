zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit && compinit

# Makes completion case insensitive
zstyle ':completion:*:*:git:*' script ~/.config/zsh/git-completion.bash
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
