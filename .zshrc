# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to dotfiles
export DOTFILES=$HOME/code/projects/dotfiles
# Path to zsh_custom (files with .zsh will be loaded by default if they are inside the folder specified)
ZSH_CUSTOM=$DOTFILES

zplug "plugins/git",   from:oh-my-zsh, defer:1
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma-continuum/fast-syntax-highlighting", defer:2
zplug "so-fancy/diff-so-fancy", as:command, use:"diff-so-fancy"

# Load theme file
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

# Persist zsh history for auto completion
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

# create yourself when setting up :3
if [ -f "$HOME"/.secrets ]; then
  source "$HOME"/.secrets
fi

if [ -f "$HOME"/.aliases ]; then
  source "$HOME"/.aliases
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
# bun completions
[ -s "/Users/gmkonan/.bun/_bun" ] && source "/Users/gmkonan/.bun/_bun"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf
source <(fzf --zsh)
eval "$(zoxide init zsh)"
. "/Users/gmkonan/.deno/env"
