{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;

  };

   # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  # nano is installed by default!

  # Desktop apps
  discord
  obsidian
  brave
  kitty

  # coding
  gcc
  gnumake
  nodejs
  python

  # CLI
  wget
  git
  neovim
  vim
  fastfetch

  ];

  # fonts.packages = with pkgs; [
  #   jetbrains-mono
  # ];
}
