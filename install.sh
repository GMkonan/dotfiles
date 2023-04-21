#!/bin/bash

chmod +x ./scripts/install_apps.sh
sudo ./scripts/install_apps.sh

chmod +x ./scripts/zsh_configs.sh
sudo ./scripts/zsh_configs.sh

chmod +x ./scripts/install_curl_packages.sh
sudo ./scripts/install_curl_packages.sh

chmod +x ./scripts/install_docker.sh
sudo ./scripts/install_docker.sh

#install zsh spaceship theme
git clone https://github.com/spaceship-prompt/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt --depth=1

ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme

# symbolic links, f flag can overwrite files
ln -nsf "$PWD"/configs/.zshrc ~/.zshrc
ln -nsf "$PWD"/configs/.gitconfig ~/.gitconfig
ln -nsf "$PWD"/configs/.tmux.conf ~/.tmux.conf
ln -nsf "$PWD"/configs/.secrets ~/.secrets

apt-get update && apt-get upgrade -y
apt update && apt upgrade -y

#finish entering zsh and sourcing since this pauses the script
zsh
source ~/.zshrc

chmod +x ./scripts/theme.sh
sudo ./scripts/theme.sh

echo "setup complete! Enjoy your configs :)"