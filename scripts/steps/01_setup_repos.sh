#!/bin/bash

if [ "$FUNCTIONS_LOADED" != 'TRUE' ]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    source "${DIR}/../functions.sh"
fi

# Necessary for adding repositories for later packages to install
install_wget() {
    if ! is_apt_package_installed wget; then
        apt update --yes
        apt install --yes --install-recommends wget
    fi
}

install_curl() {
    if ! is_apt_package_installed curl; then
        apt update --yes
        apt install --yes --install-recommends curl
    fi
}

add_repos() {
    install_wget
    install_curl
    
    # Add google-chrome repo
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

    # Add spotify repo
    curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

    update_apt
}

add_repos