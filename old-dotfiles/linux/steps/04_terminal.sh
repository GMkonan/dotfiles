#!/bin/bash

if [ "$FUNCTIONS_LOADED" != 'TRUE' ]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    source "${DIR}/../functions.sh"
fi

echo_color blue "Setting up Gnome Terminal..."

# Make profile theme be called "Default"! Necessary for gogh
id=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$id/ visible-name 'Default'

# clone the repo into "$HOME/.terminal-gogh-theme/gogh"
mkdir -p "$HOME/.terminal-gogh-theme"
cd "$HOME/.terminal-gogh-theme"
git clone https://github.com/Gogh-Co/Gogh.git gogh
cd gogh

# necessary in the Gnome terminal on ubuntu
export TERMINAL=gnome-terminal

# Enter install themes dir
cd installs

# install themes
./catppuccin-mocha.sh

# Other themes I like

#./catppuccin-latte.sh
#./catppuccin-macchiato.sh
#./catppuccin-frappe.sh
#./atom.sh
#./dracula.sh
