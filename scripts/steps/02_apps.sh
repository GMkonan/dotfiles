#!/bin/bash 

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
    google-chrome-stable
    spotify-client
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

install_apt_packages

curl_apps

install_docker
