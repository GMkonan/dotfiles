#!/bin/bash

if [ "$FUNCTIONS_LOADED" != 'TRUE' ]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    source "${DIR}/../functions.sh"
fi

install_font() {
    echo_color blue "Installing font..."
    # Install font
    wget https://download.jetbrains.com/fonts/JetBrainsMono-2.225.zip

    unzip JetBrainsMono-2.225.zip

    sudo mkdir -p /usr/share/fonts/truetype/jetbrains-mono/

    sudo cp JetBrainsMono-2.225/ttf/*.ttf /usr/share/fonts/truetype/jetbrains-mono/

    sudo fc-cache -f -v
} 

install_font

# Maybe install font in this step because I'm lazy to create other step right now

echo_color green "setup complete! Enjoy your configs :)"
