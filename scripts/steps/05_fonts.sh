#!/bin/bash 

# https://github.com/ronniedroid/getnf

if [ "$FUNCTIONS_LOADED" != 'TRUE' ]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    source "${DIR}/../functions.sh"
fi

# This presents a list of fonts to install
# but I would like to automate this process
# and pass directly the fonts I want it to install
install_fonts() {
    echo_color blue "Installing some nerd fonts 🤓"
    git clone https://github.com/ronniedroid/getnf.git ~/.getnf
    ./getnf/install.sh

    fc-cache -f -v

    # Now change the terminal or whatever application to use the font you want
}

# install_fonts
