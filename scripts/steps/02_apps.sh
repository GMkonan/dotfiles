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
    git
    zsh
    code
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
  echo_color blue "Installing missing packages with APT: ${missing_packages[*]}"

  apt update --yes
  apt install --yes --install-recommends "${missing_packages[@]}"
fi

}

# Install curl apps

curl_apps() {
    echo "Installing LTS NodeJS via nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    nvm use --lts

    echo "Installing CLI's..."
    # Fly.io
    curl -L https://fly.io/install.sh | sh
    # Airplane
    curl -L https://github.com/airplanedev/cli/releases/latest/download/install.sh | sh
}

install_docker() {
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
}

install_apt_packages

curl_apps

install_docker