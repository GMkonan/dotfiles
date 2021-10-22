#!/bin/bash

# source scripts for using functions
for shell_script in "./scripts/"*.sh; do
  source "${shell_script}"
done

function renew_sudo {
  sudo -S -v <<< "${sudo_password}" 2> /dev/null
}

function show_options {
  clear

  echo "
  Options:

  [1] Install all.
  [2] setup only dotfiles.
  [3] Install apps.
  [4] setup environments.
  [5] Quit.
  "

  read -n1 -p 'Pick a number:' option
  clear

  if [[ "${option}" -eq 1 ]]; then
    create_symlinks
    install_brew
    install_brew_apps
    install_brew_cask_apps
  elif [[ "${option}" -eq 2 ]]; then
    echo "Creating symlinks..."
    create_symlinks
  elif [[ "${option}" -eq 5 ]]; then
    return 0
  else
    echo "Error: Invalid option. Try again."
  fi

  show_options
}

renew_sudo
show_options