#/bin/bash

# Make sure all is updated
sudo dnf update -y;

# Add standard tools
sudo dnf install -y \
  neovim \
  tmux \
  alacritty;

# Symlink the dotfiles
ln -s ./nvim ~/.config/
ln -s ./alacritty ~/.config/
ln -a ./tmux/tmux.conf ~/.tmux.conf
