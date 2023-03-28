# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=$ZSH/custom

ZSH_THEME="spaceship"

plugins=(fast-syntax-highlighting zsh-autosuggestions zsh-completions)

source $ZSH/oh-my-zsh.sh

SPACESHIP_PROMPT_ORDER=(
  #user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  #vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

# source tokens and stuff
source "$HOME"/.secrets


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Flyctl paths
export FLYCTL_INSTALL="/home/gmkonan/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# Airplane paths
export AIRPLANE_INSTALL="/home/gmkonan/.airplane"
export PATH="$AIRPLANE_INSTALL/bin:$PATH"
