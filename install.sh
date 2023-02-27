#!/bin/bash

apt update && apt upgrade -y

echo "Installing Git..."

apt-get install -y git

echo "Installing zsh and oh-my-zsh..."
apt-get install -y zsh

# change default login shell
chsh -s $(which zsh)

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# symlink zshrc file before editing line with 
ln -nsf "$PWD"/configs/.zshrc ~/.zshrc

#install zsh spaceship theme
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

source ~/.zshrc

echo "Installing Docker..."
#https://matt-wxw.medium.com/one-command-to-install-docker-and-docker-compose-on-ubuntu-febb8bc5cb72
/bin/bash -c "$(curl -fsSL https://git.io/JDGfm)"

# symbolic links, f flag can overwrite files
ln -nsf "$PWD"/configs/.gitconfig ~/.gitconfig
ln -nsf "$PWD"/configs/.tmux.conf ~/.tmux.conf
ln -nsf "$PWD"/.secrets ~/.secrets

echo "setup complete! Enjoy your configs :)"