#!/bin/bash 

# Although the install_apt_packages is fine in my opinion I don't like
# how the usage of functions is working here, refactor later...

if [ "$FUNCTIONS_LOADED" != 'TRUE' ]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    source "${DIR}/../functions.sh"
fi

install_apt_packages() {
    # Install apt packages
    echo_color blue "Installing APT packages..."
    
    readonly wanted_packages=(
    ca-certificates
    apt-transport-https
    gnupg
    lsb-release
    git
    zsh
    code
    wget
    curl
    bat
    python3-dev
    python3-pip
    python3-setuptools
    google-chrome-stable
    spotify-client
    make
    cargo
    tmux
    guix
  )
missing_packages=()

for package in "${wanted_packages[@]}"; do
  if ! is_apt_package_installed "${package}"; then
    missing_packages+=("${package}")
  fi
done

if [[ ${#missing_packages[@]} -gt 0 ]]; then
  echo_color yellow "Installing missing packages with APT: ${missing_packages[*]}"

  sudo apt update --yes
  sudo apt install --yes --install-recommends "${missing_packages[@]}"
fi

}

# Install curl apps

curl_apps() {

    # I may change nvm for fnm (rust-based) if they start supporting "use lts"
    # https://github.com/Schniz/fnm
    echo_color blue "Installing nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    echo_color blue "Installing NodeJS LTS..."
    # Make nvm command available to terminal
    source ~/.bashrc
    source ~/.nvm/nvm.sh
    # Install NodeJS LTS
    #nvm install 'lts/*'
    nvm install --lts
    nvm alias default node
    nvm use --lts

    echo_color blue "Installing CLI's..."
    # Fly.io
    curl -L https://fly.io/install.sh | sh
    # Airplane
    curl -L https://github.com/airplanedev/cli/releases/latest/download/install.sh | sh

    # Deno
    curl -fsSL https://deno.land/x/install/install.sh | sh
}

pip_apps() {
  pip3 install thefuck --user
}

install_docker() {
    echo_color blue "Installing Docker..."

    # Update
    sudo apt-get update

    # Add Docker's official GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Add Docker's stable repository
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Install Docker
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    # Add current user to the docker group
    sudo usermod -aG docker $USER

    # Install Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.17.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}

install_lazyvim () {
  # https://superuser.com/questions/1752808/cant-install-neovim-v0-8-0-on-ubuntu

  # Check if Neovim version 0.8.0 or higher is already installed
  if ! nvim --version | grep -qE '^NVIM v0\.(8\.|9\.|10\.)'; then
    # Install Neovim version 0.8.0 or higher
    echo "Installing Neovim version 0.8.0 or higher..."
    # get updated package
    wget -qO - 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1> /dev/null
    echo "deb [arch=all,$(dpkg --print-architecture) signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list
    # Install neovim
    sudo apt update
    sudo apt upgrade
    sudo apt install -y neovim


    # Backup configs in case of fuck up
    # required
    mv ~/.config/nvim{,.bak}

    # optional but recommended
    mv ~/.local/share/nvim{,.bak}
    mv ~/.local/state/nvim{,.bak}
    mv ~/.cache/nvim{,.bak}

    # clone lazyvim
    git clone https://github.com/LazyVim/starter ~/.config/nvim

    # Remove git folder from lazyvim template starter repo
    rm -rf ~/.config/nvim/.git
  fi
}

install_apt_packages

curl_apps

pip_apps

install_docker

# install_lazyvim

