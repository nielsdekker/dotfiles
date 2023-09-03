#/bin/bash

# Make sure all is updated
sudo dnf update -y;

# Add standard tools
sudo dnf install -y \
  neovim \
  tmux \
  alacritty \
  zsh \
  util-linux-user;

# Symlink the dotfiles
cd ~/.config/ 
ln -s ~/dotfiles/nvim ./
ln -s ~/dotfiles/alacritty ./

cd ~
ln -s ./dotfiles/tmux/tmux.conf ~/.tmux.conf

# Add starship (no fedora package)
curl -sS https://starship.rs/install.sh | sh

# Setup zsh
chsh -s $(which zsh)

touch ~/.zshrc
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# Add custom fonts
cp ~/dotfiles/resources/hack-font/HackNerdFont-* ~/.local/share/fonts/
