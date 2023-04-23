#!/bin/bash

if [ "$FUNCTIONS_LOADED" != 'TRUE' ]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    source "${DIR}/../functions.sh"
fi

initial_setup() {
    export PATH="/usr/local/bin:$PATH"

    trap 'exit 0' SIGINT # exit cleanly if aborted with ⌃C

    # ask for the administrator password upfront, for commands that require 'sudo'
    clear
    bold_echo 'Insert the "sudo" password now (will not be echoed).'
    until sudo -n true 2> /dev/null; do # if password is wrong, keep asking
        read -s -p "Password:" sudo_password
        echo
        sudo -S -v <<< "${sudo_password}" 2> /dev/null
    done
}

initial_setup