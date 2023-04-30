#!/bin/bash

cd "${0%/*}"
cat "$PWD"/scripts/functions.sh > /tmp/script
set -a
. /tmp/script

# Dividing in a function gives me the ability to only get dotfiles in installation
create_symlinks() {
  echo_color blue "Creating symlinks..."
  ln -nsf "$PWD"/configs/zshenv ~/.zshenv
  ln -nsf "$PWD"/configs/zshrc ~/.zshrc
  ln -nsf "$PWD"/configs/aliases ~/.aliases
  ln -nsf "$PWD"/configs/tmux.conf ~/.tmux.conf
  ln -nsf "$PWD"/configs/gitconfig ~/.gitconfig
}

run_scripts() {

  echo_color blue "Making sure everything is up to date..."
  update

  create_symlinks

  # concatenate all shell scripts together, so things like variables can be reused
  cat "$PWD"/scripts/steps/*.sh > /tmp/dotfiles_script
  bash /tmp/dotfiles_script
}

run_scripts
