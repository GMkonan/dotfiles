# Nix stuff

## todo && issues
- home manager stuff (is it even worth it?) (did it via channel)
- install hyprland on nix and config via home-manager
- Fix python install (check install insecure, some configs have it)
- fix font (jetbrains and commit)
- fix telescope
- fix internet on hyprland
- fix fonts
- display manager and option for both kde and hyprland

rebuild flake command:
sudo nixos-rebuild switch --flake /etc/nixos#default

now command should be:
sudo nixos-rebuild switch --flake ~/code/dotfiles/flake#default

home manager (should have alias):
- home-manager switch --flake ./flake/

### things I wanna install
- hyprland
- waybar
- rofi
- ags

### Future
- options for darwin/mac on home manager in case I wanna use it there too

### Useful stuff
- https://www.youtube.com/watch?v=a67Sv4Mbxmc
- https://www.youtube.com/watch?v=nLwbNhSxLd4
- zoe config
- https://github.com/Misterio77/nix-starter-configs

there is a .secrets on laptop with envs
