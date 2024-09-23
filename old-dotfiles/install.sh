#!/bin/bash

echo "Please choose your installation type:"
echo "1. debian"
echo "2. macos"
read -p "Enter your choice (debian/macos): " choice

while true; do
    if [[ "$choice" == "debian" || "$choice" == "macos" ]]; then
        break
    else
        echo "Invalid input, please enter 'debian' or 'macos'."
        read -p "Enter your choice (debian/macos): " choice
    fi
done

if [ "$choice" == "debian" ]; then
    echo "You chose Debian installation."
    ./install_debian.sh
elif [ "$choice" == "macos" ]; then
    echo "You chose MacOS installation."
    ./install_macos.sh
fi
