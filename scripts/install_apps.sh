#!/bin/bash

true || source ./functions.sh   

readonly wanted_packages=(
  ca-certificates
  apt-transport-https
  git
  curl
  wget
  zsh
  code
  google-chrome-stable
)
missing_packages=()

for package in "${wanted_packages[@]}"; do
  if ! is_apt_package_installed "${package}"; then
    missing_packages+=("${package}")
  fi
done

if [[ ${#missing_packages[@]} -gt 0 ]]; then
  echo "Installing missing packages with APT: ${missing_packages[*]}"

  sudo apt update --yes
  sudo apt install --yes --install-recommends "${missing_packages[@]}"
fi