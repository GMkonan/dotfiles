#!/bin/bash

# symbolic links
ln -nsf "$PWD"/files/.bashrc ~/.bashrc
ln -nsf "$PWD"/files/.zshrc ~/.zshrc
ln -nsf "$PWD"/files/.gitconfig ~/.gitconfig
# create nvim folder if doesnt already exists
mkdir -p ~/.config/nvim/ && ln -nsf "$PWD"/files/init.vim ~/.config/nvim/init.vim
# install vim-plug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
ln -nsf "$PWD"/scripts/worktmux.sh ~/worktmux.sh
ln -nsf "$PWD"/.secrets ~/.secrets
ln -nsf "$PWD"/files/.tmux.conf ~/.tmux.conf