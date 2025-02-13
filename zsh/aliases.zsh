# lsd aliases
alias ls='lsd -A'

# zoxide aliases
alias cd='z'

# bat aliases
alias cat='bat'

# fzf aliases
alias sd='cd ~ && cd \$(find * -type d | fzf)'

# tmux aliases
# https://askubuntu.com/questions/868186/how-to-kill-all-tmux-sessions-or-at-least-multiple-sessions-from-the-cli
alias tn='tmux new -s ${PWD:t}'
alias tls='tmux list-sessions'
alias ta='tmux a'

# docker aliases
alias docker-nuke='sudo docker system prune -a --volumes'
