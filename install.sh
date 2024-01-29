#!/bin/bash

echo "Select your operating system:"
echo "1. macOS"
echo "2. Ubuntu"

read -p "Enter the number of your choice (1 or 2): " choice

case $choice in
    1)
        # callout function for macOS steps
        echo "You selected macOS."
        ;;
    2)
        # callout function for linux steps
        echo "You selected Ubuntu."
        ;;
    *)
        echo "Invalid choice. Please enter either 1 or 2."
        ;;
esac

# cd "${0%/*}"
# cat "$PWD"/scripts/functions.sh > /tmp/script
# set -a
# . /tmp/script

# # Dividing in a function gives me the ability to only get dotfiles in installation
# create_symlinks() {
#   echo_color blue "Creating symlinks..."
#   ln -nsf "$PWD"/configs/zshenv ~/.zshenv
#   ln -nsf "$PWD"/configs/zshrc ~/.zshrc
#   ln -nsf "$PWD"/configs/aliases ~/.aliases
#   ln -nsf "$PWD"/configs/tmux.conf ~/.tmux.conf
#   ln -nsf "$PWD"/configs/gitconfig ~/.gitconfig
#   ln -nsf "$PWD"/configs/nvim ~/.config/nvim
# }

# run_scripts() {

#   echo_color blue "Making sure everything is up to date..."
#   update

#   create_symlinks

#   # concatenate all shell scripts together, so things like variables can be reused
#   cat "$PWD"/scripts/steps/*.sh > /tmp/dotfiles_script
#   bash /tmp/dotfiles_script
# }

# run_scripts
