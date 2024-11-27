{
  programs.waybar = {
    enable = true;

    style =
      ''
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
