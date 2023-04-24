#!/bin/bash

cd "${0%/*}"
cat "$PWD"/scripts/functions.sh > /tmp/script
set -a
. /tmp/script

run_scripts() {

  echo_color blue "Making sure everything is up to date..."
  update

  echo_color blue "Creating symlinks..."
  ln -nsf "$PWD"/configs/zshenv ~/.zshenv
  ln -nsf "$PWD"/configs/zshrc ~/.zshrc
  ln -nsf "$PWD"/configs/tmux.conf ~/.tmux.conf
  ln -nsf "$PWD"/configs/gitconfig ~/.gitconfig


  # concatenate all shell scripts together, so things like variables can be reused
  cat "$PWD"/scripts/steps/*.sh > /tmp/dotfiles_script
  bash /tmp/dotfiles_script
}

run_scripts
