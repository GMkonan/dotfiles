# Nix stuff

## todo && issues
- configure waybar and hyprland
- update readme better
- fix font (jetbrains and commit)
- fix telescope
- display manager and option for both kde and hyprland
    - try sddm, sddm display manager hyprland and kde nixos
- Fix python install (check install insecure, some configs have it)

rebuild flake command:
sudo nixos-rebuild switch --flake /etc/nixos#default

now command should be:
sudo nixos-rebuild switch --flake ~/code/dotfiles/flake#default

home manager (should have alias):
- home-manager switch --flake ./flake/

#### internet stuff
having some problems with internet stuff while configuring.. just so I can remember:
> nmcli device wifi connect <SSID> password <password>

In case you have a "secrets" issue delete your con
> nmcli con delete <SSID>

### Problem with pixelated brave under wayland
chrome://flags/ - search wayland - change to wayland - Preferred Ozone platform

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
