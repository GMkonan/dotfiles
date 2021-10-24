function create_symlinks {
ln -nsf "$PWD"/files/.zshrc ~/.zshrc
ln -nsf "$PWD"/files/.gitconfig ~/.gitconfig
ln -nsf "$PWD"/files/.vimrc ~/.vimrc
}