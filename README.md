## Dotfiles

Some Notes about each file config, maybe this will be automated in the future

### Todos

- [ ] Check if Homebrew is a good option to use on linux (maybe make installs via brew)

### .zshrc

This zsh config file use's oh-my-zsh and some plugins.
You need to install the spaceship theme.

### init.vim

It's a config file for **neovim** that uses **vim-plug**, so you need to have both.
If you already have them just open the file using nvim and install the plugins with `:PlugInstall`.

### coc.settings

json file with settings for nvim plugins installed via `coc`

### .vimrc

This file is not in `install.sh` anymore since I don't update nor use this file anymore, instead I use neovim with the `init.vim` file I explained above!

### tmux.conf

Don't forget to reload your config, you can use this command `tmux source-file ~/.tmux.conf`.

### Ideas

- use env files to store data that is used by scripts
- make app and packages installation by script (maybe using a brewfile?)

### Useful Links

- [dotfiles fireship video](https://www.youtube.com/watch?v=r_MpUP6aKiQ&ab_channel=Fireship)
- [Git Bare Repository DistroTube](https://www.youtube.com/watch?v=tBoLDpTWVOM&ab_channel=DistroTube)
- [Getting Started With Dotfiles medium article](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)
- [Build Your Own Linux Dotfiles Manager freecodecamp article](https://www.freecodecamp.org/news/build-your-own-dotfiles-manager-from-scratch/)
- [Make symlinks script](https://betterprogramming.pub/managing-your-dotfiles-with-git-4dee603a19a2)
- [make zsh default shell](https://askubuntu.com/questions/131823/how-to-make-zsh-the-default-shell)
- [Interesting themes and stuff ubuntu](https://www.youtube.com/watch?v=5b-xQkRWHjQ&list=WL&index=23&t=902s&ab_channel=DistroTube)
- [gitconfig Example](https://github.com/jessfraz/dotfiles/blob/master/.gitconfig)
