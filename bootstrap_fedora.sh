#!/bin/bash

# Make sure all is updated
sudo dnf update -y;

# Add standard tools
sudo dnf install -y \
  neovim \
  zsh \
  util-linux-user;

# Setup flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install  \
  org.gnome.firefox \
  org.wezfurlong.wezterm \
  io.missioncenter.MissionCenter;

# Symlink the dotfiles
cd ~/.config/ || exit
ln -s ~/dotfiles/nvim ./
ln -s ~/dotfiles/wezterm ./
ln -s ~/dotfiles/zsh ./

# Setup zsh
chsh -s "$(which zsh)"
touch ~/.zshrc
echo 'source ~/.config/zsh/prompt.zsh' >> ~/.zshrc
echo 'source ~/.config/zsh/compinit.zsh' >> ~/.zshrc

# Add custom fonts
mkdir -f ~/.local/share/fonts/
cp ~/dotfiles/resources/hack-font/HackNerdFont-* ~/.local/share/fonts/
cp ~/dotfiles/resources/jetbrains-mono/JetBrainsMonoNerdFont-* ~/.local/share/fonts/
cp ~/dotfiles/resources/monaspace/Monaspace* ~/.local/share/fonts/

