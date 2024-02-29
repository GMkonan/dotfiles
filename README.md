# WIP

Making configs for mac too, understanding stuff about brewfiles. making a good installation script (bash?). Work in progress.

## Debian and MAC based Dotfiles

Hey! I format my PC a lot and it's so boring to reconfig everything every time to start working... So I automated! Right now it will only work on debian based distros (use of apt and etc) but if you use other OS you can still take a look on some general configs like my `zshrc` files and what plugins I use, a took a lot of inspiration from dotfiles that were made for MacOS so you can do the same here if you want 😀

#### Things I do outside of script

Somethings that I do when setting up a new PC that are not included in the script:

- Download fonts (Jetbrain mono is a good one) (want to automate that) (install font via brew cask fonts?)
- Run `tmux source ~/.tmux.conf` Inside a tmux session to load configs

https://github.com/cli/cli

### Todo

- Finish making linux and mac dotifiles.
- copy nvim folder to .config/ (because symlink doesnt work...)
- making good install script (conditions, symlinks etc)
- configuring tmux.conf
- understanding more about brewfiles, brew bundle stuff
- configs should be env, machine based? or general? or mix?
- symlink brewfile to home

### Links

- https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f
