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

ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

# https://github.com/mattmc3/zsh_unplugged#question-how-do-i-load-my-plugins-with-hypersonic-speed-rocket
# Zsh Plugins
function plugin-load {
  local repo plugdir initfile initfiles=()
  : ${ZPLUGINDIR:=${ZDOTDIR:-~/.config/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules \
        https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) || { echo >&2 "No init file '$repo'." && continue }
      ln -sf $initfiles[1] $initfile
    fi
    fpath+=$plugdir
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

repos=(
  # List plugins by order you want them to load
romkatv/powerlevel10k

so-fancy/diff-so-fancy

# Load those last
zsh-users/zsh-completions
zsh-users/zsh-autosuggestions
zdharma-continuum/fast-syntax-highlighting
  )

plugin-load $repos

unset ZSH_AUTOSUGGEST_USE_ASYNC

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
source "/Users/gmkonan/.deno/env"

source $DOTFILES/zsh/*.zsh
