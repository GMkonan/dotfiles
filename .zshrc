# Path to dotfiles
export DOTFILES=$HOME/dotfiles
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
# romkatv/powerlevel10k

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

# fzf
# source <(fzf --zsh)

# zoxide init
eval "$(zoxide init zsh)"

# source $DOTFILES/zsh/*.zsh
for f ($DOTFILES/zsh/**/*.zsh(N.))  source $f
eval "$(oh-my-posh init zsh --config $DOTFILES/zsh/theme.omp.json)"
