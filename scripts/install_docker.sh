#!/bin/bash

install_docker() {
    echo "Installing Docker..."
    #https://matt-wxw.medium.com/one-command-to-install-docker-and-docker-compose-on-ubuntu-febb8bc5cb72
    sudo apt-get remove docker docker-engine docker.io containerd runc
    sudo apt-get update && apt-get upgrade -y
    sudo apt-get install -y \
    ca-certificates \
    gnupg \
    lsb-release
    sudo rm -rf /usr/share/keyrings/docker-archive-keyring.gpg
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && apt-get upgrade -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -a -G docker $USER
sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-linux-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
}

install_docker

# echo "Installing Docker..."
# #https://matt-wxw.medium.com/one-command-to-install-docker-and-docker-compose-on-ubuntu-febb8bc5cb72
# apt-get remove docker docker-engine docker.io containerd runc
# apt-get update && apt-get upgrade -y
# apt-get install -y \
#     ca-certificates \
#     gnupg \
#     lsb-release
# rm -rf /usr/share/keyrings/docker-archive-keyring.gpg
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
# apt-get update && apt-get upgrade -y
# apt-get install -y docker-ce docker-ce-cli containerd.io
# usermod -a -G docker $USER
# curl -L "https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-linux-$(uname -m)" -o /usr/local/bin/docker-compose
# chmod +x /usr/local/bin/docker-compose