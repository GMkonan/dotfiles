{
  programs.waybar = {
    enable = true;

    style =
      ''
      ${builtins.readFile "${pkgs.waybar}/etc/xdg/waybar/style.css"}
        * {
        font-family: JetBrains Mono;
        }

        window#waybar {
          background: #FF00FF;
        }
      '';
    settings = [{
      height = 20;
    }];
  };
}
