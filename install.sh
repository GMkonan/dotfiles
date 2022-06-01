#!/bin/bash

# symbolic links
ln -nsf "$PWD"/files/.bashrc ~/.bashrc
ln -nsf "$PWD"/files/.zshrc ~/.zshrc
ln -nsf "$PWD"/files/.gitconfig ~/.gitconfig
mkdir -p ~/.config/nvim/ && ln -nsf "$PWD"/files/init.vim ~/.config/nvim/init.vim
ln -nsf "$PWD"/scripts/worktmux.sh ~/worktmux.sh
ln -nsf "$PWD"/.secrets ~/.secrets
ln -nsf "$PWD"/files/.tmux.conf ~/.tmux.conf