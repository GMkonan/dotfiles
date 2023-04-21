#!/bin/bash

function is_apt_package_installed() {
  local package="$1"

  apt list --quiet --quiet --installed "${package}" 2>/dev/null | grep --quiet .
}

sudo() {
  if [ "$(id -u)" -eq 0 ]; then
    "$@"
  else
    if ! command sudo --non-interactive true 2>/dev/null; then
      log_manual_action "Root privileges are required, please enter your password below"
      command sudo --validate
    fi
    command sudo "$@"
  fi
}