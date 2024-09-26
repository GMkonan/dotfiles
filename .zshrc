# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="/opt/homebrew/bin:$PATH"

# Zplug source ~/.zplug/init.zsh

#zplug "mafredri/zsh-async", from:github
#zplug "marlonrichert/zsh-autocomplete", from:github
zplug "plugins/git",   from:oh-my-zsh, defer:1
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma-continuum/fast-syntax-highlighting", defer:2
zplug "so-fancy/diff-so-fancy", as:command, use:"diff-so-fancy"
# Creates some alias for bat users
#zplug "fdellwing/zsh-bat"
# Loads thefuck with cache support (faster)
#zplug "laggardkernel/zsh-thefuck"

# Load theme file
# zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug romkatv/powerlevel10k, as:theme, depth:1

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# Theme settings

# SPACESHIP_PROMPT_ORDER=(
#   #user          # Username section
#   dir           # Current directory section
#   host          # Hostname section
#   git           # Git section (git_branch + git_status)
#   docker
#   docker_compose
#   exec_time     # Execution time
#   line_sep      # Line break
#   #vi_mode       # Vi-mode indicator
#   jobs          # Background jobs indicator
#   exit_code     # Exit code section
#   char          # Prompt character
# )
# SPACESHIP_USER_SHOW=always
# SPACESHIP_PROMPT_ADD_NEWLINE=false
# # deprecated
# #SPACESHIP_CHAR_SYMBOL="❯"
# SPACESHIP_CHAR_SYMBOL_SUCCESS='❯'
# SPACESHIP_CHAR_SYMBOL_FAILURE='❯'
# SPACESHIP_CHAR_SUFFIX=" "
# SPACESHIP_DIR_COLOR="cyan"
# SPACESHIP_PROMPT_ASYNC=FALSE

# Plugins settings

# thefuck plugin
if command -v thefuck &> /dev/null; then
  eval $(thefuck --alias)
fi

# Persist zsh history for auto completion
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

if [ -f "$HOME"/.secrets ]; then
  source "$HOME"/.secrets
fi

if [ -f "$HOME"/.aliases ]; then
  source "$HOME"/.aliases
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
# bun completions
[ -s "/Users/gmkonan/.bun/_bun" ] && source "/Users/gmkonan/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
alias ggovm="$GOPATH/bin/g";

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
#   POWERLEVEL9K_LEFT_PROMPT_ELEMENTS+=(newline)
#   POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS+=(newline)
# fi
