#!/bin/bash 

if [ "$FUNCTIONS_LOADED" != 'TRUE' ]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    source "${DIR}/../functions.sh"
fi

make_zsh_default_shell() {
    echo_color blue "Making zsh the default shell..."
    chsh -s $(which zsh)
}

install_zplug() {
    echo_color blue "Installing zplug..."
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
}

make_zsh_default_shell

install_zplug
