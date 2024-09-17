### Konan dotfiles
- kitty (probably inside a .config)
- nix
- mac
- devcontainer

### structure
- config => only has stuff that goes inside the .config folder (nvim, kitty)




# BEGIN_KITTY_THEME
# theme taken from https://github.com/kovidgoyal/kitty-themes
# just run `kitty +kitten themes`
# Catppuccin-Mocha
include current-theme.conf
# END_KITTY_THEME


# BEGIN_KITTY_FONTS
# theme chosen with the command `kitten choose-fonts`
font_family      family="JetBrains Mono"
bold_font        auto
italic_font      auto
bold_italic_font auto
font_size 12.5
# END_KITTY_FONTS

# Tab config
tab_bar_min_tabs            1
tab_bar_edge                bottom
tab_bar_style               powerline
tab_powerline_style         slanted
tab_title_template          {title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}
