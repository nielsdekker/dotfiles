#/bin/bash

# Make sure all is updated
sudo dnf update -y;

# Add standard tools
sudo dnf install -y \
  neovim \
  kitty \
  zsh \
  util-linux-user;

# Symlink the dotfiles
cd ~/.config/ 
ln -s ~/dotfiles/nvim ./
ln -s ~/dotfiles/alacritty ./
ln -s ~/dotfiles/kitty ./
ln -s ~/dotfiles/zsh ./

cd ~
ln -s ./dotfiles/tmux/tmux.conf ~/.tmux.conf

# Setup zsh
chsh -s $(which zsh)
touch ~/.zshrc
echo 'source ~/.config/zsh/prompt.zsh' >> ~/.zshrc
echo 'source ~/.config/zsh/compinit.zsh' >> ~/.zshrc

# Add custom fonts
mkdir -f ~/.local/share/fonts/
cp ~/dotfiles/resources/hack-font/HackNerdFont-* ~/.local/share/fonts/
cp ~/dotfiles/resources/jetbrains-mono/JetBrainsMonoNerdFont-* ~/.local/share/fonts/
