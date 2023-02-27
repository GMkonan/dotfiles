#!/bin/bash

apt-get update && apt-get upgrade -y
apt update && apt upgrade -y

echo "Installing utilities (wget, curl)..."
apt install curl -y
apt update && apt upgrade -y
apt-get install wget -y
apt-get update && apt-get upgrade -y

# echo "Installing Git..."

# apt-get install -y git
# apt-get update && apt-get upgrade -y

echo "Installing zsh and oh-my-zsh..."
apt-get install -y zsh
apt-get update && apt-get upgrade -y

apt-get update && apt-get upgrade -y
apt update && apt upgrade -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# change default login shell
chsh -s $(which zsh)


git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# symlink zshrc file before editing line with 
ln -nsf "$PWD"/configs/.zshrc ~/.zshrc

#install zsh spaceship theme
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

zsh
source ~/.zshrc

echo "Installing Docker..."
#https://matt-wxw.medium.com/one-command-to-install-docker-and-docker-compose-on-ubuntu-febb8bc5cb72
apt-get remove docker docker-engine docker.io containerd runc
apt-get update && apt-get upgrade -y
apt-get install -y \
    ca-certificates \
    gnupg \
    lsb-release
rm -rf /usr/share/keyrings/docker-archive-keyring.gpg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update && apt-get upgrade -y
apt-get install -y docker-ce docker-ce-cli containerd.io
usermod -a -G docker $USER
curl -L "https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-linux-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


# symbolic links, f flag can overwrite files
ln -nsf "$PWD"/configs/.gitconfig ~/.gitconfig
ln -nsf "$PWD"/configs/.tmux.conf ~/.tmux.conf
ln -nsf "$PWD"/.secrets ~/.secrets

apt-get update && apt-get upgrade -y
apt update && apt upgrade -y

echo "setup complete! Enjoy your configs :)"