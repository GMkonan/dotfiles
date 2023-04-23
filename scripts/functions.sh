#!/bin/bash

bold_echo() { # helper function for bold text
    echo "$(tput bold)$1$(tput sgr0)"
}

echo_color () {
    local color=""
    case "$1" in
        red)
            color="\033[1;31m"
            ;;
        green)
            color="\033[1;32m"
            ;;
        yellow)
            color="\033[1;33m"
            ;;
        blue)
            color="\033[1;34m"
            ;;
        *)
            color="\033[0m"
            ;;
    esac
    shift
    echo -e "${color}$@\033[0m"
}


# is_apt_package_installed() {
#     package_name=$1

#     # Check if the package is installed
#     if dpkg -s "$package_name" >/dev/null 2>&1; then
#         echo_color blue "$package_name is installed."
#         return 0
#     else
#         echo_color blue "$package_name is not installed."
#         return 1
#     fi
# }

renew_sudo() { # helper function for when the following command needs 'sudo' active but shouldn't be called with it
    sudo -S -v <<< "${sudo_password}" 2> /dev/null
}

update_apt() {
    apt update && apt upgrade -y
}

FUNCTIONS_LOADED=TRUE

function is_apt_package_installed() {
  local package="$1"

  apt list --quiet --quiet --installed "${package}" 2>/dev/null | grep --quiet .
}

sudo() {
  if [ "$(id -u)" -eq 0 ]; then
    "$@"
  else
    if ! command sudo --non-interactive true 2>/dev/null; then
      echo_color yellow "Root privileges are required, please enter your password below"
      command sudo --validate
    fi
    command sudo "$@"
  fi
}