# My nvim config
Initially based on kickstart nvim.

### Todo
- add screenshot here or something
- [NVIM] add git plugins to nvim
- [NVIM] Check inspirations for more different plugins
    - lazyvim docs with their plugins
- make the plugin import better on `init.lua`
- increase font size when in neovim? Or maybe just directly in terminal

### Plugins
- nvim-cmp (autocompletion)
- conform (autoformat)
- catppuccin (colorscheme)
- telescope (fuzzy finder)
- treesitter (highlight/edit/nav)
- lspconfig + lazydev.nvim (lsp, completions/annotations etc)
- mini (various small independent plugins/modules)
- which-key (show you pending keybinds)
- gitsigns (add git related signs to gutter)

### Plugins I may try
- harpoon
- dashboard or alpha (greeter)
- flash

#### Notedown List
Everytime I think I can't do something or want a new thing in nvim, I will write here:
- copy error from line easilly
- fix oil not showing some hidden files by default

### Refs
- https://github.com/nvim-lua/kickstart.nvim
- https://github.com/dam9000/kickstart-modular.nvim
- https://blog.epheme.re/software/nvim-kickstart.html

### Stuff from main kickstart nvim repo faq I maintained
* Can I keep my existing configuration in parallel to kickstart?
  * Yes! You can use [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)`=nvim-NAME`
    to maintain multiple configurations. For example, you can install the kickstart
    configuration in `~/.config/nvim-kickstart` and create an alias:
    ```
    alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
    ```
    When you run Neovim using `nvim-kickstart` alias it will use the alternative
    config directory and the matching local directory
    `~/.local/share/nvim-kickstart`. You can apply this approach to any Neovim
    distribution that you would like to try out.
* What if I want to "uninstall" this configuration:
  * See [lazy.nvim uninstall](https://github.com/folke/lazy.nvim#-uninstalling) information
* Why is the kickstart `init.lua` a single file? Wouldn't it make sense to split it into multiple files?
  * The main purpose of kickstart is to serve as a teaching tool and a reference
    configuration that someone can easily use to `git clone` as a basis for their own.
    As you progress in learning Neovim and Lua, you might consider splitting `init.lua`
    into smaller parts. A fork of kickstart that does this while maintaining the
    same functionality is available here:
    * [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)
  * Discussions on this topic can be found here:
    * [Restructure the configuration](https://github.com/nvim-lua/kickstart.nvim/issues/218)
    * [Reorganize init.lua into a multi-file setup](https://github.com/nvim-lua/kickstart.nvim/pull/473)
